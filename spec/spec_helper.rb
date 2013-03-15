require 'rspec'
require 'active_record'
require 'shoulda-matchers'

require 'engagement'
require 'to_do'
require 'sticky'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Engagement.all.each {|item| item.destroy}
  end
end
