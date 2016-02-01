require 'page-object'

class MainPage
  include PageObject

  def trait
    "//UIAStaticText[contains(@value,'Chats')]"
  end

  def await(opts={})
    # ACCEPT NOTIFICATIONS
    click_xpath "//UIAApplication[1]/UIAWindow[6]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[1]"

    # ACCEPT CONTACT
    click_xpath "//UIAApplication[1]/UIAWindow[6]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[1]"

    wait_for_xpath_to_exist(trait)
    
    self
  end
end
