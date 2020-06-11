# frozen_string_literal: true

class BlogsController < ApplicationController
  layout '_navbar'

  before_action :set_blog, only: %i[show edit update destroy]

  respond_to :js, :html, :json

  # GET /blogs

  # GET /blogs.json

  def index
    search = params[:search].present? ? params[:search] : nil

    @blogs = if search

               # Render search results

               Blog.search(params[:search], page: params[:page], per_page: 20)

             else

               # Render blog articles

               Blog.all.order(created_at: :desc).page(params[:page])

              end
  end

  # GET /blogs/1

  # GET /blogs/1.json

  def show; end

  # GET /blogs/new

  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit

  def edit; end

  # POST /blogs

  # POST /blogs.json

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save

        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }

        format.json { render :show, status: :created, location: @blog }

      else

        format.html { render :new }

        format.json { render json: @blog.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /blogs/1

  # PATCH/PUT /blogs/1.json

  def update
    respond_to do |format|
      if @blog.update(blog_params)

        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }

        format.json { render :show, status: :ok, location: @blog }

      else

        format.html { render :edit }

        format.json { render json: @blog.errors, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /blogs/1

  # DELETE /blogs/1.json

  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }

      format.json { head :no_content }
    end
  end

  def autocomplete
    render json: Blog.search(params[:search], {
                               fields: %w[title],
                               match: :word_start,
                               limit: 10,
                               load: false,
                               misspellings: { below: 5 }
                             }).map(&:title)
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def blog_params
    params.fetch(:blog, {})
  end
end
