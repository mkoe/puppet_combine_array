module Puppet::Parser::Functions
	newfunction(:combine_array, :type => :rvalue, :doc => <<-EOS
 This function will combine each given Element of array1
 with each element of array2. And returns the values as a new array.

 *Examples:*


	e.g.
	array1 = ['day', 'night']
	array2 = ['monday','tuesday']
	combine_array(array1,array2)
	Would return:
		monday_day
		tuesday_day
		monday_night
		tuesday_night

	EOS
		) do |arguments|

		if (arguments.size != 2) then
    	  raise(Puppet::ParseError, "combine_array(): Wrong number of arguments "+
   	     "given #{arguments.size} for 2.")
  	  end

			result_array = Array.new

#			if ( arguments[0].empty?(Array) or arguments[1].empty?(Array))
#				raise(TypeError, "Both Arrays have to filled with values")
#			end

			if (arguments[0].kind_of?(Array) and arguments[1].kind_of?(Array))
					arguments[0].each do |array1|
						arg_helper = "#{array1}".split(",")
							arguments[1].each do |array2|
								result_array << "#{arg_helper[0]}_#{array2}"
								#raise(TypeInfo, "trying to see what is wrong #{arg_helper[0]}_#{array2}"  )
							end
					end
			else
					raise(TypeError, "combine_array(): First argument and second argument must be an Array." )
			end
			return (result_array)
	end
end
