class SessionController < ApplicationController
  # def create 
  #   user = User
  #           .find_by(email: params["user"]["email"])
  #           .try(:authenticate, params["user"]["password"])
    
  #   if user 
  #     session[:user_id] = user.id
  #     render json: {
  #       status: :created,
  #       logged_in: true,
  #       user: user
  #     }
  #   else 
  #       render json: {status: 401}
  #   end             
  # end

  # def logged_in
  # end

  def create
    @user = User.find_by(username: session_params[:username])

    if @user&.authenticate(session_params[:password])
      login!
      render json: { 
        logged_in: true,
        user: @user
      }
    else
      render json: {
        status: 401,
        errors: ['Cannot find the user, please check the data again']
      }
    end
  end

  def method_logged_in
    if logged_in && current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json {
        logged_in: false,
        message: 'No user is found'
      }
    end
  end

  def destroy 
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
