class Administrator::UsersController < Administrator::AdministratorController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.all
    respond_with(@users)
  end

  def show
    respond_with(@user, location: administrator_user_path)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(@user, location: administrator_user_path(@user))
  end

  def update
    @user.update(user_params)
    respond_with(@user, location: administrator_user_path(@user))
  end

  def destroy
    @user.destroy
    respond_with(@user, location: administrator_users_path)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
    end
end
