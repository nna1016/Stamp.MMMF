module HomesHelper
    def stamp_list(index)
        path = "https://pbs.twimg.com/profile_images/1022063592441446400/_truTOvX_400x400.jpg"
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
