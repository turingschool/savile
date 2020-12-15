require "crass"
require "pp"

SOURCE_DIR = File.join(__dir__, 'css')
SOURCE_FILES = Dir.glob(File.join("**", "*.css"), base: SOURCE_DIR)
DESTINATION_DIR = File.join(__dir__, 'css_docs')

def extract_docs_from_css(path, tree)
  prev_comment = nil

  tree.each do |node|
    if node[:children]
      extract_docs_from_css(path, node[:children])
    end

    if node[:node] == :comment
      prev_comment = clean_comment node[:value]
    end

    if (node[:node] == :style_rule || node[:node] == :property) && prev_comment
      doc = {}

      doc['source_file'] = path
      doc['content'] = prev_comment

      doc_attrs = parse_attributes(doc['content'])
      doc['attrs'] = doc_attrs

      doc['title'] = doc.dig('attrs', 'title')

      unless doc['title']
        doc['title'] = node.dig(:selector, :value) if node[:node] == :style_rule
        doc['title'] = node[:name] if node[:node] == :property
      end

      write_to_collection(doc, path)

      prev_comment = nil
    end
  end
end

def parse_attributes(docstring)
  # TODO: support multiline attributes (like @description, @example)
  #       (see button.css)
  attrs = {}

  lines = docstring.lines
  lines.each do |line|
    if line.lstrip[0] == '@'
      attr_name, *attr_value = line.split ' '
      attrs[attr_name[1..-1]] = attr_value.join ' '
    end
  end

  attrs
end

def write_to_collection(doc, filepath)
  # pull out the tokens from /savile/css/tokens/colors.css
  file_folder = File.basename(File.dirname(filepath))
  docs_folder = File.join(DESTINATION_DIR, '_' + file_folder)
  Dir.mkdir docs_folder unless Dir.exist? docs_folder
  filename = doc['title'] + '.md'

  # TODO: add doc['attrs'] as head matter (YAML) to the .md file
  File.write(File.join(docs_folder, filename), doc['content'])
end

def clean_comment(comment_text)
  comment_text.lines.map { |l| l.sub(/^\s*\*\s?/, '') }.join
end

SOURCE_FILES.each do |file|
  filepath = File.join(SOURCE_DIR, file)
  css = File.read(filepath)
  tree = ::Crass.parse(css, :preserve_comments => true)

  extract_docs_from_css(filepath, tree)
end
