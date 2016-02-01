require 'page-object'

class RegistrationPage
  include PageObject

  def trait
    "//UIAStaticText[contains(@value, 'Your Phone')]"
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
      swipe(start_x: 0, start_y: 450, end_x: 0, end_y: 250, duration: 2000)

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
    "//UIATextField[contains(@value, 'Your phone number')]"
  end

  def country_dropdown
    "//UIAApplication[1]/UIAWindow[1]/UIAButton[1]"
  end

  def submit_button
    "//UIAButton[contains(@label, 'Next')]"
  end

  def country_label(country_code)
    "//UIATableCell/UIAStaticText[contains(@value, '#{country_code}')]"
  end
end
