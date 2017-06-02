class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  self.primary_key = 'email'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  #Objetos tipo Seguimiento donde su id es el id de "siguiendo a", es decir, los que hacen referencia a el como usuario a seguir
  has_many(:followings, class_name: 'Follow',foreign_key: :following_id, dependent: :destroy)
  has_many(:followers, through: :followings, source: :follower) # Objetos tipo Usuario que lo siguen

  #Objetos tipo Seguimiento donde su id es el id de "seguido por", es decir, donde este usuario sigue a alguien más
  has_many(:follows_to, class_name: 'Follow', foreign_key: :follower_id)
  has_many(:follows, through: :follows_to, source: :following) # Objetos tipo Usuario que este usuario sigue

  has_many :interactions
  has_many :playlists

  enum role: [:user, :admin]
  before_create :default_role

  def default_role
    self.role = :user
  end

end

