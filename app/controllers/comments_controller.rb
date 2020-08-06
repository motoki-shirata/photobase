class CommentsController < ApplicationController
    before_action :correct_user, only: [:destroy]

    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.post_id = params[:post_id]

        if @comment.save
            flash[:success] = 'コメントを投稿しました。'
            redirect_to posts_path
        else
            flash[:success] = 'コメントの投稿に失敗しました。'
            redirect_to posts_path
        end
    end

    def destroy
        @comment=Comment.find_by(params[:id])
        @comment.destroy
        flash[:success] = 'コメントを削除しました。'
        redirect_to posts_path
    end
	private

	def comment_params
		params.require(:comment).permit(:content)
	end

    def correct_user
        @comment = current_user.comments.find_by(post_id: params[:post_id], id: params[:id])
        @post = Post.find(params[:post_id])
        unless @comment
            redirect_to posts_path
        end
    end
end
