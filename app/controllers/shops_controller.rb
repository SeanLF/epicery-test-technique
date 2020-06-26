# frozen_string_literal: true

class ShopsController < ApplicationController
  def index
    @shops = Shop.available
  end

  def show
    if (@shop = Shop.includes(:product_taxons).find_by(slug: params[:slug]))
      @shop
    else
      head 404
    end
  end
end
