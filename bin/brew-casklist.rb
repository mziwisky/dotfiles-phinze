BREW_CASK_PREFIX = `brew --prefix brew-cask`.chomp
$LOAD_PATH << File.join(BREW_CASK_PREFIX, 'rubylib')

require 'cask'

module CaskCategories
  CATEGORIES = {
    'adium' => 'chat',
    'rdio' => 'music',
    'firefox' => 'browser',
    'google-chrome' => 'browser'
  }
  def self.category_for(cask)
    CATEGORIES[cask.title] || 'no-category'
  end
end

puts "Here's a categorized list of casks:"

Cask.all.select(&:installed?).each do |cask|
  puts "cask: #{cask.title}, category: #{CaskCategories.category_for(cask)}"
end
