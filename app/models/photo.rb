class Photo < ActiveRecord::Base
  has_attached_file :picture, styles: { gallery: "600x600>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates_attachment :picture,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
