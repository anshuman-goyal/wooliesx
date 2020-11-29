Given(/^I am on digital home screen$/) do
  digital_home_url = 'http://automationpractice.com/index.php'

  puts "URL : #{digital_home_url}"
  @browser.goto(digital_home_url)

  if @browser.title == 'Certificate Error: Navigation Blocked'
    @browser.goto("javascript:document.getElementById('overridelink').click()")
  end
end


Then(/^I will add product to cart$/) do
@browser.div(class: /product-container/).wait_until(&:present?)
@browser.div(class: /product-container/).click
@browser.div(class: /pb-center-column col-xs-12 col-sm-4/).wait_until(&:present?)
@browser.div(class: /box-cart-bottom/).p.click
end

And(/^I will continue shopping and add one more product$/) do
  binding.pry
  @browser.div(id: /layer_cart/).wait_until(&:present?)
  @browser.div(class: /button-container/).span.click
  @browser.div(class: /box-cart-bottom/).p.click
  @browser.div(id: /layer_cart/).wait_until(&:present?)
  @browser.div(class: /button-container/).a.click
end


And(/^I click on proceed to checkout button$/) do
  binding.pry
  @browser.div(id: /center_column/).wait_until(&:present?)
  @browser.p(class: /cart_navigation clearfix/).span.click
end
Then(/^I sign in to account$/) do
  @browser.div(class: /form_content clearfix/, index:1).wait_until(&:present?)
  @browser.div(class: /form_content clearfix/, index:1).text_field(id: /email/).set("agoyal.optus@gmail.com.au")
  @browser.div(class: /form_content clearfix/, index:1).text_field(id: /email/).send_keys :tab
  @browser.div(class: /form_content clearfix/, index:1).text_field(id: /passwd/).set("Dec@2020")
  @browser.div(class: /form_content clearfix/, index:1).text_field(id: /passwd/).send_keys :tab
  @browser.p(class: /submit/).button.click
end

And(/^I agree to T & C$/) do
  @browser.label(:visible_text => /I agree to the terms./).click
end

And(/^I provide payment details$/) do
  @browser.p(class: /payment_module/).wait_until(&:present?)
  @browser.p(class: /payment_module/, index:1).click
end

And(/^I click on confirm order button$/) do
  @browser.div(class: /box cheque-box/).wait_until(&:present?)
  @browser.p(class: /cart_navigation clearfix/).span.click
end

Then(/^I verify the order confirmation$/) do
  @browser.div(class: /box order-confirmation/).wait_until(&:present?)
  expect(@browser.div(class: /box order-confirmation/).text.include?('Your order will be sent as soon as we receive your payment.')).to be true
end

And(/^I will continue shopping and add new product$/) do
  @browser.div(id: /layer_cart/).wait_until(&:present?)
  @browser.div(class: /button-container/).span.click
  @browser.img(class: /logo img-responsive/).click
  @browser.divs(class: /product-container/)[1].wait_until(&:present?).click
  @browser.div(class: /box-cart-bottom/).p.click
  sleep(5)
  if @browser.div(class: /button-container/).a.present?
    @browser.div(class: /button-container/).a.wait_until(&:present?).click
  end

end