class Api::UsersController < ApplicationController
  def index
    @users = User.all

    if @users
      render json: { message: "SUCCESS", data: @users }, status: :ok
    else
      render json: { message: @users.errors }, status: :bad_request
    end
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user
      user.update_attributes(user_params)
      render json: user
    else
      render json: { message: "BAD_REQUEST"}, status: :bad_request
    end
  end

  def destroy
    begin
      User.destroy(params[:id])
      render status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: "record not found" }, status: :bad_request
    rescue ActiveRecord::CatchAll
      render status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:user_name, :email)
  end
end
