require 'page-object'
require 'appium_lib'

class RegistrationPage
  include PageObject

  def trait
    "//android.widget.TextView[contains(@text, \"Your phone\")]"
  end

  def await(opts={})
    wait_for_xpath_to_exist(trait)
    self
  end


  def select_countrycode(country_code)
    # click on country selection
    click_xpath (country_dropdown)

    sleep 1

    # scroll until right country code is found
    q = xpath_exists? country_label(country_code)
    while !q
      #execute_script 'mobile: scroll', direction: 'down'
      $driver.press_keycode 20
      $driver.press_keycode 20
      $driver.press_keycode 20
      $driver.press_keycode 20
      $driver.press_keycode 20
      $driver.press_keycode 20
      $driver.press_keycode 20


      sleep 1
      q = xpath_exists? country_label(country_code)
    end

    click_xpath country_label(country_code)
  end

  def submit_registration_form()
    click_xpath submit_button

    wait_for_registration_done
  end

  def wait_for_registration_done
    result = :invalid
    confirmation_page = ConfirmationPage.new($driver)
    wait_for_xpath_to_exist confirmation_page.trait

    confirmation_page.await()
  end

  def select_phonenumber(phone_number)
    enter_text_in_xpath(phone_input, phone_number)
  end

  def phone_input
    "(//android.widget.EditText)[2]"
  end

  def country_dropdown
    "(//android.widget.TextView)[2]"
  end

  def submit_button
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]"
  end

  def country_label(country_code)
    "//android.widget.TextView[contains(@text,'#{country_code}')]"
  end
end
