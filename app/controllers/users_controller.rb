class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.limit(10).includes(:photos, :user).order('created_at DESC')
    # @posts = @user.posts
  end
end
