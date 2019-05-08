class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new #新規作成されたUserオブジェクトをインスタンス変数に代入します
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザーの新規作成に成功しました"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  private
  
  
    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
    end

end
