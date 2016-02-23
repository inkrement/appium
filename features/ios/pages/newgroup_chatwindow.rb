require 'page-object'

class GroupChatPage
  include PageObject

  def trait
    "//UIAStaticText[contains(@value,'2 members')]"
  end

  def await(opts={})
    wait_for_xpath_to_exist(trait)
    self
  end
end
