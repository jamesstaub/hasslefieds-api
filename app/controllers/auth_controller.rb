class AuthController < ApplicationController
# use POST requests for these login and resgister actions
# add routes
# when login is called the auth token gets returned
# store it in the client, then pass back in the auth header on further requests
# when sending requests from the client, check to see if the token is not null before setting

# POST request
  def login
    credentials = login_params
    user = User.find_by email: credentials[:email]
    if user && user.authenticate(credentials[:password])
      render json: { token: user.token, username: user.username, uid: user.id }
    else
      head :bad_request
    end
  end

# POST
  def register
    if User.create(register_params.merge(password_confirmation: nil)).valid?
      head :created
      # exciting news!!! if you return head :created you can't also render anything. it's just the head!
      # exciting news!!! if you're returning just the head make damn sure that the ajax request type is 'text' not json!!!
    else
      head :bad_request
    end
  end

  private
  def login_params
    params.require(:credentials).permit(:username, :full_name, :email, :password)
  end

  def register_params
    params.require(:credentials).permit(:username, :full_name, :email, :password)
  end

end
