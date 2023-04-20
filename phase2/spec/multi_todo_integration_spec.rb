require "multi_todo"
require "multi_todo_list"

RSpec.describe "integration" do
  context "when we add new tasks" do
    it "returns the list of tasks" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Wash the car.")
      todo_2 = Todo.new("Go to the market")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.incomplete).to eq [todo_1, todo_2]
    end
  end
end
