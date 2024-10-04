class List < ApplicationRecord
  self.table_name = "rails_watch_list_lists"
  has_many :bookmarks, dependent: :destroy, foreign_key: "rails_watch_list_lists_id"
  has_many :movies, through: :bookmarks, foreign_key: "rails_watch_list_movies_id"
  validates :name, uniqueness: true, presence: true
  has_one_attached :photo

  def get_image_url
    if self.photo.attached?
      ActionController::Base.helpers.cl_image_path(self.photo.key)
    elsif self.movies.any?
      ActionController::Base.helpers.image_path(self.movies.first.poster_url)
    else
      ActionController::Base.helpers.image_path('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPQDYau3Hs4-xw1i8jVSUY4BlF4FLmg8lQqg&usqp=CAU')
    end
  end
end

def list_id
  rails_watch_list_lists_id
end