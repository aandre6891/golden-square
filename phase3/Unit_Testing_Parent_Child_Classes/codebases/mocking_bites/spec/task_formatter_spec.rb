require "task_formatter"

RSpec.describe TaskFormatter do
  context "when the task is not completed" do
    it "it returns the task without the tick" do
      task = double :task, title: "wash the car", complete?: false
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq("- [ ] wash the car")
    end
  end

  context "when the task is completed" do
    it "it returns the task with the tick" do
      task = double :task, title: "wash the car", complete?: true
      task_formatter = TaskFormatter.new(task)
      expect(task_formatter.format).to eq("- [x] wash the car")
    end
  end
end