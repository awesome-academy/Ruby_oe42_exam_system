class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = Settings.valid_email_regex
  USER_PARAMS = %i(name email role password password_confirmation).freeze

  before_save :downcase_email

  has_many :questions, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :exams, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.max_name}
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  enum role: {trainee: 0, suppervisor: 1, admin: 2}

  validates :password, presence: true, length: {minimum: Settings.min_pass},
            allow_nil: true

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest string
      min_cost = ActiveModel::SecurePassword.min_cost
      cost = min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end
  end

  def send_delete_account_email
    UserMailer.delete_account(email).deliver_later
  end

  def send_devise_notification notification, *args
    devise_mailer.send(notification, self, *args).deliver_later
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
