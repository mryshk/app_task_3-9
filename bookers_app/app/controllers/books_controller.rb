class BooksController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to book_path(list.id)
  end

  def edit
    @list = List.find(params[:id])
  end


  private
    def list_params
      params.require(:list).permit(:title,:body)
    end
end
