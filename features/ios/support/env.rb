#Source: https://github.com/jamesbarker/cucumber-appium-android/blob/master/features/support/appium_custom.rb

require "selenium-webdriver"

$wait = Selenium::WebDriver::Wait.new(:timeout => 30)
