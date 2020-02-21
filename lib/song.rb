class Song
  attr_accessor :name, :artist_name, :create
  @@all = []

  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ||= self.create_by_name(name)
  end

  def self.alphabetical
    @@all.uniq.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    name = filename.match(/.+ - (.+)\.mp3/).to_a[-1]
    artist = filename.match(/(.+) -/).to_a[-1]
    self.new(name, artist)
  end

  def self.create_from_filename(filename)
    @@all << new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end

end

Song.new("Ain't Nuthin But a G Thang", "Dr. Dre")
Song.new("Like a Rolling Stone", "Robert Zimmerman")
Song.new("Trem Fantasma", "Os Mutantes")
Song.new("Aguas de Marco", "Elis & Tom")
p Song.new_from_filename("Taylor Swift - Blank Space.mp3")
p Song.all
Song.alphabetical.each { |song| puts song.name }
Song.destroy_all
p Song.all
# p Song.find_or_create_by_name("Trem Fantasma")
# p Song.find_or_create_by_name("Gasolina")
