# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fixed_width-multibyte}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Timon Karnezos"]
  s.date = %q{2011-05-21}
  s.description = %q{A gem that provides a DSL for parsing and writing files of fixed-width records.

Multibyte support added while Timon is on vacation.

Shamelessly forked from ryanwood/slither [http://github.com/ryanwood/slither].

Renamed the gem to be a little clearer as to its purpose. Hate that 'nokogiri' nonsense.
}
  s.email = %q{timon.karnezos@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown",
    "TODO"
  ]
  s.files = [
    "COPYING",
    "HISTORY",
    "README.markdown",
    "Rakefile",
    "TODO",
    "VERSION",
    "examples/readme_example.rb",
    "fixed_width-multibyte.gemspec",
    "fixed_width.gemspec",
    "lib/fixed_width.rb",
    "lib/fixed_width/column.rb",
    "lib/fixed_width/core_ext/symbol.rb",
    "lib/fixed_width/definition.rb",
    "lib/fixed_width/fixed_width.rb",
    "lib/fixed_width/generator.rb",
    "lib/fixed_width/parser.rb",
    "lib/fixed_width/section.rb",
    "spec/column_spec.rb",
    "spec/definition_spec.rb",
    "spec/fixed_width_spec.rb",
    "spec/generator_spec.rb",
    "spec/parser_spec.rb",
    "spec/section_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/timonk/fixed_width}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A gem that provides a DSL for parsing and writing files of fixed-width records.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end

