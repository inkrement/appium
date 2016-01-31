#Source: https://github.com/jamesbarker/cucumber-appium-android/blob/master/features/support/appium_custom.rb

def start_android
    apk = {
        platformName: :android,
        deviceName: :nexus,
        app: File.expand_path("~/Documents/dipl/TelegramAndroid/TMessagesProj/build/outputs/apk/TMessagesProj-release.apk"),
        appPackage: 'org.telegram.messenger',
        appActivity: 'org.telegram.ui.LaunchActivity'
      }

    @appium = Appium::Driver.new(caps: apk)

    @appium.start_driver
end
