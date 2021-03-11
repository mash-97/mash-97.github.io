require("shpg")
require_relative("element/element")


# song urls
@song_urls = {
  "golden" => "https://www.youtube.com/watch?v=9IxcfbxGbQ0",
  "imprint" => "https://www.youtube.com/watch?v=EzyMnn4lBG8",
  "drunk" => "https://www.youtube.com/watch?v=zF9Zl7sAzS0",
  "if I got you" => "https://www.youtube.com/watch?v=Y-djQx9GJ2E",
  "better" => "https://www.youtube.com/watch?v=NAo38Q9c4xA",
  "vibez" => "https://www.youtube.com/watch?v=VSpgaN3wuag",
  "tightrope" => "https://www.youtube.com/watch?v=75EYy4cI4_U",
  "windowsill" => "https://www.youtube.com/watch?v=QqPOneQgvwc",
  "when love's around" => "https://www.youtube.com/watch?v=daJgg8o0aNA",
  "you wish you knew" => "https://www.youtube.com/watch?v=DxX37fyx_58",
  "lucozade" => "https://www.youtube.com/watch?v=mdeg4fX4RJ0",
  "mind of mindd" => "https://www.youtube.com/watch?v=go8_ZWFdYGs",
  "she don't love me" => "https://www.youtube.com/watch?v=FLaAOHv3qCY",
  "there you are" => "https://www.youtube.com/watch?v=eFsGA0GXB-8"
}

@clean_name = ->(name){
  name.snakify.split("_").map(&:downcase).join(" ")
}

@campify_name = ->(name){
  name.snakify.split("_").map(&:capitalize).join(" ")
}

@matched_song_url = ->(song_name){
  song_name_c = @clean_name.call(song_name)
  @song_urls.each do |name, url|
    return url if song_name_c =~ Regexp.new(@clean_name.call(name))
  end
  nil
}

@cut_path = ->(path){
  dir = $0==__FILE__ ? File.expand_path("..", Dir.pwd()) : Dir.pwd()
  File.absolute_path(path).split(dir+"/")[1]
}
  
glob = $0==__FILE__ ? "assets/elements/*" : "**/taomid/assets/elements/*"
elements = Dir[glob].collect do |epd|
  
  name = File.basename(epd)
  vibe = File.read( File.join(epd, name+".vb" ))
  images = Dir["#{epd}/images/*"].collect do |image_path|
    image_name = File.basename(image_path).split(File.extname(image_path)).first
    path = @cut_path.call(image_path)
    Image.new(image_name, path)
  end
  
  songs = Dir["#{epd}/songs/*"].collect do |song_path|
    song_name = File.basename(song_path).split(File.extname(song_path)).first
    path = @cut_path.call(song_path)
    url = @matched_song_url.call(song_name)
    Song.new(song_name, path, url)
  end
  
  
  Element.new(name: @campify_name.call(name), vibe: vibe, images: images, songs: songs)
end

# sequencified collection
sequence = ["growing_dispersion", "dynamic_mind", "overstimulated_mind", "truths_of_imaginary_being", "wrapped_reality", "compacted_vibez", "tight_zen"]
ELEMENTS = sequence.collect do |seq_name| 
  elements.find{|el|
    el.name.snakify == seq_name.snakify
  }
end


