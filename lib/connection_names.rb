module TodoDbCharmer
  module ConnectionNames
    def self.all(default_indicator = nil)
      config_file = File.read(Rails.root.join("config/database.yml"))
      config = YAML.load(config_file)[Rails.env]
      names = []
      names << default_indicator if config.has_key?("database")
      names += config.select{|k,v| v.is_a?(Hash)}.keys
    end
  end
end
