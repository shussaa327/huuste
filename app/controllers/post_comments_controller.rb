class PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_page_comments = @post.post_comments.page(params[:post_comments_pagina]).reverse_order
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_page_comments = @post.post_comments.page(params[:post_comments_pagina]).reverse_order
    @post_comment = PostComment.new
    post = Post.find(params[:post_id])
    comment = PostComment.find_by(post_id: post.id, id: params[:id])
    comment.destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
