class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks

  attr_accessor :password, :password_confirmation

  validates :name,  presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, 
            format: {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\z/}
  validates_confirmation_of :password
  before_save :hash_password

  def hash_password
    self.password_hash = BCrypt::Password.create(self.password)
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end
end
