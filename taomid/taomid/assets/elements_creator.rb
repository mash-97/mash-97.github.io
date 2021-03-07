require("shpg")
require("thor")
require("fileutils")

class ElementsCreatorGenerator < Thor::Group
  include Thor::Actions
  desc "creates element structure"
  
  argument :element_image_path, :type => :string
  
  def element_name()
    File.basename(element_image_path).split(File.extname(element_image_path))[0].snakify
  end
  
  def create_element_dir()
    empty_directory(element_name)
  end
  
  def create_element_images_dir()
    empty_directory( File.join( element_name, "images") )
  end
  
  def create_element_songs_dir()
    empty_directory( File.join( element_name, "songs") )
  end
  
  def create_vibe_file()
    create_file( File.join( element_name, element_name+".vb" ) )
  end
  
  def copy_image()
    FileUtils.copy_file( 
      element_image_path, 
      File.join( element_name, "images", element_name+File.extname(element_image_path))
    )
  end
end

if $0 == __FILE__ then
  #~ Dir["images/*"].each do |file_path|
    
    #~ puts("image_path: #{file_path}")
    #~ puts("Create structure? ")
    #~ ans = gets().chomp()
    #~ if( not ans=~/y/i) then
      #~ next
    #~ end
    
    #~ ecg = ElementsCreatorGenerator.new([file_path])
    #~ ecg.destination_root = Dir.pwd()
    #~ ecg.invoke_all()
  #~ end
end

