class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
	  @post = Post.find(params[:post_id])
	  @comment = Comment.new(comment_params)
  	@comment.post_id = @post.id
   	@comment.customer_id = current_customer.id
  	if @comment.save
  	  redirect_to post_path(@post.id)
	  else
  	  render 'posts/show'
  	end
  	unless @comment.save
      render 'error'
    end
  end

	def destroy
		@post = Post.find(params[:post_id])
  	comment = @post.comments.find(params[:id])
		comment.destroy
		redirect_to request.referer
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end
end
