class Startup < ApplicationRecord
  mount_uploader :logo, LogoUploader
  mount_uploader :decription_video, DecriptionUploader
  mount_uploader :banner, BannerUploader

  validates :address, presence:true, null:false
  validates :name, presence:true, null:false
  validates_length_of :resume,:minimum =>150,:message => "votre résumé  est trop court (doit contenir 150 mots au moins)"
  validates :resume, presence:true, null:false

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
end
