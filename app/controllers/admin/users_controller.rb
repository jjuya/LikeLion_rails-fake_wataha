class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.all
  end

  def destroy
    set_user
    @user.destroy

    redirect_to admin_users_path
  end

  def upgrade
    set_user

    @user.update(role: "admin")

    redirect_to admin_users_path
  end

  def downgrade
    set_user

    @user.update(role: "regular")

    redirect_to admin_users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
