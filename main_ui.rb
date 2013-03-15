require './ui_helper'

def menu
  choice = nil
  until choice == 'x'
    puts "\n\nWelcome to your amazing scheduler!"
    puts "\n\nWhat would you like to do?"
    puts "'t' for To Do list"
    puts "'c' for Calendar"
    puts "'s' to put a sticky note on something"
    puts "'x' to exit"
    choice = gets.chomp
    case choice
    when 'c'
      engagement_welcome
    when 't'
      to_do_welcome
    when 's'
      sticky_welcome
    end
  end
end

menu