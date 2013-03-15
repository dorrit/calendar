def sticky_welcome
  puts "\nWelcome to your incredible sticky note function (move over PostIts!)!"
  sticky_menu
end


def sticky_menu
  choice = nil
  until choice == 'x'
    puts "\nPress 'a' to add a note, 'l' to list all your notes, or 'd' to delete a note, 'e' to edit a note."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      sticky_add
    when 'l'
      sticky_list
    when 'd'
      sticky_delete
    when 'e'
      sticky_edit  
    when 'm'    
      sticky_mark
    end
    puts "\n\n"
  end
end

def sticky_add
  puts "Enter the sticky you want to add:"
  note = gets.chomp
  puts "\nWhere would you like to stick it?"
  items = pick_list
  puts "\nPick the one you would like to move the sticky to."
  new_stickable = items[gets.chomp.to_i-1]
  sticky = Sticky.create(:note => note, :stickable => new_stickable)
  puts "\n'#{sticky.note.capitalize}'has been added to your To Do list."
end

def sticky_list
  stickies = Sticky.all 
  puts "Here are ALL the stickies:"
  stickies.each_with_index do |sticky, i|
    puts "  #{i+1}. #{sticky.stickable.try(:name)} \n \t NOTE: #{sticky.note}\n\n "
  end
  stickies
end

def sticky_delete
  stickies = sticky_list
  puts "Which sticky number would you like to delete?"
  sticky = stickies[gets.chomp.to_i-1]
  if sticky.destroy
    puts "#{sticky.note} has been deleted"
  else
    puts "#{sticky.note} cannot be deleted"
  end
  puts "\nYour stickies now look like this:"
  sticky_list
end

def sticky_edit
  stickies = sticky_list
  puts "Which sticky would you like to edit?"
  sticky = stickies[gets.chomp.to_i-1]
  puts "Rename your sticky or enter to skip."
  sticky_name = gets.chomp
  sticky_name = sticky.note if sticky_name == ''
  puts "Would you like to move the sticky somewhere else? (y/n)"
  if gets.chomp == 'y'
    items = pick_list
    puts 'Pick the one you would like to move the sticky to.'
    new_stickable = items[gets.chomp.to_i-1]
    sticky.update_attributes(:note => sticky_name, :stickable => new_stickable)
  else
    sticky.update_attributes(:note => sticky_name)
  end
end

def pick_list
  puts "Enter 'c' to list everything in your calendar, 't' to list everything in your to do's"
  choice = gets.chomp
  if choice == 'c'
    list = engagement_list
  elsif choice == 't'
    list = to_do_list
  end
end

def sticky_invalid
  puts "Invalid input."
end
