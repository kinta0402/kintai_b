class UsersController < ApplicationController
  
  # beforeアクション = Usersコントローラー内で定義されている全てのアクションが実行される前にbefore_actionが実行される
  # なぜbefore_actionするのか？ ⇒ログインしていないユーザーが、ユーザー情報編集や、更新を出来ないようにする為！！
  before_action :logged_in_user, only: [:edit, :update]
  # editアクションとupdateアクションが実行される直前のみ、logged_in_userを実行する
  
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
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
  
    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
    end

    # beforeアクション
    
    # ログイン済みユーザーか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
end
