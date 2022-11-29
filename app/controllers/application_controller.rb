class ApplicationController < ActionController::API
  def index
    render json: { message: "Hello and welcome to Backlog Attack!" }
  end
end
