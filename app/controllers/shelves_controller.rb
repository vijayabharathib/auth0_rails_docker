class ShelvesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shelf, only: [:show, :edit, :update, :destroy]

  def index
    if(params[:place]=="wishlist")
      @shelves = Shelf.wishlist.by_user(@current_user) 
    elsif(params[:place]=="bought")
      @shelves = Shelf.bought.by_user(@current_user) 
    elsif(params[:place]=="reading")
      @shelves=Shelf.reading.by_user(@current_user) 
    elsif(params[:place]=="done")
      @shelves=Shelf.done.by_user(@current_user) 
    else
      @shelves=nil
    end
  end

  def new
    @shelf = Shelf.new
    @books=Book.all
  end


  def create
    logger.debug shelf_params
    @shelf = Shelf.new(shelf_params)
    @shelf.user_id=current_user.id
    respond_to do |format|
      if @shelf.save
        format.html { redirect_to @shelf.book, notice: 'Book was successfully added.' }
        format.json { render :show, status: :created, location: @shelf.book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

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
      params.require(:shelf).permit(:place, :book_id)
    end
end
