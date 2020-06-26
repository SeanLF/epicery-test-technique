# frozen_string_literal: true

class Taxon < ApplicationRecord
  has_and_belongs_to_many :shops
  has_and_belongs_to_many :products

  scope :with_at_least_one_shop, -> { joins(:shops).where('shops.available_on <= ?', Date.today).select(:name).distinct }
end
