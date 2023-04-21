class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an istance of DiaryEntry
    @entries << entry
  end

  def entries
    return @entries
  end
end