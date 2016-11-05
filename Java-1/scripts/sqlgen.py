import glob

f = open("importproducts.sql", "w")

f.write("delete from PRODUCTS;")

for fname in glob.glob("fagdag-januar-2015/produkter"):
	
	lines = open(fname).read().splitlines()
	f.write("insert into products (id, product_id, product_name, description, price, stock_quantity, imageURL, brand, color, min_size, max_size) values (%s, %s, %s, %s, %s, %s, %s)", (lines[0], lines[1], lines[2], lines[3], lines[4], lines[5], lines[6]))

f.close()