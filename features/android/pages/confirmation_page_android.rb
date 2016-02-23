require 'page-object'

class ConfirmationPage
  include PageObject

  def trait
    "//android.widget.TextView[contains(@text, 'Your code')]"
  end

  def await(opts={})
    wait_for_xpath_to_exist(trait)
    self
  end

  def select_confirmation_code(confirmation_code)
    enter_text_in_xpath(confirmation_code_input, confirmation_code)
  end

  def submit_confirmation_form()
    click_xpath submit_button
    wait_for_confirmation_done
  end


  def wait_for_confirmation_done
    main_page = MainPage.new($driver)

    wait_for_xpath_to_exist (main_page.trait)

    main_page.await()
  end


  def submit_button
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]"
  end

  def confirmation_code_input
    "(//android.widget.EditText)[1]"
  end
end
