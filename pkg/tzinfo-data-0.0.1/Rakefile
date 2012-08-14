# Available options:
#
# rake package - Builds packages for distribution.
# rake rdoc - Builds API documentation in doc dir.
# rake build_tz_modules - Builds Timezone modules and the Country index. 
#   Expects to find source data in ./data.
# rake build_tz_module zone=Zone/Name - Builds a single Timezone module. 
#   Expects to find source data in ./data.
# rake build_countries - Builds the Country index.
#   Expects to find source data in ./data.
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'fileutils'

PKG_VERSION = "0.0.1"
PKG_FILES = FileList[
  'CHANGES',
  'LICENSE',
  'Rakefile',
  'README',
  'doc/**/*',
  'lib/**/*',
  'data/**/*',
  'test/*'
]

RDOC_OPTIONS = %w[--exclude definitions --exclude indexes]
RDOC_EXTRA_FILES = %w[README CHANGES]

SPEC = Gem::Specification.new do |s|
  s.name = "tzinfo-data"
  s.version = PKG_VERSION
  s.author = "Philip Ross"
  s.email = "phil.ross@gmail.com"
  s.homepage = "http://tzinfo-data.rubyforge.org/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Cross-platform database for timezone library tzinfo"  
  s.description = "This gem contains tzdata library in form of Ruby modules. It is meant to be used with tzinfo
                   if zoneinfo database is not present on your machine."
  s.require_path = "lib"
  s.files = PKG_FILES.delete_if do |item|
    item.include?(".svn")
  end
  s.has_rdoc = true
  s.extra_rdoc_files = RDOC_EXTRA_FILES
  s.rdoc_options = RDOC_OPTIONS
  s.rubyforge_project = "tzinfo-data"
end

Rake::TestTask.new('test') do |t|
  # Force a particular timezone to be local (helps find issues when local
  # timezone isn't GMT). This won't work on Windows.
  ENV['TZ'] = 'America/Los_Angeles'

  t.libs << 'test'
  t.pattern = 'test/tc_*.rb'
  t.verbose = true
end

Rake::GemPackageTask.new(SPEC) do |pkg|
  pkg.need_zip = true
  pkg.need_tar_gz = true
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title = "TZInfo::Data"
  rdoc.options << '--inline-source'
  rdoc.options.concat RDOC_OPTIONS
  rdoc.rdoc_files.include(*RDOC_EXTRA_FILES) 
  rdoc.rdoc_files.include('lib')  
end

task :build_tz_modules do
  require 'lib/tzdataparser'
  p = TZInfo::TZDataParser.new('./data', './lib')
  p.execute       
end

task :build_tz_module do
  require 'lib/tzdataparser'
  p = TZInfo::TZDataParser.new('./data', './lib')
  p.generate_countries = false
  p.only_zones = [ENV['zone']]
  p.execute
end

task :build_countries do
  require 'lib/tzdataparser'
  p = TZInfo::TZDataParser.new('./data', './lib')
  p.generate_countries = true
  p.generate_zones = false
  p.execute
end
