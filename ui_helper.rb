require 'active_record'
require './to_do_ui'
require './calendar_ui'

require './lib/to_do'
require './lib/engagement'


database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuration)
