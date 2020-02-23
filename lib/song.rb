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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    potential_song = Song.find_by_name(name)
      if potential_song
        potential_song
      else
        Song.create_by_name(name)
      end
  end

  def self.alphabetical
    Song.all.sort {|a, b| a.name <=> b.name}
  end

  def self.split_filename(filename)
    delimeter = [" - ", ".mp3"]
    filename.split(Regexp.union(delimeter))
  end

  def self.new_from_filename(filename)
    split_song = Song.split_filename(filename)
    song = Song.create_by_name(split_song[1])
    song.artist_name = split_song[0]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
