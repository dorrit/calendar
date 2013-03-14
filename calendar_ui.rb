

def engagement_welcome
  puts "\n\nWelcome to the Engagement!"
  engagement_menu
end

def engagement_menu
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add an event, 'l' to list events, or 'd' to delete an event, 'e' to edit an event."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      engagement_add
    when 'l'
      engagement_list
    when 'd'
      engagement_delete
    when 'e'
      engagement_edit      
    end
  end
end

def engagement_add
  puts "Enter the time and date of an event (Example: 2012-12-30 3:30pm)"
  date_time = gets.chomp
  puts "Enter the name of the event:"
  event = gets.chomp
  engagement = Engagement.create(:date_time => date_time,:name => event)
  "'#{engagement.name.capitalize}'has been added to your To Do list."
end

def engagement_list
  engagements = Engagement.all 
  puts "Here are ALL the events:"
  engagements.each_with_index do |engagement, i|
    puts "  #{i+1}. #{engagement.date_time.strftime("%A, %B %e, %Y, %l:%M%P")}   #{engagement.name}"
  end
  engagements
end

def engagement_delete
  engagements = list
  puts "Which event number would you like to delete?"
  engagement = engagements[gets.chomp.to_i-1]
  if engagement.destroy
    puts "#{engagement.name} has been deleted"
  else
    puts "#{engagement.name} cannot be deleted"
  end
end

def engagement_edit
  engagements = list
  puts "Which event would you like to edit?"  
  engagement = engagements[gets.chomp.to_i-1]
  puts "Enter a new date or enter to skip. (Example: 2012-12-30 3:30pm)"
  date_time = gets.chomp
  date_time = engagement.date_time if date_time == ''
  puts "Enter a new event name or enter to skip."
  event = gets.chomp
  event = engagement.name if event == ''
  engagement.update_attributes(:date_time => date_time, :name => event)

end

def engagement_invalid
  puts "Invalid input."
end