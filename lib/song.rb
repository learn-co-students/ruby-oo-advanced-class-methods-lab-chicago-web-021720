class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    self.new.save
  end

  def self.new_by_name(name)
    newsong = self.new
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    newsong = self.new_by_name(name).save
    newsong
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    found ? found : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_string)
    strings = file_string.split(' - ')
    artist_name = strings[0]
    name = strings[1].slice(0,strings[1].length - 4)
    newsong = self.find_or_create_by_name(name)
    newsong.artist_name = artist_name
    newsong
  end

  def self.create_from_filename(file_string)
    newsong = self.new_from_filename(file_string)
    newsong.save
    newsong
  end

  def self.destroy_all
    @@all = []
  end

end
