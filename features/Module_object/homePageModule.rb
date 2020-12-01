module HomePageModule

  def product_container(item)
    @browser.divs(class: /product-container/)[item]
  end

  def home_page_logo
    @browser.img(class: /logo img-responsive/)
  end

end
