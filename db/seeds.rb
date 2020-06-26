# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

taxon_names = [
  'Marchés', 'Fruits et Légumes', 'Boucheries', 'Poissoneries', 'Fromageries', 'Supermarchés', 'Épiceries Générales',
  'Charcutiers & Traiteurs', 'Italie', 'Rôtisseries', 'Caves'
]

taxon_names.each { |taxon_name| Taxon.create(name: taxon_name) }

shop_taxons = Taxon.all

shop_names = [
  'Boucherie Moderne', 'La Ferme de Longchamp', 'Primeur Oberkampf', 'Julhès Paris', 'Faidherbe Bio',
  'Boucherie Maison Janois et Fils', 'Fromagerie Marie-Anne Cantin', 'Fromagerie Taka & Vermo Artisans'
]

product_taxon_names = %w[Apéro Fromage Volaille Bœuf Rôtisserie Fruit Légumes Brunch Glaces Bio Épicerie Vins Choucroute]
product_names = product_taxon_names

available_on_dates = [Date.today + 1, Date.today - 1]
shop_names.each do |name|
  shop = Shop.create(
    name: name,
    slug: name.downcase.unicode_normalize.gsub(/\s/, '-'),
    available_on: available_on_dates[rand(0..1)]
  )

  shop_taxons.sample(rand(1..3)).each { |taxon| shop.taxons << taxon }

  product_taxon_names.sample(rand(0..product_taxon_names.length)).each do |taxon_name|
    taxon = Taxon.find_or_create_by(name: taxon_name)

    product_names.sample(rand(0..product_taxon_names.length)).each do |product_name|
      product = Product.create(
        name: product_name,
        description: "#{product_name} délicieux",
        price: rand(1..70),
        shop_id: shop.id
      )

      product.taxons << taxon if rand(0..1).zero?
    end
  end
end
