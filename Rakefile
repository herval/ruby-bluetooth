require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/testtask'

require 'lib/bluetooth'

spec = Gem::Specification.new do |s| 
  s.name = "bluetooth"
  s.version = Bluetooth::VERSION
  s.author = "Herval Freire"
  s.email = "hervalfreire@gmail.com"
  s.homepage = "http://hervalicio.us"
  s.platform = Gem::Platform::RUBY
  s.summary = s.description = "Ruby Bluetooth Bindings"
  s.files = Dir["lib/**/*"].to_a
  s.require_path = ["lib"]
  # s.autorequire = "name"
  s.test_files = Dir["test/**/*test.rb"].to_a
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc"]
  # s.extensions << "ext/extconf.rb"
  # s.add_dependency("dependency", ">= 0.x.x")
end

task :gemspec do
  File.open('ruby-bluetooth.gemspec', 'w') do |file|
    file.write spec.to_ruby
  end
end


@windows = (PLATFORM =~ /win32/)
SUDO = @windows ? "" : (ENV["SUDO_COMMAND"] || "sudo")
NAME = "bluetooth"

task :install => [:gemspec] do
  sh %{rake package}
  sh %{#{SUDO} gem install pkg/#{NAME}-#{Bluetooth::VERSION} --no-rdoc --no-ri}
end

task :uninstall => [:clean] do
  sh %{#{SUDO} gem uninstall #{NAME}}
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  # pkg.need_tar = false
  pkg.gem_spec = spec
end

Rake::TestTask.new(:test) do |t|
  t.test_files = "test/**/*_test.rb"
  t.verbose = false
end


task :default => :test