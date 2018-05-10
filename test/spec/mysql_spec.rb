require 'spec_helper'

describe 'Dockerfile' do
  image_name = 'mysql'
  dockerfile_path = File.dirname(__FILE__) + "/../../src/#{image_name}"
  versions = ['5.7']
  env = {
    MYSQL_DATABASE: 'sandbox',
    MYSQL_USER: 'mysql',
    MYSQL_PASSWORD: 'mysql',
    MYSQL_ROOT_PASSWORD: 'root'
  }

  versions.each do |version|
    describe docker_build("#{dockerfile_path}/#{version}") do
      describe docker_run(described_image, env: env) do
        describe command('mysql -V') do
          its(:stdout) { should include(version) }
        end
      end
    end
  end
end
