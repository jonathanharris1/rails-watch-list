class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # POST para criar Task
    # criar um Task novo usando a info que veio do formulario
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    # guardar no banco de dados
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    # achar o Task usando o ID nos parametros
    @bookmark = Bookmark.find(params[:id])
    # usar o metodo .destroy do ActiveRecord para deletar o Task do banco de dados
    @bookmark.destroy

    # redireccionar ao index page
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  ## CREATE?
  private

  # params para criar um Task (apenas title + details)
  # não queremos deixar o usuario criar um Task com 'completed: true'
  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
