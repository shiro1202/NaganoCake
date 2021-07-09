class Admin::EndUsersController < ApplicationController
  def show
  end

  def index
    @users = EndUser.all
  end

  def edit
  end

  def update
  end
end
