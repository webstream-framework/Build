require 'spec_helper'

describe 'Dockerfile' do
  image_name = 'mysql'
  dockerfile_path = File.dirname(__FILE__) + "/../../src/#{image_name}"
  env = {
    MYSQL_DATABASE: 'sandbox',
    MYSQL_USER: 'mysql',
    MYSQL_PASSWORD: 'mysql',
    MYSQL_ROOT_PASSWORD: 'root'
  }

  describe docker_build(dockerfile_path) do
    describe docker_run(described_image, env: env) do
      describe command('mysql -V') do
        its(:stdout) { should match(/5\.7/) }
      end
    end
  end
end
