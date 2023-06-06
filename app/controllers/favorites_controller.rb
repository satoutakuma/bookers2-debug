class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(user_id: current_user.id, book_id: params[:book_id])
    if @favorite.save
      redirect_back(fallback_location: root_path, notice: "Liked the book.")
    else
      redirect_back(fallback_location: root_path, alert: "Failed to like the book.")
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    @favorite.destroy
    redirect_back(fallback_location: root_path, notice: "Unliked the book.") 
  end
  
  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
