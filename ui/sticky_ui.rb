require './ui/common_ui'

def sticky_add
  puts "\nEnter the sticky you want to add:"
  name = gets.chomp
  puts "\nWhere would you like to stick it?"
  items = pick_list
  puts "\nPick the one you would like to move the sticky to."
  index = gets.chomp.to_i-1
  unless index < 0
    new_stickable = items[index]
    p new_stickable
    p index
    sticky = Sticky.create(:name => name, :stickable => new_stickable)
    puts "\n'#{sticky.name.capitalize}'has been added."
  else
    puts "\nI'm tired of your bad decisions. Let's enter something else."
    sticky_add
  end
end

def sticky_list
  stickies = Sticky.all 
  puts "\nHere are ALL the stickies:"
  stickies.each_with_index do |sticky, i|
    puts "  #{i+1}. #{sticky.stickable.try(:class)}: #{sticky.stickable.try(:name)} \n \t NOTE: #{sticky.name}\n\n "
  end
  stickies
end

def sticky_edit
  stickies = sticky_list
  puts "\nWhich sticky would you like to edit?"
  index = gets.chomp.to_i-1
  unless index < 0
    sticky = stickies[index]
    puts "\nRename your sticky or enter to skip."
    sticky_name = gets.chomp
    sticky_name = sticky.name if sticky_name == ''
    puts "\nWould you like to move the sticky somewhere else? (y/n)"
    if gets.chomp == 'y'
      items = pick_list
      puts "\nPick the one you would like to move the sticky to."
      new_stickable = items[gets.chomp.to_i-1]
      sticky.update_attributes(:name => sticky_name, :stickable => new_stickable)
    else
      sticky.update_attributes(:name => sticky_name)
    end
  else
    puts "\nI told you to choose a number!  You gave me gobbledigook"
    sticky_edit
  end
end

def pick_list
  puts "\nPick one of the following:"
  puts "\t'c' to list all the events in your Calendar"
  puts "\t't' to list everything in your To Do List"
  choice = gets.chomp
  if choice == 'c'
    list = engagement_list
  elsif choice == 't'
    list = to_do_list
  else
    puts "\nWRONG CHOICE. Try again!"
    pick_list
  end
end
