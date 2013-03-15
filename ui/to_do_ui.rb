require './ui/common_ui'


def to_do_add
  puts "\nEnter the task you want to add to your To Do List:"
  name = gets.chomp
  todo = ToDo.create(:name => name, :done => false)
  "'#{todo.name.capitalize}'has been added to your To Do list."
end

def to_do_list
  todos = ToDo.all 
  puts "\nHere are ALL the tasks on your list:"
  todos.each_with_index do |todo, i|
    puts "\n#{i+1}. #{todo.name} #{' '*(40-todo.name.length)} #{todo.done ? 'DONE!' : '     '}"
    todo.stickies.each {|sticky| puts  "\tNOTE: #{sticky.try(:name)}"}
  end
  todos
end

def to_do_edit
  todos = to_do_list
  puts "\nWhich task would you like to edit?"
  index = gets.chomp.to_i-1
  unless index < 0
    todo = todos[index]
    puts "\nRename your task or enter to skip."
    name = gets.chomp
    name = todo.name if name == ''
    puts "\nEnter the task's status ('done' or 'not done')"
    status = gets.chomp
      if status == 'done'
        status = true
      elsif status == 'not done'
        status = false
      end
    todo.update_attributes(:name => name,:done => status)
    to_do_list
  else
    puts "\nThat was not a valid entry!"
    to_do_edit
  end
end
