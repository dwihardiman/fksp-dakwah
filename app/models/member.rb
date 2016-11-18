class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :episodes

  has_attached_file :avatar, styles: { large: "1000x1000#", medium: "500x500#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
