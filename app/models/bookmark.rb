class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :list_id, uniqueness: {
    scope: :movie_id
  }
  validates :comment, length: { minimum: 6, too_short: "%{count} characters is the minimum allowed" }
end
