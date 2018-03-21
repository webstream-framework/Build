require 'spec_helper'

describe 'Dockerfile' do
  image_name = 'postgres'
  dockerfile_path = File.dirname(__FILE__) + "/../../src/#{image_name}"
  env = {
    POSTGRES_USER: 'postgres',
    POSTGRES_PASSWORD: 'postgres'
  }

  describe docker_build(dockerfile_path) do
    describe docker_run(described_image, env: env) do
      describe command('psql --version') do
        its(:stdout) { should match(/9\.6/) }
      end
    end
  end
end
