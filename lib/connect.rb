require "sequel/core"
require 'yaml'
require 'logger'

db_config_file = File.join(File.dirname(__FILE__), '..', "app", "database.yml")

if File.exist?(db_config_file)
  config = YAML.load(File.read(db_config_file))
  DB = Sequel.connect(config)
  DB.loggers << Logger.new($stdout)
  Sequel.extension :migration
end