require 'spec_helper'

describe 'Dockerfile' do
  image_name = 'postgres'
  dockerfile_path = File.dirname(__FILE__) + "/../../src/#{image_name}"
  versions = ['9.6', '10.3']
  env = {
    POSTGRES_USER: 'postgres',
    POSTGRES_PASSWORD: 'postgres'
  }

  versions.each do |version|
    describe docker_build("#{dockerfile_path}/#{version}") do
      describe docker_run(described_image, env: env) do
        describe command('psql --version') do
          its(:stdout) { should include(version) }
        end
      end
    end
  end
end
