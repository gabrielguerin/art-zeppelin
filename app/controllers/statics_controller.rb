# frozen_string_literal: true

class StaticsController < ApplicationController
  layout '_navbar'

  def show
    @client = Client.new
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
end
