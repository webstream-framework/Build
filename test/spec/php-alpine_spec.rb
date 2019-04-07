require 'spec_helper'

describe 'Dockerfile' do
  image_name = 'php-alpine'
  dockerfile_path = File.dirname(__FILE__) + "/../../src/#{image_name}"
  versions = ['7.1', '7.2', '7.3']

  versions.each do |version|
    describe docker_build(path: "#{dockerfile_path}/#{version}", tag: "dockerspec/php:#{version}") do
      describe docker_run(described_image), retry: 30 do
        describe command('php -v'), retry: 1 do # disable retries here
          its(:stdout) { should include(version) }
        end
      end
    end
  end
end
