class HotelsOfHaiti::CLI 
    def call 
        HotelsOfHaiti::Scraper.scrape_all
        puts "Welcome to 'Hotels of Haiti'"
        menu
        list_hotels
    end

    def list_hotels
        Hotel.all.each_with_index do |hotel,index|
            break if index==@input
            puts "#{index+1}.-  #{hotel.name} - #{hotel.address}"
        end
    end


    def menu 
       
       loop do 
        puts "How many hotels do you want to see?(Choose between 1 and #{Hotel.all.count})."
        @input=gets.strip.to_i
        break if @input!=0 && @input <= Hotel.all.count 
       end 
    end
end