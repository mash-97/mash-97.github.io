class Index < Shpg::Page 

  NAME = "index"
  ERB_TEMPLATE_FILE_PATH = File.join(__dir__, "index.erb")
  
  # instance data can be initialized here.
  def setup()
    # initialize your data here
    
  end
  
end

