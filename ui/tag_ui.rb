require './ui/common_ui'


def tag_add
  puts "\nEnter the tag you want to add:"
  name = gets.chomp
  tag = Tag.create(:name => name)
  "'#{tag.name.capitalize}' has been added."
end

def tag_list
  tags = Tag.all 
  puts "\nHere are ALL the tasks on your list:"
  tags.each_with_index do |tag, i|
    puts "\n#{i+1}. #{tag.name}"
    #tag.stickies.each {|sticky| puts  "\tNOTE: #{sticky.try(:name)}"}
  end
  tags
end

def tag_edit
  tags = tag_list
  puts "\nWhich task would you like to edit?"
  index = gets.chomp.to_i-1
  unless index < 0
    tag = tags[index]
    puts "\nRename your task or enter to cancel."
    name = gets.chomp
    name = tag.name if name == ''
    # puts "\nEnter the task's status ('done' or 'not done')"
    # status = gets.chomp
    #   if status == 'done'
    #     status = true
    #   elsif status == 'not done'
    #     status = false
    #   end
    tag.update_attributes(:name => name,:done => status)
    tag_list
  else
    puts "\nThat was not a valid entry!"
    tag_edit
  end
end
