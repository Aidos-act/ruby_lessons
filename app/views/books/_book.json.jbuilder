json.extract! book, :id, :title, :price, :publish, :published, :created_at, :updated_at
json.url book_url(book, format: :json)
