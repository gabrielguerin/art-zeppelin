# frozen_string_literal: true

class ArtworksController < ApplicationController
  layout '_navbar'

  before_action :set_artwork, only: %i[show edit update destroy]

  respond_to :js, :html, :json

  # GET /artworks

  # GET /artworks.json

  def index
    search = params[:search].present? ? params[:search] : nil

    @artworks = if search

                  # Render search results

                  Artwork.search(params[:search], page: params[:page], per_page: 20)

                else

                  # Render artworks

                  Artwork.all.order(created_at: :desc).page(params[:page])

                end
  end

  # GET /artworks/1

  # GET /artworks/1.json

  def show; end

  # GET /artworks/new

  def new
    @artwork = Artwork.new
  end

  # GET /artworks/1/edit

  def edit; end

  # POST /artworks

  # POST /artworks.json

  def create
    @artwork = Artwork.new(artwork_params)

    respond_to do |format|
      if @artwork.save

        format.html { redirect_to @artwork, notice: 'Artwork was successfully created.' }

        format.json { render :show, status: :created, location: @artwork }

      else

        format.html { render :new }

        format.json { render json: @artwork.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /artworks/1

  # PATCH/PUT /artworks/1.json

  def update
    respond_to do |format|
      if @artwork.update(artwork_params)

        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }

        format.json { render :show, status: :ok, location: @artwork }

      else

        format.html { render :edit }

        format.json { render json: @artwork.errors, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /artworks/1

  # DELETE /artworks/1.json

  def destroy
    @artwork.destroy

    respond_to do |format|
      format.html { redirect_to artworks_url, notice: 'Artwork was successfully destroyed.' }

      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_artwork
    @artwork = Artwork.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def artwork_params
    params.fetch(:artwork, {})
  end
end
