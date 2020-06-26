# frozen_string_literal: true

module ShopsHelper
  def first_n_product_taxons(shop, num = 3)
    shop.product_taxons.uniq.first(num)
  end

  def star_rating(star_rating)
    "#{'⭐️' * star_rating.to_i} #{star_rating}"
  end

  def format_price(price)
    format('%<price>.2f', price: price)
  end
end
