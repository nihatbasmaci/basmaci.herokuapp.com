class UsersController < ApplicationController
  before_action :authenticate_user! # Kullanıcı giriş yapmış mı ?  
 # before_action :permited?
  def index
  	@users = User.all
  end

  private

 # def permited?
 # 	redirect_to root_path, alert: 'Yetkisiz Erişim' unless current_user.admin
 # end
end
