class User < ActiveRecord::Base

  has_many :garages
  has_secure_password

  def self.valid_params (params)
    !self.find_by(username: params[:username])
  end

end
