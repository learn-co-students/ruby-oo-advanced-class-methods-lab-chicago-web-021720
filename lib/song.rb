require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  # def self.name(name)
  #   @@name=name
  #   #this should be the method .name. I don't know why the test keeps throwing an error.
  # end

  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create
    Song.new
  end

  def self.new_by_name(name)
    Song.new(name)
  end
    #undefined method ".name." I thought attr_accessor already creates a name method so I'm confused why name is an undefined variable.
  def self.create_by_name(name)
    Song.new(name)
  end

  def self.find_by_name(title)
    for i in Song.all
      if i.name == title
        answer = i
      end
    end
    answer
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    step_one = filename.split('-')
    artist = step_one[0].delete(' ')
    song = step_one[1].split('')
    4.times do song.pop
    end
    song.shift
    song = song.join('')
    Song.new(song, artist)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    #What's the difference??????? Why is it asking me to do exactly the same thing twice? Is this just so I have practice creating aliases to make things flexible?
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

end