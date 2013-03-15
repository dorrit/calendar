def delete(item_list)
  puts "Which number would you like to delete?"
  item = item_list[gets.chomp.to_i-1]
  if item.destroy
    puts "#{item.name} has been deleted"
  else
    puts "#{item.name} cannot be deleted"
  end
end


def crud_menu
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
      engagement_add
    when 'l'
      engagement_list
    when 'd'
      delete(engagement_list)
      #engagement_delete
    when 'e'
      engagement_edit      
    end
  end
end