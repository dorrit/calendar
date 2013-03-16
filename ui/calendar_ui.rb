require './ui/common_ui'


def engagement_add
  puts "\n Enter the time and date of an event (Example: 06 Jun 2013 3:30pm)"
  date_time = gets.chomp
  puts "\n Enter the name of the event:"
  event = gets.chomp
  begin
    engagement = Engagement.create!(:date_time => date_time,:name => event)
    puts "'#{engagement.name.capitalize}' has been added to your To Do list."
  rescue
    puts "\n NO! That ruins EVERYTHING. Enter a valid date, loser!"
    engagement_add
  end
end

def engagement_mark
  puts "Coming soon!"
end

def engagement_list
  engagements = Engagement.all 
  puts "\nHere are ALL the events:"
  engagements.each_with_index do |engagement, i|
    puts " \n #{i+1}. #{engagement.date_time.strftime("%A, %B %e, %Y, %l:%M%P")}   #{engagement.name}"
    engagement.stickies.each {|sticky| puts  "\tNOTE: #{sticky.try(:name)}"}
  end
  engagements
end
def engagement_edit
  engagements = engagement_list
  puts "\nWhich event would you like to edit?" 
  index = gets.chomp.to_i-1 
  unless index < 0
    engagement = engagements[index] 
    puts "\nEnter a new date or enter to skip. (Example: 06 Jun 2013 3:30pm)"
    date_time = gets.chomp
    date_time = engagement.date_time if date_time == ''
    puts "\nEnter a new event name or enter to skip."
    event = gets.chomp
    event = engagement.name if event == ''
    engagement.update_attributes(:date_time => date_time, :name => event)
  else 
    puts "\nCan't you read the directions!?!  Try again."
    engagement_edit
  end

end