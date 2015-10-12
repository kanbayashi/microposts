class UsersController < ApplicationController
  before action :set_users, only: [:edit, :update]
  def show # 追加
   @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update (user_params)
      #保存に成功した場合は、トップページへリダイレクト
      redirect_to root_path , notice: 'プロフィールを変更しました'
    else
      #保存に失敗した場合は、編集画面へ戻す
      render 'edit'
    end  
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def set_users
    @user = User.find(params[:id])
  end
end