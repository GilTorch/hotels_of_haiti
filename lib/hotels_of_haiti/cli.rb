class HotelsOfHaiti::CLI 
    def call 
        puts "Welcome to 'Hotels of Haiti'. Choose a city to see its list of hotels."
        list_cities
        menu
    end

    def list_cities 
        puts "1. Cap-Haitien - 38 hotels"
        puts "2. Gonaives - 3 hotels"
        puts "3. Cayes - 4 hotels "
    end

    def list_hotels_in_city(city)
    end

    def menu 
       puts "Enter your choice (number or name of city)"
       input=gets.strip 

    end
end