require 'pry'

class MusicLibraryController

  def initialize(path = ./db/mp3s/)
    @path = path
    binding.pry
  end


end
