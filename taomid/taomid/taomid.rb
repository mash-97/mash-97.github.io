class Taomid < Shpg::Page 

  NAME = "taomid"
  ERB_TEMPLATE_FILE_PATH = File.join(__dir__, "taomid.erb")
  
  # instance data can be initialized here.
  def setup()
    # initialize your data here
    require_relative("elements")
    @elements = ELEMENTS
  end
  
end

