module EnvironmentVariablesExample
  class Application < Rails::Application
    config.before_configuration do
      env_file = Rails.root.join("config", 'local_env.yml').to_s

      if File.exists?(env_file)
        YAML.load_file(env_file)[Rails.env] && YAML.load_file(env_file)[Rails.env].select{|key, val| ENV[key.to_s] = val}
      end # end if File.exists?
    end # end config.before_configuration
  end # end class
end # end module