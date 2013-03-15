def delete(item_list)
  puts "\nWhich number would you like to delete?"
  index = gets.chomp.to_i-1
  unless index < 0
    item = item_list[index]
    if item.destroy
      puts "\n#{item.name} has been deleted"
    else
      puts "\n#{item.name} cannot be deleted"
    end
  else
    puts "\nNO! That's WRONG. Try again."
    delete(item_list)
  end
end