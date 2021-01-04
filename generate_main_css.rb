require "crass"
require "pp"
require "yaml"

# TODO: Support SCSS
SOURCE_DIR = File.join(__dir__, 'css')
SOURCE_FILES = Dir.glob(File.join("**", "*.css"), base: SOURCE_DIR)
DESTINATION_DIR = 'main_final.css'

def write_to_main(css)
  File.write(DESTINATION_DIR, css)
end

def collect_all_css
  final_css = ''

  SOURCE_FILES.each do |file|
    filepath = File.join(SOURCE_DIR, file)
    css = File.read(filepath)

    # TODO: clean comments out of it before adding to final_css
    final_css += css
  end
  
  write_to_main(final_css)
end

collect_all_css