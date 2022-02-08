class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        flash[:notice] = "ようこそLEVIRへ！！"
        root_path
    end
end
