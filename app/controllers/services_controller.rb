# == Schema Information
#
# Table name: services
#
#  id           :integer          not null, primary key
#  name_service :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ServicesController < ApplicationController
  before_action :signed_in_user, only: [:index, :show]
  before_action :set_service, only: [:show]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name_service)
    end
end
