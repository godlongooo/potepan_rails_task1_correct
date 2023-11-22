class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :allday, :memo))
        if @post.save
            flash[:notice] = "投稿を保存しました"
            redirect_to posts_path #一覧へ
        else
            flash.now[:notice] = "投稿に失敗しました"
            render action: :new#新規投稿へ renderにすることで入力内容が消えないようにする
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def edit
        @post = Post.find_by(id: params[:id])
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :allday, :memo))
            flash[:notice] = "IDが「#{@post.id}」の投稿を更新しました"
            redirect_to posts_path #一覧へ
        else
            flash[:notice] = "編集に失敗しました"
            redirect_to edit_post_path #編集画面へ
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        flash[:notice] = "IDが「#{@post.id}」の投稿を削除しました"
        redirect_to posts_path #一覧へ
    end

end
