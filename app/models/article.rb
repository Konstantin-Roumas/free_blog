class Article < ApplicationRecord
  validates_presence_of :title, :body, :tags
  has_one_attached :logo
  def self.search(search)
    where("tags LIKE ?", "%#{search}%")
  end
end
