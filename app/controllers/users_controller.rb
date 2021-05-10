class UsersController < ApplicationCoontroller
  def index
    @users = User.all
    if @users 
      render json: {
        users: @users
      }
    else
      render json: {
        status: 500,
        errors: { 'No users are found' }
      }
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: { 'no user is found' }
      }
    end
  end

  def create
    @user = User.new(user_params)
    if @user
      render json: {
        status: 200,
        user: @user
        message: { 'new user uis created' } 
      }
    else
      render json: {
        status: 500,
        errors: { 'no user is created' }
      }
    end
  end

  def update 
    @user = User.find(params[:id])
    if @user 
     @user.update(user_params)
     render json: {
         message: { 'user is updated'}
     },
     status: 200
    else
      render json: {
        errors: { 'something is wrong '},
        status: 400
      }
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: {
        message: { 'user is deleted' },
        status: 200
      }
    else
      render json: {
        status: 400,
        errors: { 'something is wrong' }
      }

    end
  end

  def user_params
    user.require(:user).permit(:username, :password, :password_confirmation)
  end
end
