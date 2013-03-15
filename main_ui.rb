require './ui/ui_helper'

NAMIFY = {'engagement' => 'Calendar', 'to_do' => 'To Do List', 'sticky' => 'Sticky Notes'}

def menu
  choice = nil
  until choice == 'x'
    puts "\n\nWelcome to your amazing scheduler!"
    puts "\n\nWhich of the following do you want to visit?"
    puts "'t' for To Do list"
    puts "'c' for Calendar"
    puts "'s' to put a sticky note on something"
    puts "'x' to exit"
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
  puts "\n\nWelcome to your incredible and amazing #{NAMIFY[category]}!"
  crud_menu(category)
end

def crud_menu(category)
  choice = nil
  until choice == 'x'
    puts "Choose one of the following:"
    puts "'a' to add"
    puts "'l' to list"
    puts "'d' to delete"
    puts "'e' to edit"
    puts "'x' to exit\n\n"
    choice = gets.chomp
    case choice
    when 'a'
      send("#{category}_add")
    when 'l'
      send("#{category}_list")
    when 'd'
      send("#{category}_delete")
      #engagement_delete
    when 'e'
      send("#{category}_edit")   
    end
  end
end

menu