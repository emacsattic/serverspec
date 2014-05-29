require 'spec_helper'

resource_type_dir = File.join(File.dirname(__FILE__), *%w[.. .. serverspec lib serverspec type])
snippets_resource_type_dir = File.join(File.dirname(__FILE__), *%w[.. .. .. snippets text-mode serverspec ResourceTypes])

RSpec.describe 'ResourceType' do
  Dir::open(resource_type_dir).each {|f|
    next if f == "." || f == ".." || f == "base.rb"
    resource_type_name = File.basename(f, ".rb")
    it "snippets exits" do
      expect(File).to exist(File.join(snippets_resource_type_dir, resource_type_name))
    end
  }
end