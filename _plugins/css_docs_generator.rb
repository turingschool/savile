require 'crass'

module Jekyll
  class CSSDoc < Document
  end

  class CSSDocsGenerator < Jekyll::Generator
    def generate(site)
      collections = css_doc_collections(site)

      return unless collections.any?

      collections.each do |name, collection|
        source_dir = collection.metadata.dig('css_doc', 'source')
        source_files = Dir.entries(source_dir).filter { |f| f.end_with? '.css' }

        source_files.each do |file|
          filepath = File.join(source_dir, file)
          css = File.read(filepath)
          tree = ::Crass.parse(css, :preserve_comments => true)

          extract_docs_from_css(filepath, tree, site, collection)
        end
      end
    end

  private

    def css_doc_collections(site)
      site.collections.filter { |name, collection| collection.metadata.has_key? 'css_doc' }
    end

    def extract_docs_from_css(path, tree, site, collection)
      prev_comment = nil

      tree.each do |node|
        if node[:children]
          extract_docs_from_css(path, node[:children], site, collection)
        end
          
        if node[:node] == :comment
          prev_comment = clean_comment node[:value]
        end

        if (node[:node] == :style_rule || node[:node] == :property) && prev_comment
          doc = CSSDoc.new(path, collection: collection, site: site)

          doc.data['title'] = node.dig(:selector, :value) if node[:node] == :style_rule
          doc.data['title'] = node[:name] if node[:node] == :property

          doc.data['source_file'] = path
          doc.content = prev_comment
          collection.docs << doc

          prev_comment = nil
        end
      end
    end
    
    def clean_comment(comment_text)
      comment_text.lines.map { |l| l.sub(/^\s*\*\s?/, '') }.join
    end
  end
end
