class Episode < ApplicationRecord
  belongs_to :member
  has_many :comments

  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "500x500#" }
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\z/

  has_attached_file :mp3
  validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg","audio/mp3"] }, :file_name => { :matches => [/mp3\Z/] }

  def self.search(term)
    where('LOWER(title) LIKE :term OR LOWER(description) LIKE :term', term: "%#{term.downcase}%")
  end

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
