class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.valid_email_regex
  USER_PARAMS = %i(name email role password password_confirmation).freeze

  before_save :downcase_email

  has_many :questions, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :exams, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.max_name}
  validates :email, presence: true,
            length: {minimum: Settings.min_email, maximum: Settings.max_email},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  enum role: {trainee: 0, suppervisor: 1, admin: 2}

  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.min_pass},
            allow_nil: true

  attr_accessor :remember_token, :activation_token, :reset_token

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password? token
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine.min_cost
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now
  end

  private
  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
