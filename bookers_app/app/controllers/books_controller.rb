class BooksController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to books_path(list.id)
    else_app
      render :index
    end
  end






  private
    def list_params
      params.requore(:list).permit(:title,:body)
    end
end
