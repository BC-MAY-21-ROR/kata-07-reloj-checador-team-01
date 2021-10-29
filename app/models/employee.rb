class Employee < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  has_many :attendances
  validates :name, :email, :private_number, presence: true
  validates :email, :private_number, uniqueness: true
  validates :private_number, numericality: { only_integer: true }
  scope :with_private_number, ->(number) { where(private_number: number) }
  
end
