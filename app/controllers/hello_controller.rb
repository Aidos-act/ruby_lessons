class HelloController < ApplicationController


	def index

		@msg = 'Hello World'

	end



	def view

	end

	def list

		@books = Book.all
	end

end
