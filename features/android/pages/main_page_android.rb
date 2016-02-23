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

  def containsMessage(message)
    print "not able to implement this functionality for android"

    return true
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


  def new_message_button
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[2]/android.widget.ImageView[1]"
  end
end
