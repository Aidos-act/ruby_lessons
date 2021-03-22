class Book < ApplicationRecord
	has_many :reviews
	has_many :fan_comments
	scope :fantasy, -> {where(genre: 'Fantasy')}
	scope :newer, -> {order(published: :desc)}
	scope :top10, -> {newer.limit(10)}
	default_scope { order(published: :desc)}
end
