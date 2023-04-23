require "task_list"
require "task"

RSpec.describe "tasks integration" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  context "when the task is completed" do
    it "it returns the task with the tick" do
      task = Task.new("wash the car")
      task_formatter = TaskFormatter.new(task)
      task.mark_complete
      expect(task_formatter.format).to eq("- [x] wash the car")
    end
  end

  context "when the task is not complete" do
    it "it returns the task without the tick" do
      task = Task.new("wash the car")
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq("- [ ] wash the car")
    end
  end
end
