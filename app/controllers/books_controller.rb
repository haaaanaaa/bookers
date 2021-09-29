class BooksController < ApplicationController


  def index
      @books = Book.all
      @book = Book.new
  end

  def show
     @book = Book.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.new(book_params)

    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # ３. トップ画面へリダイレクト
    redirect_to book_path(@book.id)
    else
      @books = Book.all
    render :index

    end

     flash[:notice] = "successfully"
  end

  def edit
    @book = Book.find(params[:id])  end

  def update
    @book = Book.find(params[:id])

       if @book.update(book_params)

     flash[:notice] = "successfully"

    redirect_to book_path(@book)
       else
    render :edit


       end
       
  end

   def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path  end





 private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
