#Source: https://github.com/jamesbarker/cucumber-appium-android/blob/master/features/support/appium_custom.rb

Before do
  $driver ||= start_ios
end

After do
  $driver.quit
  $driver=nil
end
