class Contact < ApplicationRecord
  validates :name, :email, :phone, presence: true
  belongs_to :client
end
