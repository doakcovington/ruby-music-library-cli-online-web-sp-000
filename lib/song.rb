
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
    save
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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

  def self.find_by_name(name)
    #finds a song instance in @@all by the name of the property of the song
    self.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #returns an existing song with the provided name if one exists in @@all
    #creates song if an existing match is not found
    if @@all.include?(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end


end
