class PrototypesController < ApplicationController
  #{authenticate_user!メソッドは、処理が呼ばれた段階で、
  #{ユーザーがログインしていなければ、そのユーザーをログイン画面に遷移させます。}
  before_action :authenticate_user!,except: [:index, :show]
  #{}before_action :move_to_index, except: [:index, :show]
  #{一覧ページ}
  #{}before_action :move_to_index, except: [:index, :show]
#{一覧ページ}
  def index
    @prototypes = Prototype.all
  end
#{ログイン時アクション}
  def new
    @prototype = Prototype.new
  end
#{登録}
  def create
    @prototype = Prototype.create(prototypes_params)
    if  @prototype.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end
#詳細ページ
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end
#{変更ページ}
  def edit
    @prototype = Prototype.find(params[:id])
    redirect_to action: :index if current_user.id != @prototype.user.id
  end
#{更新内容}
  def update
    @prototype = Prototype.find(params[:id])
    #{成功した場合、詳細ページに遷移}
    #{失敗した場合、詳細ページにてエラー文}
    if @prototype.update(prototypes_params)
      redirect_to action: :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #{削除処理}
  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
#{パラメータの中身の名称、どこにIDが入っているのかがわかる}
  def prototypes_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image, :content).merge(user_id: current_user.id)
  end
end
