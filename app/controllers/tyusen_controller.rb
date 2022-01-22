class TyusenController < ApplicationController

  def index
    @qr_text = current_user.id.to_s + current_user.name + current_user.email
    @qr =  @qr_text.crypt('act-event')
  end

end
