class User < ApplicationRecord
 has_many :books
 validates :user_name, presence: true, uniqueness: true,
                       length: { minimum: 4 }
 validates :password, presence: true,
                      length: { minimum: 6 }

 has_secure_password
end
