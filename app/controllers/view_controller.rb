class ViewController < ApplicationController

  def form_tag

  	@book = Book.new

  end

  def form_for

  	@book = Book.new

  end

  def select
    @book = Book.new(genre: 'Fantasy')
  end

  def group_select
    @review = Review.new
    @author = Author.all
  end 

  def con

  end

  def multi
    render layout: 'layout'
  end

  def partial_basic
    @book = Book.find(1)
  end

  def partial_param
    @book = Book.find(1)
  end

  def partial_col
    @books = Book.all
  end

end
