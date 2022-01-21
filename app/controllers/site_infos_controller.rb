class SiteInfosController < ApplicationController
  before_action -> {access_control(3)}, :access_log

  def index
    @site_infos = SiteInfo.all.order(created_at: "DESC")
    @site_cnt = SiteInfo.count
  end

end
