class Auto < ActiveRecord::Base
  belongs_to :garage

  def self.valid_params?(params)
    !params[:name].empty? && !params[:manufacturer].empty?
  end

  def self.valid_user? (params, current_user)
      @auto = self.find_by_id(params)
      @garage = @auto.garage
      @garage.user == current_user
  end

end
