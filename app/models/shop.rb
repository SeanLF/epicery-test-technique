# frozen_string_literal: true

class Shop < ApplicationRecord
  has_many :products, dependent: :delete_all
  has_many :product_taxons, through: :products, source: :taxons

  has_and_belongs_to_many :taxons

  scope :available, -> { where('DATE(available_on) <= ?', Date.today) }

  def address
    "#{rand(1..300)} Boulevard #{random_word}, #{random_postal_in_paris} Paris"
  end

  def star_rating
    rand(3..5.0).round(1)
  end

  def description
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut...'
  end

  def delivery_price
    rand(4..7) + 0.90
  end

  def delivery_start_time(num = rand(7.0..11.5))
    hours, min = num.divmod(1)
    min = min < 5 ? '' : '30'
    "#{hours}h#{min}"
  end

  private

  def random_word
    ('a'..'z').to_a.sample(rand(5..10)).join.capitalize
  end

  def random_postal_in_paris
    rand(75_000..75_020)
  end
end
