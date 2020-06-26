# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :setup_data_for_menu

  private

  def setup_data_for_menu
    shop_taxons
  end

  def shop_taxons
    @taxons_with_at_least_one_available_shop = Taxon.with_at_least_one_shop
                                                    .select(:name).distinct.order(:name).pluck(:name)
  end
end
