# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]

  respond_to :js, :html, :json

  # GET /clients

  # GET /clients.json

  def index
    @clients = Client.all
  end

  # GET /clients/1

  # GET /clients/1.json

  def show; end

  # GET /clients/new

  def new
    @client = Client.new
  end

  # GET /clients/1/edit

  def edit; end

  # POST /clients

  # POST /clients.json

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save

        format.js

        format.html { redirect_to root_path, notice: 'Vous avez bien été ajouté à notre newsletter' }

        format.json { render :show, status: :created, location: @client }

      else

        format.html { render :new }

        format.json { render json: @client.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /clients/1

  # PATCH/PUT /clients/1.json

  def update
    respond_to do |format|
      if @client.update(client_params)

        format.html { redirect_to @client, notice: 'Client was successfully updated.' }

        format.json { render :show, status: :ok, location: @client }

      else

        format.html { render :edit }

        format.json { render json: @client.errors, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /clients/1

  # DELETE /clients/1.json

  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }

      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_client
    @client = Client.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def client_params
    params.require(:client).permit(
      :first_name,
      :last_name,
      :email,
      :job,
      :gender,
      :address,
      :telephone,
      :commment
    )
  end
end
