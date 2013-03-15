require './ui/common_ui'


def engagement_add
  puts "\nEnter the time and date of an event (Example: 06 Jun 2013 3:30pm)"
  date_time = gets.chomp
  puts "Enter the name of the event:"
  event = gets.chomp
  begin
    engagement = Engagement.create!(:date_time => date_time,:name => event)
    puts "'#{engagement.name.capitalize}' has been added to your To Do list."
  rescue
    puts 'NO! That ruins EVERYTHING. Enter a valid date, loser!'
    engagement_add
  end
end

def engagement_list
  engagements = Engagement.all 
  puts "Here are ALL the events:"
  engagements.each_with_index do |engagement, i|
    puts "  #{i+1}. #{engagement.date_time.strftime("%A, %B %e, %Y, %l:%M%P")}   #{engagement.name}"
  end
  engagements
end

def engagement_edit
  engagements = engagement_list
  puts "Which event would you like to edit?"  
  engagement = engagements[gets.chomp.to_i-1]
  puts "Enter a new date or enter to skip. (Example: 06 Jun 2013 3:30pm)"
  date_time = gets.chomp
  date_time = engagement.date_time if date_time == ''
  puts "Enter a new event name or enter to skip."
  event = gets.chomp
  event = engagement.name if event == ''
  engagement.update_attributes(:date_time => date_time, :name => event)

end