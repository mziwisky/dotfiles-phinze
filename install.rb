require 'fileutils'

home        = File.expand_path('~')
backup_path = File.join(home, 'dotfiles_backups')

FileUtils.mkdir_p(backup_path)

def ignore?(filename) 
  ignored_files = ['.', '..', 'README', 'install.rb']
  ignored_files.include?(filename) || filename.match(/^.*\.swp/)
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

Dir.glob('*', File::FNM_DOTMATCH).each do |file|
  next if ignore?(file)
  
  target = File.join(home, build_target_filename(file))

  if File.exists?(target)
    name = File.basename(target)
    print "#{name} exists... "
    if File.symlink?(target)
      print "since it is a symlink, removing it... "
      FileUtils.rm(target)
    else
      print "backing it up to #{backup_path}... "
      FileUtils.mv(target, File.join(backup_path, name))
    end
  end
  puts "linking #{file}"
  `ln -vs #{File.expand_path file} #{target}`
end
