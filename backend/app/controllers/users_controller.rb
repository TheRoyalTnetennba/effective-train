class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users.map { |user| user.public_json }
  end

  # GET /users/1
  def show
    if logged_in? && current_user.id == @user.id
      render json: @user.private_json
    else
      render json: @user.public_json
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      render json: @user.private_json, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user.private_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.fetch(:user, {})
  end
end

