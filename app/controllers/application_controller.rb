class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:info,:prizelist, :mmmf_terms, :support, :tyusen]
    before_action :configure_permitted_parameters, if: :devise_controller?


    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:student_no])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:student_no])
    end

    def access_control(role)
      if User.find(current_user.id).role_flag.to_i < role
        render file: "#{Rails.root}/public/404.html", layout: false, status: 404
      end
    end

    def release_befor
      if User.find(current_user.id).role_flag.to_i == 1 and Time.now <= Time.local(2021, 12, 20, 0, 0, 0, 0)
        redirect_to "/info" and return
      end
    end

    def point_stop
      if User.find(current_user.id).role_flag.to_i == 1 and Time.now >= Time.local(2021, 12, 23, 0, 0, 0, 0)
        return true
      else
        return false
      end
    end

    def access_log
      begin
        @student_no = current_user.student_no
      rescue
        @student_no = "未ログイン"
      ensure
        SiteInfo.create(student_no: @student_no, ip_add: request.remote_ip, path: request.fullpath)
      end
    end
end
