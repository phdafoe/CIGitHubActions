# -*- encoding: utf-8 -*-
# stub: fastlane 1.92.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fastlane".freeze
  s.version = "1.92.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Felix Krause".freeze]
  s.date = "2016-05-31"
  s.description = "The easiest way to automate building and releasing your iOS and Android apps".freeze
  s.email = ["fastlane@krausefx.com".freeze]
  s.executables = ["fastlane".freeze, "\u{1F680}".freeze]
  s.files = ["bin/fastlane".freeze, "bin/\u{1F680}".freeze]
  s.homepage = "https://fastlane.tools".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.2.3".freeze
  s.summary = "The easiest way to automate building and releasing your iOS and Android apps".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<krausefx-shenzhen>.freeze, [">= 0.14.7"])
    s.add_runtime_dependency(%q<slack-notifier>.freeze, ["~> 1.3"])
    s.add_runtime_dependency(%q<xcodeproj>.freeze, [">= 0.20", "< 2.0.0"])
    s.add_runtime_dependency(%q<xcpretty>.freeze, [">= 0.2.1"])
    s.add_runtime_dependency(%q<terminal-notifier>.freeze, ["~> 1.6.2"])
    s.add_runtime_dependency(%q<terminal-table>.freeze, ["~> 1.4.5"])
    s.add_runtime_dependency(%q<plist>.freeze, ["~> 3.1.0"])
    s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.3"])
    s.add_runtime_dependency(%q<multipart-post>.freeze, ["~> 2.0.0"])
    s.add_runtime_dependency(%q<xcode-install>.freeze, ["~> 1.4.0"])
    s.add_runtime_dependency(%q<fastlane_core>.freeze, [">= 0.44.2", "< 1.0.0"])
    s.add_runtime_dependency(%q<credentials_manager>.freeze, [">= 0.16.0", "< 1.0.0"])
    s.add_runtime_dependency(%q<spaceship>.freeze, [">= 0.27.1", "< 1.0.0"])
    s.add_runtime_dependency(%q<deliver>.freeze, [">= 1.11.3", "< 2.0.0"])
    s.add_runtime_dependency(%q<snapshot>.freeze, [">= 1.12.1", "< 2.0.0"])
    s.add_runtime_dependency(%q<frameit>.freeze, [">= 2.6.2", "< 3.0.0"])
    s.add_runtime_dependency(%q<pem>.freeze, [">= 1.3.1", "< 2.0.0"])
    s.add_runtime_dependency(%q<cert>.freeze, [">= 1.4.1", "< 2.0.0"])
    s.add_runtime_dependency(%q<sigh>.freeze, [">= 1.8.0", "< 2.0.0"])
    s.add_runtime_dependency(%q<produce>.freeze, [">= 1.1.2", "< 2.0.0"])
    s.add_runtime_dependency(%q<gym>.freeze, [">= 1.6.3", "< 2.0.0"])
    s.add_runtime_dependency(%q<pilot>.freeze, [">= 1.7.0", "< 2.0.0"])
    s.add_runtime_dependency(%q<supply>.freeze, [">= 0.7.0", "< 1.0.0"])
    s.add_runtime_dependency(%q<scan>.freeze, [">= 0.7.1", "< 1.0.0"])
    s.add_runtime_dependency(%q<match>.freeze, [">= 0.6.0", "< 1.0.0"])
    s.add_runtime_dependency(%q<screengrab>.freeze, [">= 0.3.2", "< 1.0.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1.0"])
    s.add_development_dependency(%q<rspec_junit_formatter>.freeze, ["~> 0.2.3"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.8.7.4"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 1.19.0"])
    s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.38.0"])
    s.add_development_dependency(%q<rest-client>.freeze, ["~> 1.6.7"])
    s.add_development_dependency(%q<fakefs>.freeze, ["~> 0.8.1"])
  else
    s.add_dependency(%q<krausefx-shenzhen>.freeze, [">= 0.14.7"])
    s.add_dependency(%q<slack-notifier>.freeze, ["~> 1.3"])
    s.add_dependency(%q<xcodeproj>.freeze, [">= 0.20", "< 2.0.0"])
    s.add_dependency(%q<xcpretty>.freeze, [">= 0.2.1"])
    s.add_dependency(%q<terminal-notifier>.freeze, ["~> 1.6.2"])
    s.add_dependency(%q<terminal-table>.freeze, ["~> 1.4.5"])
    s.add_dependency(%q<plist>.freeze, ["~> 3.1.0"])
    s.add_dependency(%q<addressable>.freeze, ["~> 2.3"])
    s.add_dependency(%q<multipart-post>.freeze, ["~> 2.0.0"])
    s.add_dependency(%q<xcode-install>.freeze, ["~> 1.4.0"])
    s.add_dependency(%q<fastlane_core>.freeze, [">= 0.44.2", "< 1.0.0"])
    s.add_dependency(%q<credentials_manager>.freeze, [">= 0.16.0", "< 1.0.0"])
    s.add_dependency(%q<spaceship>.freeze, [">= 0.27.1", "< 1.0.0"])
    s.add_dependency(%q<deliver>.freeze, [">= 1.11.3", "< 2.0.0"])
    s.add_dependency(%q<snapshot>.freeze, [">= 1.12.1", "< 2.0.0"])
    s.add_dependency(%q<frameit>.freeze, [">= 2.6.2", "< 3.0.0"])
    s.add_dependency(%q<pem>.freeze, [">= 1.3.1", "< 2.0.0"])
    s.add_dependency(%q<cert>.freeze, [">= 1.4.1", "< 2.0.0"])
    s.add_dependency(%q<sigh>.freeze, [">= 1.8.0", "< 2.0.0"])
    s.add_dependency(%q<produce>.freeze, [">= 1.1.2", "< 2.0.0"])
    s.add_dependency(%q<gym>.freeze, [">= 1.6.3", "< 2.0.0"])
    s.add_dependency(%q<pilot>.freeze, [">= 1.7.0", "< 2.0.0"])
    s.add_dependency(%q<supply>.freeze, [">= 0.7.0", "< 1.0.0"])
    s.add_dependency(%q<scan>.freeze, [">= 0.7.1", "< 1.0.0"])
    s.add_dependency(%q<match>.freeze, [">= 0.6.0", "< 1.0.0"])
    s.add_dependency(%q<screengrab>.freeze, [">= 0.3.2", "< 1.0.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1.0"])
    s.add_dependency(%q<rspec_junit_formatter>.freeze, ["~> 0.2.3"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8.7.4"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.19.0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.38.0"])
    s.add_dependency(%q<rest-client>.freeze, ["~> 1.6.7"])
    s.add_dependency(%q<fakefs>.freeze, ["~> 0.8.1"])
  end
end
