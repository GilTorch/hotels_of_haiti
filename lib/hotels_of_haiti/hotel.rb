class Hotel 
    @@all=[]

    attr_accessor :name,:address,:phone,:email,:number_of_rooms,:website

    def initialize(name,address=nil,phone=nil,email=nil,number_of_rooms=nil,website=nil)
        @name=name 
        @address=address 
        @phone=phone 
        @email=email
        @number_of_rooms=number_of_rooms
        @website=website 
        @@all << self 
    end

    def self.all 
        @@all
    end

end