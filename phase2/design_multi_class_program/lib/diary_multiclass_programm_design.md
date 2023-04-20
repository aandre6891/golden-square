# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

> As a user
> So that I can record my experiences
> I want to keep a regular diary
> 
> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries
> 
> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed
> 
> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary
> 
> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```ruby
class Diary
  def add(entry) # entry is an istance of DiaryEntry
  
  end

  def entries
    # returns a list of DiaryEntries
  end
end

class DiaryEntry
  def initialize(title, contents)
  
  end

  def title
    # returns the title of the entry
  end

  def contents
    # returns the content of the entry 
  end
end

class PhoneNumberCrawler
  def initialize(diary) # diary is an istance of Diary
  
  end

  def extract_numbers
    # gets numbers from the diary entries
    # and returns a list of numbers as strings
  end
end

class DiaryReader
  def initialize(wpm, diary) 
  # diary is an istance of Diary
  # wpm is a number representing the number of words 
  # per minute the reader can read
  end

  def find_most_readable_in_time(time)
    # returns longest readable DiaryEntry in the given time based on the 
    # wpm already given 
  end
end

class TaskList
  def add(task) # task is an istance of Task 
    # adds a task to the task list
  end

  def all
    # returns a list of all tasks
  end
end

class Task
  def initialize(title)
  
  end 

  def title
    # returns the title of the  task
  end
end


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# > As a user
# > So that I can record my experiences
# > I want to keep a regular diary

# > As a user
# > So that I can reflect on my experiences
# > I want to read my past diary entries

# > As a user
# > So that I can reflect on my experiences in my busy day
# > I want to select diary entries to read based on how much time I have and my reading speed

# > As a user
# > So that I can keep track of my tasks
# > I want to keep a todo list along with my diary

# 1
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Book", "I read a book yesterday")
diary_entry_2 = DiaryEntry.new("Movie", "I watched a movie today")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
expect(diary.entries).to eq [diary_entry_1, diary_entry_2]

# 2 - when it fits exactly the given time
diary = Diary.new
diary_reader = DiaryReader.new(2, diary)
diary_entry_1 = DiaryEntry.new("title1", "one")
diary_entry_2 = DiaryEntry.new("title2", "one two")
diary_entry_3 = DiaryEntry.new("title3", "one two three")
diary_entry_4 = DiaryEntry.new("title4", "one two three four")
diary_entry_5 = DiaryEntry.new("title5", "one two three four five")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.add(diary_entry_3) 
diary.add(diary_entry_4)
diary.add(diary_entry_5)
expect(diary_reader.find_most_readable_in_time(2)).to eq diary_entry_4

# 3 - when it does not fit exactly the given time
diary = Diary.new
diary_reader = DiaryReader.new(2, diary)
diary_entry_1 = DiaryEntry.new("title1", "one")
diary_entry_2 = DiaryEntry.new("title2", "one two")
diary_entry_3 = DiaryEntry.new("title3", "one two three")
diary_entry_4 = DiaryEntry.new("title4", "one two three four five")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
diary.add(diary_entry_3)  
diary.add(diary_entry_4)
expect(diary_reader.find_most_readable_in_time(2)).to eq diary_entry_3

# 4 - when there is nothing readable in the given time
diary = Diary.new
diary_reader = DiaryReader.new(2, diary)
diary_entry_1 = DiaryEntry.new("title1", "one two three four five")
diary.add(diary_entry_4 )
expect(diary_reader.find_most_readable_in_time(2)).to eq nil

# 5 - nothing to read at all
diary = Diary.new
diary_reader = DiaryReader.new(0, diary)
expect { diary_reader.find_most_readable_in_time(2) }.to raise_error "wpm should be positive"

# 6 - wpm is zero
diary = Diary.new
diary_reader = DiaryReader.new(2, diary)
expect(diary_reader.find_most_readable_in_time(2)).to eq nil


# 7
task_list = TaskList.new
task_1 = Task.new("walk the dog")
task_2 = Task.new("eat the food")
task_list.add(task_1)
task_list.add(task_2)
expect(task_list.all).to eq [task_1, task_2] 

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

# 8
diary = Diary.new
diary_entry_1 = DiaryEntry.new("title1", "my friend's number is 123456789")
diary_entry_2 = DiaryEntry.new("title2", "my friend's numbers are 123456789, 987654321. 918273645 and 918273645")
diary.add(diary_entry_1)
diary.add(diary_entry_ 2)
phone_book = PhoneNumberCrawler.new(diary)
result = phone_book.extract_numbers
expect(result)).to eq ["123456789", "987654321", "918273645"]

```
## 4. Create Examples as Unit Tests

```ruby

# empty diary

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->