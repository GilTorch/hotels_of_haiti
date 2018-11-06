require_relative 'hotel.rb'

class HotelsOfHaiti::Scraper 
    
    URL="https://www.haiti-reference.com/pages/plan/geographie-et-tourisme/tourisme-en-haiti/hotels-provinces/"
    
    private 
    def convert_unicode_to_string(str)
        str.encode('iso-8859-1').force_encoding('cp1252').encode('utf-8') 
    end

    def self.scrape_all 
        
        docs = Nokogiri::HTML(open(URL))
        main_node=docs.css(".entry-content")
        cities=main_node.css("h2")
        # each 'h4' is associated with a 'table' to form a the hotel 
        hotel_names=main_node.css("h4") 
        hotel_infos_table=main_node.css("table")
        
        number_of_hotels=hotel_names.count 
        hotel_index=0 

        hotels=[]

        loop do 
            hotel = {}

            name = hotel_names[hotel_index].text
            hotel[:name]=name

            table=hotel_infos_table[hotel_index].css('tbody tr')
            table.each do |row|
                #binding.pry
                 row_cells= row.css('td')
                 case row_cells[0].css('b').text.downcase.delete(" ")
                     when "adresse:"
                         address=row_cells[1].text.gsub("\n","")
                         hotel[:address]=address
                     when "e-mail:"
                        if(row_cells[1].text!="")
                            hotel[:email]=row_cells[1].text
                        end
                     when "téléphone:"
                        if(row_cells[1].text!="")
                         hotel[:phone]=row_cells[1].text
                        end
                     when "téléphones:"
                        if(row_cells[1].text!="")
                         hotel[:phone]=row_cells[1].text
                        end
                     when "siteweb:"
                        if(row_cells[1].text!="")
                         hotel[:website]=row_cells[1].text
                        end
                     when "no.dechambres:"
                         if(row_cells[1].text!="")
                            hotel[:number_of_rooms]=row_cells[1].text
                         end
                    when "tarifs:"
                        if(row_cells[1].text!="" || row_cells[1].text != "Non disponible")
                            hotel[:pricing]=row_cells[1].text
                        end
                 end 
             end
             #binding.pry
            # puts hotel
            #binding.pry
            Hotel.new(hotel)
            #puts Hotel.all
            break if hotel_index == number_of_hotels-1
            hotel_index+=1
        end

        binding.pry
        # puts Hotel.all
        
        # number_of_hotels=hotel_names.count 
        # hotel_index=0
        # number_of_hotels.times do 
        #     hotel=Hotel.new(hotel_names[hotel_index].text)
        #     infos=hotel_infos_table[hotel_index]
            
        #     infos.count.times do 
            
        #     end
            
        #     hotel_index+=1
        # end

        
        #binding.pry
    end

end