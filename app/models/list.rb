class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
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
