# frozen_string_literal: true

class StaticsController < ApplicationController
  layout '_navbar'

  before_action :contact, only: %i[show]

  def index; end

  def show
    if valid_page?

      render template: "statics/#{params[:page]}"

    else

      render page: '/public/404', status: :not_found

    end
  end

  private

  def valid_page?
    File.exist?(
      Pathname.new(
        Rails.root + "app/views/statics/#{params[:page]}.html.erb"
      )
    )
  end

  def contact
    @client = Client.new
  end
end
