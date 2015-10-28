class Song
  @@plays = 0
  attr_accessor :name, :artist, :duration

  def play
    @plays = 0 ? @plays == nil : @plays += 1
    @@plays +=1
    "This  song: #@plays plays. Total #@@plays plays."
  end

  def to_s
    "Song: #{@name}--#{@artist} #{@duration}"
  end

end

class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end

  def to_s
    super + " [#{@lyrics}]"
  end

end