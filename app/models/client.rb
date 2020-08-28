class Client < ApplicationRecord
  validates :name, :email, :phone, presence: true
  has_many :contacts, dependent: :destroy
end
