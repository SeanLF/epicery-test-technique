# frozen_string_literal: true

class ShopsController < ApplicationController
  def index
    @shops = Shop.available
  end

  def show; end
end
