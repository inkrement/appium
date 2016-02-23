require 'page-object'

class ChatPage
  include PageObject

  def trait
    "//UIAButton[contains(@name,'Chats')]"
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
    "//UIAButton[contains(@name,'Send')]"
  end

  def message_field
    "//UIATextView"
  end

end
