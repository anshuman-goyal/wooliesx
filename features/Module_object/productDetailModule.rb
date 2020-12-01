module ProductDetailModule

  def product_description
    @browser.div(class: /pb-center-column col-xs-12 col-sm-4/)
  end

  def product_detail_cart_button
    @browser.div(class: /box-cart-bottom/)
  end

  def product_add_successfully_layer
    @browser.div(id: /layer_cart/)
  end

  def product_add_successfully_layer_continue_shopping
    @browser.div(class: /button-container/)
  end

  def product_add_successfully_layer_proceed_checkout
    @browser.div(class: /button-container/).a(title: /Proceed to checkout/)
  end
end
