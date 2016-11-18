class Episode < ApplicationRecord
  belongs_to :member

  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "500x500#" }
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\z/
end
