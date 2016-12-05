class User < ApplicationRecord

	validates :first_name, presence: true
	validates :last_name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
									  format: { with: VALID_EMAIL_REGEX },
									  uniqueness: { case_sensitive: false }
	validates :years_of_education, presence: true
end
