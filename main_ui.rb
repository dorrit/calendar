require './ui_helper'

def menu
  choice = nil
  until choice == 'x'
    puts "\n\nWelcome to your amazing scheduler"
    puts "What would you like to do?"
    puts "'t' to add something to your To Do list"
    puts "'c' to add an event to your Calendar"
    puts "'x' to exit"
    choice = gets.chomp
    case choice
    when 'c'
      engagement_welcome
    when 't'
      to_do_welcome
    end
  end
end

menu