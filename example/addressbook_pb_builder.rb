 module Tutorial
	 class Person
		 def self.build(**kwargs)
			 attributes = kwargs.select{|k, _| %i(name id email phones last_updated ).include? k}
			 self.new(attributes)
		 end
	 end
 end

 module Tutorial
	 class Person
		 class PhoneNumber
			 def self.build(**kwargs)
				 attributes = kwargs.select{|k, _| %i(number type ).include? k}
				 self.new(attributes)
			 end
		 end
	 end
 end

 module Tutorial
	 class AddressBook
		 def self.build(**kwargs)
			 attributes = kwargs.select{|k, _| %i(people ).include? k}
			 self.new(attributes)
		 end
	 end
 end

