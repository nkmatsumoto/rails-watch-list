class Bookmark < ApplicationRecord
  self.table_name = "rails_watch_list_bookmarks"
  belongs_to :movie, foreign_key: "rails_watch_list_movies_id"
  belongs_to :list, foreign_key: "rails_watch_list_lists_id"
  validates :list_id, uniqueness: {
    scope: :movie_id
  }
  validates :comment, length: { minimum: 6, too_short: "%{count} characters is the minimum allowed" }
end
