class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :ensure_www

  private

  def ensure_www
    if request.subdomain != 'www'
      redirect_to url_for(subdomain: 'www', only_path: false), allow_other_host: true
    end
  end
end
