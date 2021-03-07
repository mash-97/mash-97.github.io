class Element 
  attr_accessor :name
  attr_accessor :vibe
  attr_accessor :images
  attr_accessor :songs
  
  def initialize(**kwargs)
    @name = kwargs[:name]
    @vibe = kwargs[:vibe]
    @images = kwargs[:images]
    @songs = kwargs[:songs]
  end
  
  def disp()
    puts("Name: #{@name}")
    puts("Vibe: #{@vibe}")
    puts("Images: #{@images.to_s}")
    puts("Songs: #{@songs.to_s}")
  end
end



