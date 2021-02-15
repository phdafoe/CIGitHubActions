# -*- encoding: utf-8 -*-
# stub: snapshot 1.16.4 ruby lib

Gem::Specification.new do |s|
  s.name = "snapshot".freeze
  s.version = "1.16.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Felix Krause".freeze]
  s.date = "2016-11-21"
  s.description = "Automate taking localized screenshots of your iOS and tvOS apps on every device".freeze
  s.email = ["snapshot@krausefx.com".freeze]
  s.executables = ["snapshot".freeze]
  s.files = ["bin/snapshot".freeze]
  s.homepage = "https://fastlane.tools".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Automate taking localized screenshots of your iOS and tvOS apps on every device".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<fastimage>.freeze, ["~> 1.6.3"])
    s.add_runtime_dependency(%q<fastlane_core>.freeze, [">= 0.57.0", "< 1.0.0"])
    s.add_runtime_dependency(%q<xcpretty>.freeze, [">= 0.2.4", "< 1.0.0"])
    s.add_runtime_dependency(%q<plist>.freeze, [">= 3.1.0", "< 4.0.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1.0"])
    s.add_development_dependency(%q<rspec_junit_formatter>.freeze, ["~> 0.2.3"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.8.7.4"])
    s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_development_dependency(%q<fastlane>.freeze, [">= 0"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 1.19.0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.44.0"])
  else
    s.add_dependency(%q<fastimage>.freeze, ["~> 1.6.3"])
    s.add_dependency(%q<fastlane_core>.freeze, [">= 0.57.0", "< 1.0.0"])
    s.add_dependency(%q<xcpretty>.freeze, [">= 0.2.4", "< 1.0.0"])
    s.add_dependency(%q<plist>.freeze, [">= 3.1.0", "< 4.0.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1.0"])
    s.add_dependency(%q<rspec_junit_formatter>.freeze, ["~> 0.2.3"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8.7.4"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<fastlane>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.19.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.44.0"])
  end
end
