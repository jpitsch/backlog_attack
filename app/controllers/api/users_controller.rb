class Api::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show update destroy]

  # Please remove oncce done this is for easy access to view data.
  def index
    @users = User.all

    if @users
      render json: { message: "SUCCESS", data: @users }, status: :ok
    else
      render json: { message: @users.errors }, status: :bad_request
    end
  end

  def show
    render json: UserSerializer.new(@user).serializable_hash.to_json, status: :ok
  end

  def update
    if @user
      @user.update(user_params)
      render json: UserSerializer.new(@user).serializable_hash.to_json
    else
      render json: { message: "BAD_REQUEST" }, status: :bad_request
    end
  end

  def destroy
    begin
      @user.destroy
      head :no_content
    rescue ActiveRecord::RecordNotFound
      render json: { message: "record not found" }, status: :bad_request
    rescue ActiveRecord::CatchAll
      render status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:id, :user_name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
