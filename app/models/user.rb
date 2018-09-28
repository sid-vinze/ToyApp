class User < ApplicationRecord
  before_save {self.email = email.downcase}
  before_save {self.name = name.capitalize}
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: email_regex}, uniqueness: true
  validates :name, presence: true, length: {maximum: 50}
  has_secure_password
  validates :password, presence: true
end
