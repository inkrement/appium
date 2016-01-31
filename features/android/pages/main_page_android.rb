require 'page-object'

class MainPage
  include PageObject

  def trait
    "//android.widget.TextView[contains(@text,'Telegram')]"
  end

  def await(opts={})
    wait_for_xpath_to_exist(trait)
    self
  end
end
