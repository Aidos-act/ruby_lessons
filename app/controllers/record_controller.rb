class RecordController < ApplicationController

	def find
		@book = Book.find([2,4,6])
		render 'hello/recordf'
	end

	def find_by
		@book = Book.find_by(publish: 'JK Rowling')
		render 'books/show'
	end

	def find_by2
		@book = Book.find_by(genre: 'Fantasy' , price: '1600')
		render 'books/show'
	end

	def where
		@book = Book.where(genre: 'Fantasy').order(published: :asc)
		render 'hello/recordf'
	end

	def select
		@book = Book.where('price >= 800').select(:title, :price, :publish, :published, :genre)
		render 'hello/recordf'
	end

	def distinct
		@book = Book.select(:title, :price, :publish, :published, :genre).distinct(:false).order(:genre)
		render 'hello/recordf'
	end

	def limit
		@book = Book.order(title: :asc).limit(3).offset(4)
		render 'hello/recordf'
	end

	def page 
		page_size = 3
		page_num = params[:id] == nil ? 0 : params[:id].to_i - 1
		@book = Book.order(title: :asc).limit(page_size).offset(page_size * page_num)
		render 'hello/recordf'
	end

	def groupby
		@book = Book.select('publish, AVG(price) AS avg_price').group(:publish)
	end

	def havingby
		@book = Book.select('publish, AVG(price) AS avg_price').group(:publish).having('AVG(price) >= ?',2500)
	end

	def unscope
		@books = Book.where(publish: 'JK Rowling').order(:price).select(:published, :title).unscope(:where, :select)
		render 'books/index'
	end

	def none

		case params[:id]
			when 'all'
				@books = Book.all
			when 'new'
				@books = Book.order('published DESC').limit(5)
			when 'cheap'
				@books = Book.order(:price).limit(5)
			else
				@books = Book.none
		end
		render 'books/index'
	end

	def pluck
		render plain: Book.where(genre: 'Fantasy').pluck(:title, :price)
	end

	def scope
		@books = Book.fantasy.top10
		render 'hello/list'
	end

	def def_scope
		render plain: Book.all.inspect
	end

	def count
		cnt = Book.where(genre: 'Fantasy').count
		render plain: "There is #{cnt} Books in Fantasy"
	end

	def average
		price = Book.where(genre: 'Fantasy').average(:price)
		render plain: "The Average price of the Fantasy genre is #{price}."
	end

	def groupby2
		@books = Book.group(:publish).average(:price)
	end

	def literal_sql
		@book = Book.find_by_sql(['SELECT publish, AVG(price) AS avg_price FROM "books" GROUP BY publish HAVING AVG(price) >= ?', 2500])
		render 'record/groupby'
	end

	def update_all
		cnt = Book.where(publish: 'Aidos').update_all(publish: 'Aidos Updated')
		render plain: "#{cnt} author data of Aidos is updated."
	end

	def update_all2
		cnt = Book.order(:published).limit(5).update_all('price = price * 0.8')
		render plain: "#{cnt} Updated the prices of newest 5 books"
	end

	def enum_rec
		@book = Book.find(5)
		@review = @book.reviews.where(id: 4)
		@review.status = :published
		render plain: @review[status]
	end























end
