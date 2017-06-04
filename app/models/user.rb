class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:facebook]

  self.primary_key = 'email'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  #Objetos tipo Seguimiento donde su id es el id de "siguiendo a", es decir, los que hacen referencia a el como usuario a seguir
  has_many(:followings, class_name: 'Follow',foreign_key: :following_id, dependent: :destroy)
  has_many(:followers, through: :followings, source: :follower) # Objetos tipo Usuario que lo siguen

  #Objetos tipo Seguimiento donde su id es el id de "seguido por", es decir, donde este usuario sigue a alguien más
  has_many(:follows_to, class_name: 'Follow', foreign_key: :follower_id, dependent: :destroy
  )
  has_many(:follows, through: :follows_to, source: :following) # Objetos tipo Usuario que este usuario sigue

  has_many :interactions
  has_many :playlists

  enum role: [:user, :admin]
  before_create :default_role

  def default_role
    self.role = :user
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      username = auth.info.name.gsub(/[\s]/, "_")
      while username.size > 20
        username.chop!
      end
      user.username = username
      user.avatar = URI.parse(auth.info.image) # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end

