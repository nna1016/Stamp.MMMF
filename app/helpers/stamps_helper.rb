module StampsHelper
    require 'chunky_png'

    def qrcode_tag(url, _options = {})
        qr = ::RQRCode::QRCode.new(url)
        ChunkyPNG::Image.from_datastream(qr.as_png.to_datastream).to_data_url
    end
end
