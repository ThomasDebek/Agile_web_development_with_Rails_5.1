class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  # Potrzebujemy teraz inteligetnej metody, ktora spr czy nasza lista produktow zawiera juz dodany produkt, jesli tak, to potrąca ilość, a jeśli nie to buduje nowy element zamówienia
  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end


end
