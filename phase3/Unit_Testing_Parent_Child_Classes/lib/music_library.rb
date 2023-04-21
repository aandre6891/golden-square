class MusicLibrary
  def initialize
    @music_library = []
  end

  def add(track) # track is an instance of Track
    @music_library << track
  end

  def all
    return @music_library
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks that match the keyword
  end
end