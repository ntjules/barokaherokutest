class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i(google)
  has_one_attached :avatar
  #startup connexion
  has_many :startups,dependent: :destroy
  #comments function
  has_many :comments,dependent: :destroy
  #promote function
  has_many :favorites, dependent: :destroy
  #relationship function
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  # Aouth google
  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
    user = User.new(email: auth.info.email,
                      avatar: auth.info.avatar,
                      name: auth.info.name,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                   )
    end
    user.save
    user
  end
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      "/default-avatar.jpg"
    end
  end

  #Suivre l'utilisateur spécifié
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  #Vérifiez si #Follow
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
  # Annuler le suivi de l'utilisateur spécifié
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
