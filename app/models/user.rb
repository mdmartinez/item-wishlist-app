class User < ActiveRecord::Base
  include BCrypt
  
  has_many :wishlists
  has_many :products, through: :wishlists

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password_digest, presence: true
  
  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(username,entered_password)
    user = User.find_by(username: username)
    user if user && user.password == entered_password
  end

  
end
