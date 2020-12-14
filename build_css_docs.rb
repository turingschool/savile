require "crass"
require "pp"

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
            
            doc['title'] = node.dig(:selector, :value) if node[:node] == :style_rule
            doc['title'] = node[:name] if node[:node] == :property

            doc['source_file'] = path
            doc['content'] = prev_comment
            
            write_to_collection(doc)

            prev_comment = nil
        end
    end
end

def write_to_collection(doc)
    destination_dir = File.join(__dir__, 'css_docs', '_example')
    filename = doc['title'] + '.md'

    File.write(File.join(destination_dir, filename), doc['content'])
end
    
def clean_comment(comment_text)
    comment_text.lines.map { |l| l.sub(/^\s*\*\s?/, '') }.join
end

source_dir = File.join(__dir__, 'css')
source_files = Dir.glob(File.join("**", "*.css"), base: source_dir)

source_files.each do |file|
    filepath = File.join(source_dir, file)
    css = File.read(filepath)
    tree = ::Crass.parse(css, :preserve_comments => true)

    extract_docs_from_css(filepath, tree)
end