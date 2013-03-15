require './ui/ui_helper'

NAMIFY = {'engagement' => 'Calendar', 'to_do' => 'To Do List', 'sticky' => 'Sticky Notes'}

def menu
  choice = nil
  until choice == 'x'
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\tWELCOME TO YOUR AMAZING SCHEDULER!!!!"
    puts "\nWhich of the following do you want to visit?"
    puts "\t't' for To Do list"
    puts "\t'c' for Calendar"
    puts "\t's' to put a sticky note on something"
    puts "\t'x' to exit"
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    choice = gets.chomp
    case choice
    when 'c'
      welcome('engagement')
    when 't'
      welcome('to_do')
    when 's'
      welcome('sticky')
    end
  end
end

def welcome(category)
  puts "\nWelcome to your incredible #{NAMIFY[category]}!"
  crud_menu(category)
end

def crud_menu(category)
  choice = nil
  until choice == 'x'
    puts "\nChoose one of the following:"
    puts "\t'a' to add"
    puts "\t'l' to list"
    puts "\t'd' to delete"
    puts "\t'e' to edit"
    puts "\t'x' to exit\n\n"
    choice = gets.chomp
    case choice
    when 'a'
      send("#{category}_add")
    when 'l'
      send("#{category}_list")
    when 'd'
      delete(send("#{category}_list"))
    when 'e'
      send("#{category}_edit")   
    end
  end
end

menu