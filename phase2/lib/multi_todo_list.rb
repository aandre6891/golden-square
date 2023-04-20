class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo)
    @todo_list << todo
  end

  def incomplete
    @todo_list.select do |todo|
      todo.done? == false
    end
  end

  def complete
    @todo_list.select do |todo|
      todo.done? == true
    end
  end

  def give_up!
    @todo_list.each do |todo|
      todo.mark_done!
    end
  end
end

