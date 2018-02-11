class ShelvesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shelf, only: [:show, :edit, :update, :destroy]

  def index
    @shelves = Shelf.by_user
  end

  def new
    @shelf = Shelf.new
  end


#   # POST /books
#   # POST /books.json
#   def create
#     @book = Book.new(book_params)

#     respond_to do |format|
#       if @book.save
#         format.html { redirect_to @book, notice: 'Book was successfully created.' }
#         format.json { render :show, status: :created, location: @book }
#       else
#         format.html { render :new }
#         format.json { render json: @book.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /books/1
#   # PATCH/PUT /books/1.json
#   def update
#     respond_to do |format|
#       if @book.update(book_params)
#         format.html { redirect_to @book, notice: 'Book was successfully updated.' }
#         format.json { render :show, status: :ok, location: @book }
#       else
#         format.html { render :edit }
#         format.json { render json: @book.errors, status: :unprocessable_entity }
#       end
#     end
#   end



  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def shelf_params
      params.require(:shelf).permit(:type, :user_id,:book_id)
    end
end
