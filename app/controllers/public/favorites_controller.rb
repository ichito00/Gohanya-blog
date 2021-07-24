class Public::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.new(customer_id: current_customer.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
    redirect_to request.referer
  end
end
