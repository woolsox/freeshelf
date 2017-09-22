class Book < ApplicationRecord
 belongs_to :user
 validates :title, presence: true,
                   length: { minimum: 1 }
 validates :author, presence: true
end
