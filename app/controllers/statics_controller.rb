# frozen_string_literal: true

class StaticsController < ApplicationController
  layout '_navbar'

  def show; end

  def for_artists; end

  def for_companies; end

  def contact
    @client = Client.new
  end

  def deductions; end
end
