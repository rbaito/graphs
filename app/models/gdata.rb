class Gdata
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :label, :data, :legend

	def initialize(attrib = {})		
		attrib.each do |key,val|
			send("#{key}=",val)
		end
	end

end