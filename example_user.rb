class User
    attr_accessor :firstname, :lastname, :email
    def initialize(attributes = {})
        @firstname = attributes[:firstname]
        @lastname = attributes[:lastname]
        @email = attributes[:email]
    end
    def formatted_email
       full_name() + "<#{@email}>"
    end
    def full_name
         "#{@firstname} #{@lastname}"
    end

    def alpha_name
        "#{lastname}, #{firstname}"
    end

    def fullnamecheck
        puts full_name.split
        puts alpha_name.split(', ').reverse
        puts full_name.split == alpha_name.split(', ').reverse
    end
end