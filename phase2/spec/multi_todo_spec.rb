require "multi_todo"

RSpec.describe Todo do
  describe "#task" do
    context "given a task" do
      it "returns the task as a string" do
        todo = Todo.new("Wash the car.")
        expect(todo.task).to eq "Wash the car."
      end
    end
  end
end