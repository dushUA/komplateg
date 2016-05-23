# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  remember_token  :string
#  admin           :boolean          default(FALSE)
#

class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to Komplateg!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @pdf_files = @user.pdf_files
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find_by_id(params[:id]).destroy
    flash[:success] = 'User deleted.'
    redirect_to users_url
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def correct_user
    @user = User.find_by_id(params[:id])
    redirect_to root_url unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
