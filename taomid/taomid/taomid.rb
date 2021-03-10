class Taomid < Shpg::Page 

  NAME = "taomid"
  ERB_TEMPLATE_FILE_PATH = File.join(__dir__, "taomid.erb")
  
  # instance data can be initialized here.
  def setup()
    # initialize your data here
    require_relative("elements")
    @elements = ELEMENTS
    @taomid_vb = File.read(File.join(__dir__, "assets/taomid.vb"))
    @contacts = {
      "github" => {:name => "mash-97", :url => "https://github.com/mash-97"}, 
      "facebook" => {:name => "Mashiur Rahman", :url => "https://www.facebook.com/mashiurrahman.mahim2"}
    }
            
  end
  
end

