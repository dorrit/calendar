require 'active_record'
require 'active_resource'
require 'active_support'
require './ui/to_do_ui'
require './ui/calendar_ui'
require './ui/sticky_ui'
require './ui/tag_ui'

require './lib/to_do'
require './lib/engagement'
require './lib/sticky'
require './lib/tag'
require './lib/taggable_tag'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuration)


