require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  context "when we add some tasks" do
    it "returns a list of all the tasks" do
      task_list = TaskList.new
      task_1 = double :FakeTask, title: "my task"
      task_2 = double :FakeTask, title: "my task"
      task_list.add(task_1)
      task_list.add(task_2)
      expect(task_list.all).to eq [task_1, task_2]
    end
  end
  # Unit test `#all` and `#all_complete?` behaviour
  describe "#all_complete?" do
    context "when all tasks are complete" do
      it "returns false" do
        task_list = TaskList.new
        expect(task_list.all_complete?).to eq false
      end
    end

    context "when all the tasks are complete" do
      it "it returns true" do
        task_list = TaskList.new
        task_1 = double :FakeTask, title: "my task"
        expect(task_1).to receive(:complete?).and_return(true)
        task_list.add(task_1)
        expect(task_list.all_complete?).to eq true
      end
    end

    context "when there are uncomplete tasks" do
      it "it returns false" do
        task_list = TaskList.new
        task_1 = double :FakeTask, title: "my task 1"
        expect(task_1).to receive(:complete?).and_return(true)
        task_2 = double :FakeTask, title: "my task 2"
        expect(task_2).to receive(:complete?).and_return(true)
        task_3 = double :FakeTask, title: "my task 3"
        expect(task_3).to receive(:complete?).and_return(false)
        task_list.add(task_1)
        task_list.add(task_2)
        task_list.add(task_3)
        expect(task_list.all_complete?).to eq false
      end
    end
  end
end
