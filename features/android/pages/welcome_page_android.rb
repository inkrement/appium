require 'page-object'

class WelcomePage
  include PageObject

  def trait
    "//android.widget.TextView[contains(@text, \"Telegram\")]"
  end

  def await(opts={})
    wait_for_xpath_to_exist(trait)

    self
  end

  def skip_message()
    click_xpath skip_button

    wait_for_skip_done
  end

  def wait_for_skip_done
    result = :invalid
    registration_page = RegistrationPage.new($driver)
    registration_page.await()
  end


  def skip_button
    "//android.widget.TextView[contains(@text, \"START MESSAGING\")]"
  end

end
