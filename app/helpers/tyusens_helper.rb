module TyusensHelper
    require 'chunky_png'

    def qrcode_tag(url, _options = {})
        qr = ::RQRCode::QRCode.new(url)
        ChunkyPNG::Image.from_datastream(qr.as_png.resize(200,200).to_datastream).to_data_url
    end

    # ざわつかせる
    def zawa 
        if rand(1..10) >= 8
            true
        else  
            false        
        end
    end
end
