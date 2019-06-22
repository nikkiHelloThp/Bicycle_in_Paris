module LocationsHelper
	def mi_to_m(distance)
		((distance * 1.609344) * 1000).to_i
	end
end
