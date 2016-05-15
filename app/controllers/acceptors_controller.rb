# == Schema Information
#
# Table name: acceptors
#
#  id               :integer          not null, primary key
#  name_acceptor    :string
#  bank_acceptor    :string
#  account_acceptor :string
#  key_acceptor     :string
#  mfo_acceptor     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class AcceptorsController < ApplicationController
  before_action :signed_in_user, only: [:index, :show]
  before_action :set_acceptor, only: [:show]

  # GET /acceptors
  # GET /acceptors.json
  def index
    @acceptors = Acceptor.all
  end

  # GET /acceptors/1
  # GET /acceptors/1.json
  def show
  end

  # GET /acceptors/new
  # def new
  #   @acceptor = Acceptor.new
  # end

  # GET /acceptors/1/edit
  # def edit
  # end

  # POST /acceptors
  # POST /acceptors.json
  # def create
  #   @acceptor = Acceptor.new(acceptor_params)
  #
  #   respond_to do |format|
  #     if @acceptor.save
  #       format.html { redirect_to @acceptor, notice: 'Acceptor was successfully created.' }
  #       format.json { render :show, status: :created, location: @acceptor }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @acceptor.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /acceptors/1
  # PATCH/PUT /acceptors/1.json
  # def update
  #   respond_to do |format|
  #     if @acceptor.update(acceptor_params)
  #       format.html { redirect_to @acceptor, notice: 'Acceptor was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @acceptor }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @acceptor.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /acceptors/1
  # DELETE /acceptors/1.json
  # def destroy
  #   @acceptor.destroy
  #   respond_to do |format|
  #     format.html { redirect_to acceptors_url, notice: 'Acceptor was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acceptor
      @acceptor = Acceptor.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acceptor_params
      params.require(:acceptor).permit(:name_acceptor, :bank_acceptor, :account_acceptor, :key_acceptor, :mfo_acceptor)
    end
end
