class Auto < ActiveRecord::Base
  belongs_to :garage
  def self.valid_params?(params)
    return !params[:name].empty? && !params[:manufacturer].empty?
  end

end
