class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    # POST para criar Task
    # criar um Task novo usando a info que veio do formulario
    @list = List.new(new_list_params)
    # guardar no banco de dados
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end
## CREATE?
  private

  # params para criar um Task (apenas title + details)
  # não queremos deixar o usuario criar um Task com 'completed: true'
  def new_list_params
    params.require(:list).permit(:name)
  end

end
