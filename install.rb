require 'fileutils'
require 'erb'

home        = File.expand_path('~')
backup_path = File.join(home, 'dotfiles_backups')

FileUtils.mkdir_p(backup_path)


@filename_formats = [
  {:pattern => /^\./, :munge => lambda { |x| x }},
  {:pattern => /^dot\_/, :munge => lambda { |x| x.gsub(/dot\_/, '.') }}
]
@ignored_files = ['.', '..', 'README', '.git', 'install.rb', '.gitignore', 'X11']

def recognized_format?(filename)
  @filename_formats.any? { |ff| ff[:pattern].match filename }
end

def ignore?(filename) 
  [
    @ignored_files.include?(filename),
    filename.match(/^.*\.swp/),
    !recognized_format?(filename)
  ].any?
end

def build_target_filename(filename)
  case filename
  when /^\..*$/     # starts with '.', leave it
    filename
  when /^dot\_.*/   # starts with 'dot_', convert to '.'
    filename.gsub(/dot\_/, '.')
  else              # does not start with dot, add one
    '.' + filename
  end
end

# these two are crucial for ERB binding below
def user(name)
  `gpgpass #{name} user`
end

def pass(name)
  `gpgpass #{name} pass`
end


Dir.glob('**/*', File::FNM_DOTMATCH).each do |file|
  next if ignore?(file)
  
  target = File.join(home, build_target_filename(file))

  if file.match(/\.erb$/)
    new_file = File.join(File.dirname(file), File.basename(file, '.erb'))
    puts "generating #{new_file}"
    File.open(new_file, 'w') do |f|
      f.write ERB.new(File.read(file)).result(binding)
    end 
  end
end

Dir.glob('*', File::FNM_DOTMATCH).each do |file|
  next if ignore?(file) || file.match(/\.erb$/)
  
  target = File.join(home, build_target_filename(file))

  if file.match(/\.erb$/)
    new_file = File.join(File.dirname(file), File.basename(file, 'erb'))
    puts "generating #{new_file}"
    File.open(new_file, 'w') do |f|
      f.write ERB.new(File.read(file)).result(binding)
    end 
    file = new_file
  end

  if File.exists?(target)
    name = File.basename(target)
    print "#{name} exists... "
    if File.symlink?(target)
      print "since it is a symlink, removing it... "
      FileUtils.rm(target)
    # elsif diff target source
    else
      print "backing it up to #{backup_path}... "
      FileUtils.mv(target, File.join(backup_path, name))
    end
  end

  puts "linking #{file} at #{target}"
  `ln -vs #{File.expand_path file} #{target}`
end
