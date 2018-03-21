require 'spec_helper'

describe 'Dockerfile' do
  image_name = 'php-cli'
  dockerfile_path = File.dirname(__FILE__) + "/../../src/#{image_name}"
  versions = ['7.0', '7.1', '7.2']
  php_modules = %w[memcached redis apcu]

  versions.each do |version|
    describe docker_build("#{dockerfile_path}/#{version}") do
      describe docker_run(described_image), retry: 30 do
        describe command('php -v'), retry: 1 do # disable retries here
          its(:stdout) { should include(version) }
        end

        php_modules.each do |php_module|
          describe command("php -i | grep #{php_module}") do
            its(:stdout) { should include(php_module) }
          end
        end
      end
    end
  end
end
