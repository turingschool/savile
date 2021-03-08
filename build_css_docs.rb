require "crass"
require "pp"
require "yaml"
require "FileUtils"
require "sassc"

LOAD_DIR = File.join(__dir__, 'css/design_system')
LOAD_FILE = File.join(LOAD_DIR, 'index.scss')
DESTINATION_DIR = File.join(__dir__, 'docs')

def extract_docs_from_css(tree)
  prev_comment = nil
  order = 0

  tree.each do |node|
    if node[:children]
      extract_docs_from_css(node[:children])
    end

    # only parse comment starting with /** (NOT /*)
    if node[:node] == :comment && node[:value][0] == '*'
      prev_comment = clean_comment node[:value]
    end

    if (node[:node] == :style_rule || node[:node] == :property) && prev_comment
      doc = {}

      doc['content'] = prev_comment

      doc_attrs = parse_attributes(doc['content'])

      doc['example'] = doc_attrs.delete('example') if doc_attrs['example']
      doc['attrs'] = doc_attrs

      # keeps declarations in order of where they are defined in docs file
      doc['attrs']['order'] = order += 1

      doc['title'] = doc.dig('attrs', 'title')
      doc['category'] = (doc.dig('attrs', 'category') || 'misc').downcase

      unless doc['title']
        doc['title'] = node.dig(:selector, :value) if node[:node] == :style_rule
        doc['title'] = node[:name] if node[:node] == :property
      end

      write_to_collection(doc)

      prev_comment = nil
    end
  end
end

def parse_attributes(docstring)
  attrs = {}
  example = nil

  names_and_values = docstring.strip.split(/\s*@(\w+)\s+/)
  names_and_values.shift if names_and_values.first.empty?

  Hash[names_and_values.each_slice(2).to_a]
end

def write_to_collection(doc)
  docs_folder = File.join(DESTINATION_DIR, '_' + doc['category'])
  Dir.mkdir docs_folder unless Dir.exist? docs_folder
  filename = doc['title'] + '.md'

  front_matter = doc['attrs'].to_yaml
  front_matter += "---\n"

  doc_content = front_matter

  doc_content += doc['example'] if doc['example']

  File.write(File.join(docs_folder, filename), doc_content)
end

def clean_comment(comment_text)
  comment_text.lines.map { |l| l.sub(/^\s*\*\s?/, '') }.join
end

def reset_docs_dir
  FileUtils.rm_rf(DESTINATION_DIR)
  Dir.mkdir(DESTINATION_DIR)
end

reset_docs_dir

scss = File.read(LOAD_FILE)
css = SassC::Engine.new(scss, load_paths: [LOAD_DIR]).render
tree = ::Crass.parse(css, :preserve_comments => true)

extract_docs_from_css(tree)
