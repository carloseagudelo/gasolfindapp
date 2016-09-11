class RegistrationsController  < ApplicationController

  #skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      render json: payload(user)
    else
      warden.custom_failure!
      render :json => user.errors, :status=>422
    end
  end

private
  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end

end