class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.where.not(id: @list.movies)
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
      if @bookmark.save
        redirect_to list_path(@list)
      else
        # show the form again but with the @restaurant in this method
        render 'new', status: :unprocessable_entity
      end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :rails_watch_list_movies_id)
  end

end
