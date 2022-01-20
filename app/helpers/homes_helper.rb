module HomesHelper
    def stamp_list(index)
        stamp_list = ["creators", "design", "it", "tech"]
        path = "/images/stamps/#{stamp_list[index-1]}.png"
        unless @get_stamp.nil?
            @get_stamp.each do |get_stamp|
                if get_stamp.number == index
                    begin
                        path = @stamp.find(index).image.url
                    rescue
                        path = "/images/noimage.png"
                    end
                end
            end
        end
        return path
    end
end
