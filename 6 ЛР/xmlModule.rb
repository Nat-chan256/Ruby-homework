module XMLModule
	require 'libxml'

	class XMLConverter
		
		def createDocXML(root)
			doc = LibXML::XML::Document.new
			doc.encoding = LibXML::XML::Encoding::UTF_8
			doc.root = LibXML::XML::Node.new(root)
			doc
		end
		
		def createNode(name, value=nil)
			node = LibXML::XML::Node.new(name)
			node.content = value.to_s unless value.nil?
			LibXML::XML::Attr.new(node, 'type', type)
			node
		end
		
		# Returns list items represented as xml 
		def xml(list)
			doc = createDocXML("List")
			list.each do
				|listItem|
				doc.root << (listItemNode = createNode(listItem.class.name))
				innerTags = listItem.attributes
				innerTags.each {|attr| listItemNode << createNode(attr, innerTags[attr])}
			end
			doc.to_s
		end
	end
end