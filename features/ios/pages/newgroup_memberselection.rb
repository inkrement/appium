require 'page-object'

class NewGroupMemberSelectionPage
  include PageObject

  def trait
    "//UIAStaticText[contains(@value,'New Group')]"
  end

  def await(opts={})
    wait_for_xpath_to_exist(trait)
    self
  end

  def searchAndSelectFirst(name)
    ## enter name
    enter_text_in_xpath(username_input_field, name)
    ## select first
    click_xpath(first_match)
    ## proceed
    click_xpath(submit)
    ## await new page
    wait_for_newgroupwindow()
  end

  def wait_for_newgroupwindow
    ng_page = NewGroupPage.new($driver)

    wait_for_xpath_to_exist (ng_page.trait)
    ng_page.await()
  end

  def submit
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]"
  end

  def first_match
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.ListView[1]/android.widget.FrameLayout[1]"
  end

  def username_input_field
    "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.EditText[1]"
  end
end
