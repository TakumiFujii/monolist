class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  def show
    @user = User.find(params[:id])
    @items = @user.items.uniq
    @count_want = @user.want_items.count
  end

  def new
    @user = User.new
    #こう言う@〜って言うのをインスタンス変数って言うんやで！
    #基本やけどこれはコントローラでしか作れんくて
    #それを使うのはそれに対応するアクションのviewやぞ！
    #例えばこれならnew.html.erbってこと。
    #基本の基本やけどクソ大事
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
