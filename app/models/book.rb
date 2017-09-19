class Book < ApplicationRecord
 validates :title, presence: true,
                   length: { minimum: 1 }
end
