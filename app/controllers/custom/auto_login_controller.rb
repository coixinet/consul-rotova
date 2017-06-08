class AutoLoginController < ApplicationController
  skip_authorization_check

  def index
    base_64_nif = params[:NIF]
    nif = Base64.decode64(base_64_nif)

    if user = User.find_by_document_number(nif)
      sign_in(user, scope: :user)
    end

    redirect_to root_url
  end
end
