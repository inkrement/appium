require 'page-object'

class ChatPage
  include PageObject

  def trait
    "//android.widget.TextView[contains(@text,'last seen')]"
  end

  def await(opts={})
    wait_for_xpath_to_exist(trait)
    self
  end

  def composeMessage(text)
    enter_text_in_xpath(message_field, text)
  end

  def submitMessage()
    click_xpath(submit_button)
  end

  def submit_button
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[2]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[2]/android.widget.ImageView[1]"
  end

  def message_field
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[2]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.EditText[1]"
  end

end
