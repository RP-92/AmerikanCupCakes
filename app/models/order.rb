class Order < ActiveRecord::Base
	  validates :name, presence: true
	  belongs_to :cakebase
	  belongs_to :cakefilling

	def self.search(search)
  		where("name LIKE ? OR email LIKE ? OR date LIKE ? OR phone LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
	end
end