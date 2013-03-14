require 'rspec'
require 'active_record'
require 'shoulda-matchers'

require 'calendar'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Calendar.all.each {|item| item.destroy}
  end
end
