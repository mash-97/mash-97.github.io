require("shpg")
require_relative("element/element")

glob = $0==__FILE__ ? "assets/elements/*" : "**/taomid/assets/elements/*"
elements = Dir[glob].collect do |epd|
  cut_path = ->(path){
    dir = $0==__FILE__ ? File.expand_path("..", Dir.pwd()) : Dir.pwd()
    File.absolute_path(path).split(dir+"/")[1]
  }
  
  name = File.basename(epd)
  vibe = File.readlines( File.join(epd, name+".vb" )).map(&:strip).join(" ")
  images = Dir["#{epd}/images/*"].map(&cut_path)
  songs = Dir["#{epd}/songs/*"].map(&cut_path)
  
  
  Element.new(name: name, vibe: vibe, images: images, songs: songs)
end

# sequencify
sequence = ["growing_dispersion", "dynamic_mind", "overstimulated_mind", "truths_of_imaginary_being", "wrapped_reality", "compacted_vibez", "tight_zen"]
ELEMENTS = sequence.collect do |seq_name| 
  elements.find{|el| el.name.snakify == seq_name.snakify}
end

  
