class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to @list, notice: 'Le bootmark a été créée avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

   def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list),status: :see_other, notice: 'Le bookmark a été supprimé avec succès.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
