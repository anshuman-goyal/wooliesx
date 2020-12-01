class ShopJourney
  include HomePageModule, ProductDetailModule, CheckoutModule

  def initialize(browser)
    @browser = browser
  end

end
