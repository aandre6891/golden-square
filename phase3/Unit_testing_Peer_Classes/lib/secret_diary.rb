class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    @diary = diary
  end

  def read
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
    return @diary
  end

  def lock
    # Locks the diary
    # Returns nothing
  end

  def unlock
    # Unlocks the diary
    # Returns nothing
  end
end