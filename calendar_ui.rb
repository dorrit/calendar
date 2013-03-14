require 'active_record'
require './lib/calendar'
require 'time'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to the Calendar!"
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add an event, 'l' to list events, or 'd' to delete an event, 'e' to edit an event."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add
    when 'l'
      list
    when 'd'
      delete
    when 'e'
      edit      
    end
  end
end

def add
  puts "Enter the time and date of an event (Example: 2012-12-30 3:30pm)"
  date_time = gets.chomp
  puts "Enter the name of the event:"
  event = gets.chomp
  calendar = Calendar.create(:date_time => date_time,:event => event)
  "'#{calendar.event.capitalize}'has been added to your To Do list."
end

def list
  calendars = Calendar.all 
  puts "Here are ALL the events:"
  calendars.each_with_index do |calendar, i|
    puts "  #{i+1}. #{calendar.date_time.strftime("%A, %B %e, %Y, %l:%M%P")}   #{calendar.event}"
  end
  calendars
end

def delete
  calendars = list
  puts "Which event number would you like to delete?"
  calendar = calendars[gets.chomp.to_i-1]
  if calendar.destroy
    puts "#{calendar.event} has been deleted"
  else
    puts "#{calendar.event} cannot be deleted"
  end
end

def 
  edit
  calendars = list
  puts "Which event would you like to edit?"  
  calendar = calendars[gets.chomp.to_i-1]
  puts "Enter a new date or enter to skip. (Example: 2012-12-30 3:30pm)"
  date_time = gets.chomp
  date_time = calendar.date_time if date_time == ''
  puts "Enter a new event name or enter to skip."
  event = gets.chomp
  event = calendar.event if event == ''
  calendar.update_attributes(:date_time => date_time, :event => event)

end

def invalid
  puts "Invalid input."
end


welcome