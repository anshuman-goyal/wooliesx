require_relative '../Page_Object/page_Object.rb'

Given(/^I am on digital home screen$/) do
  digital_home_url = 'http://automationpractice.com/index.php'

  puts "URL : #{digital_home_url}"
  @browser.goto(digital_home_url)

  $purchase = ShopJourney.new($browser)

  if @browser.title == 'Certificate Error: Navigation Blocked'
    @browser.goto("javascript:document.getElementById('overridelink').click()")
  end
end


Then(/^I will add product to cart$/) do
  $purchase.product_container(0).wait_until(&:present?)
  $purchase.product_container(0).click
  $purchase.product_description.wait_until(&:present?)
  $purchase.product_detail_cart_button.p.click
end

And(/^I will continue shopping and add one more product$/) do
  $purchase.product_add_successfully_layer.wait_until(&:present?)
  $purchase.product_add_successfully_layer_continue_shopping.span.click
  $purchase.product_detail_cart_button.p.click
  $purchase.product_add_successfully_layer.wait_until(&:present?)
  $purchase.product_add_successfully_layer_proceed_checkout.click
end

And(/^I click on proceed to checkout button$/) do
  $purchase.proceed_checkout_section.wait_until(&:present?)
  $purchase.proceed_checkout.span.click
end

Then(/^I sign in to account$/) do
  $purchase.sign_in_section.wait_until(&:present?)
  $purchase.sign_in_section_fields(1, 'email').set("agoyal.optus@gmail.com.au")
  $purchase.sign_in_section_fields(1, 'email').send_keys :tab
  $purchase.sign_in_section_fields(1, 'passwd').set("Dec@2020")
  $purchase.sign_in_section_fields(1, 'passwd').send_keys :tab
  $purchase.sign_in_section_button.button.click
end

And(/^I agree to T & C$/) do
  $purchase.terms_condition.click
end

And(/^I provide payment details$/) do
  $purchase.payment_section.wait_until(&:present?)
  $purchase.payment_pay_check.click
end

And(/^I click on confirm order button$/) do
  $purchase.confirm_payment.wait_until(&:present?)
  $purchase.confirm_order_button.span.click
end

Then(/^I verify the order confirmation$/) do
  $purchase.order_confirmation.wait_until(&:present?)
  expect($purchase.order_confirmation.text.include?('Your order will be sent as soon as we receive your payment.')).to be true
end

And(/^I will continue shopping and add new product$/) do
  $purchase.product_add_successfully_layer.wait_until(&:present?)
  $purchase.product_add_successfully_layer_continue_shopping.span.click
  $purchase.home_page_logo.click
  $purchase.product_container(1).wait_until(&:present?).click
  $purchase.product_detail_cart_button.p.click
  sleep(5)
  if $purchase.product_add_successfully_layer_continue_shopping.a.present?
    $purchase.product_add_successfully_layer_continue_shopping.a.wait_until(&:present?).click
  end
end