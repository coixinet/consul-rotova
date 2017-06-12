class AutoLoginController < ApplicationController
  skip_authorization_check

  def index
    render(file: "#{Rails.root}/public/404.html", layout: false, status: 404) and return unless Setting["feature.auto_login"]

    base_64_nif = params[:NIF]

    if nif = Base64.strict_decode64(base_64_nif) rescue nil
      if user = User.find_by_document_number(nif)
        sign_in(user, scope: :user)
      end
    end

    redirect_to root_url
  end
end
