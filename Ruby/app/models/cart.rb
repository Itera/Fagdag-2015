class Cart
  attr_accessor :cart_storage

  def initialize(cart_storage)
    self.cart_storage = cart_storage
  end

  def add_product(id, size)
    cart[id] ||= {}
    cart[id][size] ||= 0
    cart[id][size]  += 1
  end

  def decrease_product(id, size)
    if cart.try(:[], id).try(:[], size)
      cart[id][size] -= 1

      if cart[id][size].zero?
        remove_product id, size
      end
    end
  end

  def remove_product(id, size)
    if cart[id]
      cart[id].delete size
    end
  end

  def products
    products = []

    cart.each do |id, preferences|
      preferences.each do |size, amount|
        products << [Product.find(id), size, amount]
      end
    end

    products
  end

  def empty?
    products.empty?
  end

  def clear
    cart_storage.delete :products
  end

  private

  def cart
    cart_storage[:products] ||= {}
  end
end
