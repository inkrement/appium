require 'page-object'

class NewMessagePage
  include PageObject

  def trait
    "//android.widget.TextView[contains(@text, 'New Message')]"
  end

  def await(opts={})
    wait_for_xpath_to_exist(trait)
    self
  end

  def createNewGroupChat()
    click_xpath new_group_button


    wait_for_ng_ms_window
  end

  def searchAndSelectFirst(name)
    ## search for contact using name
    click_xpath search_icon
    enter_text_in_xpath(username_input_field, name)

    ## select first match
    click_xpath first_result

    wait_for_chatwindow()
  end

  def wait_for_chatwindow
    chat_page = ChatPage.new($driver)
    wait_for_xpath_to_exist chat_page.trait

    chat_page.await()
  end

  def wait_for_ng_ms_window
    member_selection_page = NewGroupMemberSelectionPage.new($driver)
    wait_for_xpath_to_exist member_selection_page.trait

    member_selection_page.await()
  end

  def search_icon
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]"
  end

  def new_group_button
    "//android.widget.TextView[contains(@text, 'New Group')]"
  end

  def username_input_field
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.EditText[1]"
  end

  def first_result
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[2]/android.widget.ListView[1]/android.view.View[1]"
  end

end
