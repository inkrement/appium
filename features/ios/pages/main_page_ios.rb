class MainPage

  def trait
    "UILabel text:'Chats'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end
end
