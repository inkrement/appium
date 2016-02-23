require 'page-object'

class MainPage
  include PageObject

  def trait
    "//UIAStaticText[contains(@value,'Chats')]"
  end

  def await(opts={})
    # ACCEPT NOTIFICATIONS
    if xpath_exists? accept_notifications
      click_xpath accept_notifications
    end

    # ACCEPT CONTACT
    if xpath_exists? accept_contacts
      click_xpath accept_contacts
    end

    wait_for_xpath_to_exist(trait)

    self
  end

  def containsMessage(message)
    return xpath_exists? "//UIAStaticText[contains(@name,'#{message}')]"
  end

  def new_message()
    click_xpath new_message_button

    wait_for_nmc_done
  end


  def wait_for_nmc_done
    nm_page = NewMessagePage.new($driver)
    wait_for_xpath_to_exist nm_page.trait

    nm_page.await()
  end

  def accept_notifications
    "//UIAApplication[1]/UIAWindow[6]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[1]"
  end

  def accept_contacts
    "//UIAApplication[1]/UIAWindow[6]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[2]/UIAButton[1]"
  end

  def new_message_button
    "//UIAApplication[1]/UIAWindow[1]/UIANavigationBar[1]/UIAButton[3]"
  end
end
