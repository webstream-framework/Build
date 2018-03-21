require 'spec_helper'

describe 'Dockerfile' do
  image_name = 'sqlite'
  dockerfile_path = File.dirname(__FILE__) + "/../../src/#{image_name}"

  describe docker_build(dockerfile_path) do
    describe docker_run(described_image) do
      describe command('sqlite3 --version') do
        its(:stdout) { should match(/3\.21/) }
      end
    end
  end
end
