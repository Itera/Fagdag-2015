# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

import_path = 'db/import_data/produkter'
assets_path = 'app/assets/images/products'

products = {}

Dir.foreach(import_path) do |product|
  if product == "." or product == ".."
    next
  end

  id = product.split(".")[0].to_i
  path = "%s/%s" % [import_path, product]

  unless products[id]
    products[id] = {id: id}
  end

  if product.end_with? ".jpg"
    FileUtils.cp(path, assets_path)
    products[id][:image] = "products/%s" % [product]
  elsif product.end_with? ".txt"
    fields = File.readlines(path).map(&:chomp)
    products[id][:price] = fields[0].to_f
    products[id][:title] = fields[1]
    products[id][:description] = fields[2]
    products[id][:brand] = fields[3]
    products[id][:color] = fields[4]
    products[id][:size_min] = fields[5].to_i
    products[id][:size_max] = fields[6].to_i
  end
end

Product.delete_all
Product.create(products.values)

User.delete_all
h = User.create(name:"Haakon")
j = User.create(name:"Jonas")
t = User.create(name:"Trygve")
p = User.create(name:"Peter")

Order.delete_all
o = Order.create ()
h.orders.append(o)

OrderLine.delete_all
ol = OrderLine.create(product: Product.all[0], order: o, size: 44, count: 1)
