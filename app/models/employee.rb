class Employee < ApplicationRecord
  acts_as_paranoid 
  belongs_to :user
  validates :name, :email, :private_number, presence: true
  validates :email, :private_number, uniqueness: true
  validates :private_number, numericality: { only_integer: true }
  
end
