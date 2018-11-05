class City 
    @@all=[]

    attr_accessor :name
    attr_reader :hotels

    def initialize(name)
        @name=name 
        @@all << self  
        @hotels=[]
    end

    def hotels=(hotel)
        if hotel.class == Hotel 
            @hotels << hotel
        else 
            raise "hotel should be an instance of Hotel class"
        end 
    end

    def self.all 
        @@all
    end

end