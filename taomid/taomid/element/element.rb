require("shpg")
require("kramdown")

class Image
  attr_accessor :name
  attr_accessor :path 
  
  def initialize(name, path)
    @name = name.snakify.split("_").map(&:capitalize).join(" ")
    @path = path
  end
end


class Song
  attr_accessor :name
  attr_accessor :path
  attr_accessor :url
  
  def initialize(name, path, url)
    @name = name
    @path = path 
    @url  = url 
  end
end

class Element 
  attr_accessor :name
  attr_accessor :vibe
  attr_accessor :images
  attr_accessor :songs
  attr_accessor :id_name
  attr_accessor :header_name
  
  # required arguments name, vibe, images, songs
  # 
  def initialize(**kwargs)
    @name = kwargs[:name]
    @header_name = @name.snakify.split("_").map(&:capitalize).join(" ")
    @id_name = @name.snakify
    @audio_container_id_name = "audio_"+@id_name
    @vibe = Kramdown::Document.new(kwargs[:vibe]).to_html
    @images = kwargs[:images]
    @songs = kwargs[:songs]
  end
  
  def disp()
    puts("=====================================")
    puts("Name: #{@name}")
    puts()
    puts("Vibe: #{@vibe}")
    puts()
    puts("Images: #{@images.to_s}")
    puts()
    puts("Songs: #{@songs.to_s}")
    puts()
  end
end



