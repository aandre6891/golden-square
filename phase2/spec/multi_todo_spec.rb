require "multi_todo"

RSpec.describe Todo do
  describe "#task" do
    context "given a task" do
      it "returns the task" do
        todo = Todo.new("Wash the car.")
        expect(todo.task).to eq "Wash the car."
      end
    end
  end

  describe "#mark_done!" do
    context "given a task and completed it" do
      it "sets the variable @done as true" do
        todo = Todo.new("Wash the car.")
        todo.mark_done!
        expect(todo.done?).to eq true
      end
    end
  end

  describe "#done?" do
    context "when you do a task" do
      it "returns true" do
        todo = Todo.new("Wash the car.")
        expect(todo.done?).to eq false
      end
    end
  end
end