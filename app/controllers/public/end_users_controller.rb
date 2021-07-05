class Public::EndUsersController < ApplicationController
  def show
    @user = current_end_user
  end

  def edit
    @user = current_end_user
  end

  def update
    @user = current_end_user
    if @user.update(end_user_params)
      flash[:success] = "更新されました"
      redirect_to end_users_path
    else
      render :modify
    end

  end

  def confirm
  end

  def withdraw
    @user = current_end_user
    @user.update(is_unsubscribed: true)
    reset_session
    redirect_to root_path
  end
end

private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :telephone, :postal_code, :address, :email)
  end
