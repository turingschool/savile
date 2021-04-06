require 'yaml'
require 'uri'
require 'net/http'
require 'rexml/document'

AWS_ASSETS_XML = URI('https://turing-savile-assets.s3.amazonaws.com/?list-type=2')

ASSETS_HOST_URL = 'https://assets.turing.io/'
ASSETS_DATA_FILE = File.join(__dir__, '_data', 'assets.yml')

IMAGE_EXTS = Set.new(['.png', '.jpg', '.jpeg', '.gif', '.ico'])

src = Net::HTTP.get(AWS_ASSETS_XML)
xml = REXML::Document.new(src)

Asset = Struct.new(:filepath, :bytesize, :last_modified) do
  def filename
    File.basename(filepath)
  end

  def group
    dir = File.dirname(filepath)
    return dir unless dir == '.'

    ext = File.extname(filepath)
    return 'images' if IMAGE_EXTS.include?(ext)

    return 'base'
  end

  def url
    URI.parse(ASSETS_HOST_URL + filepath).to_s
  end

  def kbsize
    "#{(bytesize.to_i / 1024.0).round(3)}kb"
  end

  def data
    {
      'file' => filename,
      'group' => group,
      'url' => url,
      'size' => kbsize
    }
  end
end

assets = []

xml.root.elements.each('Contents') do |el|
  filepath = el.get_elements('Key').first.text
  bytes = el.get_elements('Size').first.text
  last_modified = el.get_elements('LastModified').first.text

  if filepath[-1] != '/' # don't store folders
    assets .push(Asset.new(filepath, bytes, last_modified))
  end
end

File.write(ASSETS_DATA_FILE, YAML.dump(assets .map(&:data)))
