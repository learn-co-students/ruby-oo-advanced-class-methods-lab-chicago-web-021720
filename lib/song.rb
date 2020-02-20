class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      return song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)

    # Parse the file nane for artist and song name
    parsed = filename.split(' - ')
    song_artist = parsed[0]
    song_name = parsed[1].split('.')[0]  # Strip off '.mp3'

    # Make the new song
    song = self.new
    song.name = song_name
    song.artist_name = song_artist
    song
  end

  def self.create_from_filename(filename)
    # Parse the file nane for artist and song name
    parsed = filename.split(' - ')
    song_artist = parsed[0]
    song_name = parsed[1].split('.')[0]  # Strip off '.mp3'

    # Create the new song
    song = self.create_by_name(song_name)
    song.artist_name = song_artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

