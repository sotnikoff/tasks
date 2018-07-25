class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable,
    :validatable, :lockable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{last_name} #{first_name}"
  end
end
