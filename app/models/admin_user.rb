class AdminUser < ApplicationRecord

  has_secure_password

  # Relationships
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, through: :section_edits

  # Validation
  EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[a-z]{2,}/i
  FORBIDDEN_USERNAMES = ['littlebopeep', 'humptydumpty', 'marymary']

  validates_presence_of :first_name
  validates_length_of :first_name, maximum: 25

  validates_presence_of :last_name
  validates_length_of :last_name, maximum: 50

  validates_presence_of :username
  validates_length_of :username, within: 8..25
  validates_uniqueness_of :username
  validate :username_is_allowed
  validate :no_new_users_on_thursday

  validates :email, presence: true,
                    length: { maximum: 50 },
                    uniqueness: true,
                    format: { with: EMAIL_REGEX },
                    confirmation: true



  private

  def username_is_allowed
    if FORBIDDEN_USERNAMES.include?(username)
      errors.add(:username, "has been restricted from use.")
    end
  end

  def no_new_users_on_thursday
    if Time.now.wday == 4
      errors.add(:base, 'No new users on Thursday')
    end
  end
end
