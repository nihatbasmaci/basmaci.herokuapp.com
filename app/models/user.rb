class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :answers
  has_many :questions
  has_one :profile, dependent: :destroy

  after_create :make_profile, on: :create 
   def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]

  end
end

  def make_profile
    create_profile(
      first_name: "",
      last_name: "",
      phone: ""
    )
  end
end
