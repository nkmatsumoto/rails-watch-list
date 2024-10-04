class Movie < ApplicationRecord
  self.table_name = "rails_watch_list_movies"
  has_many :bookmarks, foreign_key: "rails_watch_list_movies_id"
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
end

def movie_id
  rails_watch_list_movies_id
end