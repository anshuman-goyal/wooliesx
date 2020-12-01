module CheckoutModule

  def proceed_checkout_section
    @browser.div(id: /center_column/)
  end

  def proceed_checkout
    @browser.p(class: /cart_navigation clearfix/)
  end

  def sign_in_section
    @browser.form(id: /login_form/)
  end

  def sign_in_section_fields(ind, id)
    @browser.div(class: /form_content clearfix/, index: ind).text_field(id: /#{id}/)
  end

  def sign_in_section_button
    @browser.p(class: /submit/)
  end

  def terms_condition
    @browser.label(:visible_text => /I agree to the terms./)
  end

  def payment_section
    @browser.p(class: /payment_module/)
  end

  def payment_pay_check
    @browser.p(class: /payment_module/, index:1)
  end

  def confirm_payment
    @browser.div(class: /box cheque-box/)
  end

  def confirm_order_button
    @browser.p(class: /cart_navigation clearfix/)
  end

  def order_confirmation
    @browser.div(class: /box order-confirmation/)
  end

end