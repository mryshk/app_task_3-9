class BooksController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to book_path(@list.id)
      flash[:notice] = "Book was successfully created"
    elsif
      @lists = List.all
      render :index
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to book_path(@list.id)
      flash[:notice] = "Book was successfully updated"
    elsif
      render :edit
    end

  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed"
  end

  private
    def list_params
      params.require(:list).permit(:title,:body)
    end
end
