class Builder
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	def initialize(id,param)		
		@all = Array.new
		ActiveRecord::Base.connection.reconnect! if ActiveRecord::Base.connection.active?
		ActiveRecord::Base.connection.select_all("call sp_getreports2(#{id},'#{param}')").each do |i|
			@all.push Gdata.new(i)
		end
	end
	
	def find(index)
		@all[index]
	end
	
	def all
		@all
	end

end