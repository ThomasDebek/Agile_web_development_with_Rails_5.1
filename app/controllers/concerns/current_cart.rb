module CurrentCart

  private   # Kawalek probki kodu ktory mozemy wykorzystac w różnych miejscach

  def set_cart                                 #metoda ustawiajaca aktualny koszyk
    @cart = Cart.find(session[:cart_id]) # Tutaj próbujemy znaleść o ile taki koszyk instine
  rescue ActiveRecord::RecordNotFound          # Jeżeli go nie znajdzie
    @cart = Cart.create                        # Tworzymy koszyk
    session[:cart_id] = @cart.id               # i przechowujemy jego sesje
  end

end