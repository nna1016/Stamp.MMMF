class SiteInfosController < ApplicationController
  before_action -> {access_control(5)}

  def index
    @site_infos = SiteInfo.all.order(created_at: "DESC")
    @site_cnt = SiteInfo.count
  end

end
