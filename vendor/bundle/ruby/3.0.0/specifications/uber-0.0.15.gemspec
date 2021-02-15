# -*- encoding: utf-8 -*-
# stub: uber 0.0.15 ruby lib

Gem::Specification.new do |s|
  s.name = "uber".freeze
  s.version = "0.0.15"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Sutterer".freeze]
  s.date = "2015-09-01"
  s.description = "A gem-authoring framework.".freeze
  s.email = ["apotonick@gmail.com".freeze]
  s.homepage = "https://github.com/apotonick/uber".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Gem-authoring tools like class method inheritance in modules, dynamic options and more.".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, [">= 0.10.1"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 5.0.0"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 0.10.1"])
    s.add_dependency(%q<minitest>.freeze, [">= 5.0.0"])
  end
end
