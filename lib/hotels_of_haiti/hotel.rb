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

    def self.hotels_to_hash 
        hotel_hashes=[]
        @@all.each do |hotel|
            hotel_hash={
                name: hotel.name, 
                address:hotel.address,
                phone:hotel.phone,
                email:hotel.email,
                number_of_rooms:hotel.number_of_rooms,
                pricing:hotel.pricing
            }
            hotel_hashes << hotel_hash
        end
        hotel_hashes
    end

    def self.hotels_to_array(range=@@all.count,fields=[:name,:address,:phone,:email,:number_of_rooms,:website,:pricing])
        hotels_to_array=[]
        hotel_to_hashes=self.hotels_to_hash
        
        hotel_to_hashes.each_with_index do |hotel_hash,index|
            if index > range - 1
                break 
            end
            
            if(fields.include? :id)
                hotel_array=[index+1]
            end 

            fields.each do |field|
                if hotel_hash.keys.include? field
                    hotel_array << hotel_hash[field] 
                end
            end
            hotels_to_array << hotel_array
        end
        hotels_to_array
    end

    def self.find_by_id(id)
        @@all[id]
    end

end