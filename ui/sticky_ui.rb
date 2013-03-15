require './ui/common_ui'

def sticky_add
  puts "Enter the sticky you want to add:"
  name = gets.chomp
  puts "\nWhere would you like to stick it?"
  items = pick_list
  puts "\nPick the one you would like to move the sticky to."
  new_stickable = items[gets.chomp.to_i-1]
  sticky = Sticky.create(:name => name, :stickable => new_stickable)
  puts "\n'#{sticky.name.capitalize}'has been added to your To Do list."
end

def sticky_list
  stickies = Sticky.all 
  puts "Here are ALL the stickies:"
  stickies.each_with_index do |sticky, i|
    puts "  #{i+1}. #{sticky.stickable.try(:name)} \n \t NOTE: #{sticky.name}\n\n "
  end
  stickies
end

def sticky_edit
  stickies = sticky_list
  puts "Which sticky would you like to edit?"
  sticky = stickies[gets.chomp.to_i-1]
  puts "Rename your sticky or enter to skip."
  sticky_name = gets.chomp
  sticky_name = sticky.name if sticky_name == ''
  puts "Would you like to move the sticky somewhere else? (y/n)"
  if gets.chomp == 'y'
    items = pick_list
    puts 'Pick the one you would like to move the sticky to.'
    new_stickable = items[gets.chomp.to_i-1]
    sticky.update_attributes(:name => sticky_name, :stickable => new_stickable)
  else
    sticky.update_attributes(:name => sticky_name)
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
