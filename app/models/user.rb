class User < ApplicationRecord
  has_many :posts
  before_create :create_remember_token
  has_secure_password

  def remember
    remember_token = SecureRandom.urlsafe_base64
    update_attribute(:remember_token, Digest::SHA1.hexdigest(remember_token))
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
      self.remember_token = Digest::SHA1.hexdigest(remember_token)
    end

end
