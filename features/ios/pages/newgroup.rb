require 'page-object'

class NewGroupPage
  include PageObject

  def trait
    "//UIAStaticText[contains(@value,'New Group')]"
  end

  def await(opts={})
    wait_for_xpath_to_exist(trait)
    self
  end


  def setName(name)
    enter_text_in_xpath(group_name_field, name)
  end

  def proceed()
    click_xpath submit_button
    wait_groupchat
  end

  def wait_groupchat
    gc_page = GroupChatPage.new($driver)

    wait_for_xpath_to_exist(gc_page.trait)
    gc_page.await()
  end

  def group_name_field
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.EditText[1]"
  end

  def submit_button
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]"
  end
end
