require 'page-object'

class ConfirmationPage
  include PageObject

  def trait
    "//UIAStaticText[contains(@value, '+43 699 11602033')]"
  end

  def await(opts={})
    wait_for_xpath_to_exist(trait)
    self
  end

  def select_confirmation_code(confirmation_code)
    enter_text_in_xpath(confirmation_code_input, confirmation_code)
  end

  def submit_confirmation_form()
    # ios submits it automatically
    #click_xpath submit_button
    wait_for_confirmation_done
  end

  def wait_for_confirmation_done
    result = :invalid
    main_page = MainPage.new($driver)

    main_page.await()
  end


  def submit_button
    "//UIAButton[contains(@label, 'Next')]"
  end

  def confirmation_code_input
    "//UIATextField"
  end
end
