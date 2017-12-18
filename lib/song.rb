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
  	s = self.new
  	s.save
  	s
  end

  def self.new_by_name(name)
  	s = self.new
  	s.name = name
  	s
  end

  def self.create_by_name(name)
  	s = self.create
  	s.name = name
  	s
  end

  def self.find_by_name(name)
  	self.all.detect {|n| n.name == name}
  end

  def self.find_or_create_by_name(name)
  	self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
  	self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
  	s = self.new
  	s.artist_name = filename.split(" - ")[0]
  	s.name = filename.split(" - ")[1].chomp(".mp3")
  	s
  end

  def self.create_from_filename(filename)
    s = self.create
    s.name = filename.split(" - ")[1].chomp(".mp3")
    s.artist_name = filename.split(" - ")[0]
    s
  end

  def self.destroy_all
  	self.all.clear
  end


end
