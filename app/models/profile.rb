class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('profile-avatar.png')
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def full_name
    first_name + " " + last_name 
  end
end