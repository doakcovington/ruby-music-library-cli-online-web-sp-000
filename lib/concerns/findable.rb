module Concerns::Findable

    def self.find_by_name(name)
      #finds a song instance in @@all by the name of the property of the song
      all.find{|instance| instance.name == name}
    end


end
