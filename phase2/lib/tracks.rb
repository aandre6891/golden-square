class TrackList
  def initialize # makes an empty list
    @track_list = []
  end
  def add(track) # add the track to the list
    @track_list << track
  end

  def list # returns the list, fails if is empty
    fail "the list is empty" if @track_list.empty?
    return @track_list
  end
end