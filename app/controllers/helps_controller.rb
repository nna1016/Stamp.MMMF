class HelpsController < ApplicationController
  before_action :access_log
  
  def mmmf_terms 
  end

  def support
    @supports = Support.all.order(:kind, :order)
    @bef = ""
  end

  def announce
  end
end
