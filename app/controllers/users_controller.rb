class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  # def create
  #   @user = User.new(user_params)
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:first_name, :first_kana, :last_name, :last_kana, :nickname, :email, :date, :password, :encrypted_password)
  # end

end
