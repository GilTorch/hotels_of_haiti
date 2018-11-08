class Hotel 
    @@all=[]

    attr_accessor :name,:address,:phone,:email,:number_of_rooms,:website,:pricing

    def initialize(name:,address:nil,phone:nil,email:nil,number_of_rooms:nil,website:nil,pricing:nil)
        @name=name 
        @address=address 
        @phone=phone 
        @email=email
        @number_of_rooms=number_of_rooms
        @website=website 
        @pricing=pricing
        @@all << self 
    end

    def self.all 
        @@all
    end

    def self.hotels_to_array(range=@@all.count)
        hotels_to_array=[]
        @@all.each_with_index do |hotel,index|
            if index > range-1 
                break
            end
            hotel_array=  [
            index+1,
            hotel.name,
            # hotel.address,
            # hotel.phone,
            # hotel.email, 
            # hotel.number_of_rooms,
            # hotel.website,
            # hotel.pricing
          ]
          hotels_to_array.push(hotel_array)
        end
        hotels_to_array
    end

    def self.find_by_id(id)
        @@all[id]
        # @@all.each_with_index do |hotel,index|
        #     if id == index 
        #        return hotel 
        #     end
        # end
    end

end