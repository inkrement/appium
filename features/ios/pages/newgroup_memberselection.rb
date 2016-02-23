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
    click_xpath(search_icon)
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
    "//UIAButton[contains(@name,'Next')]"
  end

  def first_match
    "//UIAApplication[1]/UIAWindow[1]/UIATableView[2]/UIATableCell[1]"
  end

  def search_icon
    "//UIAStaticText[contains(@value,'Who would you like to message?')]"
  end

  def username_input_field
    "//UIATextField"
  end
end
