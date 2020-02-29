require 'pry'

class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    artist=
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self unless artist.songs.include?(self) #pushes song to songs array if it doens't exist
  end

end
