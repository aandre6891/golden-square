# File: lib/track.rb

class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end

  def title
    return @title
  end

  def artist
    return @artist
  end

  def matches?(keyword)
    @title.include?(keyword) || @artist.include?(keyword)
  end
end
