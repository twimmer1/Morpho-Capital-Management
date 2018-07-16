class Holding < ApplicationRecord
	has_many :leases
	has_many :users, through: :leases
	validates :state, presence: true, length: { minimum: 2 }
end
