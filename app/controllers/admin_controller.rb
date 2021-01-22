class AdminController < ActionController::Base
    before_action :authorized
    helper_method :current_admin_user
    helper_method :admin_logged_in?

    def current_admin_user    
        AdminUser.find_by(id: session[:admin_user_id])  
    end

    def admin_logged_in?
        !current_admin_user.nil?  
    end

    def authorized
        redirect_to '/admin_login' unless admin_logged_in?
    end

    def overview
        # toont views/admin/overview.erb
        @log_entries = LogEntry.all
    end
end
