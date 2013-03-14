def to_do_welcome
  puts "\n\nWelcome to your fancy To Do List!"
  to_do_menu
end


def to_do_menu
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add a task, 'l' to list all your tasks, or 'd' to delete a task, 'e' to edit a task."
    puts "Press 'x' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      to_do_add
    when 'l'
      to_do_list
    when 'd'
      to_do_delete
    when 'e'
      to_do_edit  
    when 'm'    
      to_do_mark
    end
  end
end

def to_do_add
  puts "Enter the task you want to add to your To Do List:"
  task = gets.chomp
  todo = ToDo.create(:task => task, :done => false)
  "'#{todo.task.capitalize}'has been added to your To Do list."
end

def to_do_list
  todos = ToDo.all 
  puts "Here are ALL the tasks on your list:"
  todos.each_with_index do |todo, i|
    puts "  #{i+1}. #{todo.task} \t #{todo.done ? 'DONE!' : ' '}"
  end
  todos
end

def to_do_delete
  todos = to_do_list
  puts "Which task number would you like to delete?"
  todo = todos[gets.chomp.to_i-1]
  if todo.destroy
    puts "#{todo.task} has been deleted"
  else
    puts "#{todo.task} cannot be deleted"
  end
  puts "\n\nYour To Do List is now this:"
  to_do_list
end

def to_do_edit
  todos = to_do_list
  puts "Which task would you like to edit?"
  todo = todos[gets.chomp.to_i-1]
  puts "Rename your task or enter to skip."
  task = gets.chomp
  task = todo.task if task == ''
  puts "Enter the task's status ('done' or 'not done')"
  status = gets.chomp
    if status == 'done'
      status = true
    elsif status == 'not done'
      status = false
    end
  todo.update_attributes(:task => task,:done => status)
  to_do_list
end

def to_do_invalid
  puts "Invalid input."
end
