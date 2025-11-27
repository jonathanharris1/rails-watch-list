class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, presence: true, uniqueness: { scope: :list_id, message: "is already in the list" }
  validates :comment, presence: true, length: { minimum: 6 }
  validates :list, presence: true


end
