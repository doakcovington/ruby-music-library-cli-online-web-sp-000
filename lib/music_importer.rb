require 'pry'

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*").map{|file| file.gsub("#{path}/", '')}
  end

  def import(filename)
    self.create_from_filename(filename)
    binding.pry
  end

end
