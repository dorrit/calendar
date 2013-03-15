require './ui/common_ui'


def to_do_add
  puts "Enter the task you want to add to your To Do List:"
  name = gets.chomp
  todo = ToDo.create(:name => name, :done => false)
  "'#{todo.name.capitalize}'has been added to your To Do list."
end

def to_do_list
  todos = ToDo.all 
  puts "Here are ALL the tasks on your list:"
  todos.each_with_index do |todo, i|
    puts "  #{i+1}. #{todo.name} \t #{todo.done ? 'DONE!' : ' '}"
  end
  todos
end

def to_do_edit
  todos = to_do_list
  puts "Which task would you like to edit?"
  todo = todos[gets.chomp.to_i-1]
  puts "Rename your task or enter to skip."
  name = gets.chomp
  name = todo.name if name == ''
  puts "Enter the task's status ('done' or 'not done')"
  status = gets.chomp
    if status == 'done'
      status = true
    elsif status == 'not done'
      status = false
    end
  todo.update_attributes(:name => name,:done => status)
  to_do_list
end
