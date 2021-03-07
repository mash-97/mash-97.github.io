# configuration file for taomid

class TaomidConfig < Shpg::Config 
  SITE_NAME = "taomid"
  OUTPUT_DIR_NAME = "output"
  PAGES_PATH = File.join(__dir__, "pages.rb")
end

$SITE_CONFIG_CLASS = TaomidConfig
