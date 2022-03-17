class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    user = find_user
    if user
      render json: user, include: :items
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  private

  def find_user
    User.find_by(id: params[:id])
  end




end
