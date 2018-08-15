class Garage < ActiveRecord::Base
  has_many :autos
  belongs_to :user

  def self.valid_params?(params)
    !params[:name].empty? && !params[:capacity].empty?
  end

  def self.valid_user?(params, current_user)
      @garage = self.find_by_id(params)
      @garage.user == current_user
  end


end
