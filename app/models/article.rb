class Article < ApplicationRecord
validates_presence_of :title, :body, :tags
end
