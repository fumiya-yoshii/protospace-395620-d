class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:show]

  def show
    @user = User.find(params[:id])  # ユーザー情報を取得し、@userに代入
    @occupation_user = @user.occupation
    @profile = @user.profile
    @position_user = @user.position
    @prototypes = @user.prototypes
  end

  def edit
  end

end
