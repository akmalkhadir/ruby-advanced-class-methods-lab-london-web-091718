require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @@all << self
  end

  def self.create
    song = Song.new
  end

  def self.new_by_name(name)
    song = Song.create
    song.name=(name)
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name=(name)
    song
  end

  def self.find_by_name(name)
    Song.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name (name)
      Song.find_by_name (name)
    else Song.create_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by { |song| song.name }
  end


  def self.new_from_filename(filename)
    artist_name, name = filename.split (" - ")
    name = name[0..-5]
    new_song = Song.new_by_name(name)
    new_song.artist_name=(artist_name)
    new_song
  end

  def self.create_from_filename (filename)
    Song.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
