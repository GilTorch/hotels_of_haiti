class HotelsOfHaiti::CLI 
    def call 
        HotelsOfHaiti::Scraper.scrape_all
        puts "Welcome to 'Hotels of Haiti'"
        launch
    end

    def list_hotels
        fields=["ID",'NAME']
        table = Terminal::Table.new :title =>"LIST OF HOTELS",:headings =>fields, :rows => Hotel.hotels_to_array(@range,[:id,:name]), :style => {:width => 80, :padding_left => 3, :border_x => "=", :border_i => "x"}
        puts table
    end


    def launch
       loop do 
        puts "How many hotels do you want to see?(Choose between 1 and #{Hotel.all.count})."
        @range=gets.strip.to_i
        break if @range!=0 && @range <= Hotel.all.count 
       end 
       list_hotels 
       show_hotel 
       puts "Do you which to go back to the hotel list?(type yes or no)"
       input=gets.strip

       if input.downcase=="yes"
        launch 
       else 
        puts "Good bye!"
       end

    end

    def show_hotel 
        input=nil
        loop do 
            puts "Which hotel you want to see more detail about(Choose by ID)??"
            input=gets.strip.to_i 
            break if input<=@range
        end
        found_hotel=Hotel.find_by_id(input-1)
        puts "X-------------------------------------------------X"
        puts "         #{found_hotel.name}                "
        puts "X-------------------------------------------------X"
        # puts "Name: #{found_hotel.name}"
        puts "Address: #{found_hotel.address}"
        puts "Phone: #{found_hotel.phone}"
        puts "E-mail: #{found_hotel.email}"
        puts "Website: #{found_hotel.website}"
        puts "Pricing: #{found_hotel.pricing}"
    end

end