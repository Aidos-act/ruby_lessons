class ReviewsController < ApplicationController
  before_action :find_book
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @book.reviews.create(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @book, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = @book.reviews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:book_id, :user_id, :status, :body)
    end

    def find_book
      @book = Book.find(params[:book_id])
    end

end
