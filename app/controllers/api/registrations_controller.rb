# frozen_string_literal: true
class Api::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? registration_success(resource) : registration_failure(resource)
  end

  def registration_success(resource)
    render json: {
      status: {code: 200, message: 'User signup has been successful!'},
      data: UserSerializer.new(resource).serializable_hash.to_json
    }
  end

  def registration_failure(resource)
    render json: {
      status: {message: "User could not be created. #{resource.errors.full_messages.to_sentence}"}
    }, status: :unprocessable_entity
  end

  def sign_up_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end
