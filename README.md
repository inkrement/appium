# Appium Tests
page-object (https://github.com/cheezy/page-object) was used for object page pattern.
## Install

```
bundler install
```

Run for android:

 * start emulator
 * run:

 > cucumber -p android

 > cucumber -p android features/sendAndReceive.feature --tags ~@ios-only

Run for ios:

## Relevant Configuration


## Appium and Calabash

Some method names are similar, like "click_button", but other query language.

## Bugs

Scrolling is supported (https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/touch-actions.md)
but does not work correctly:

 * Android: ScrollTo does not work (https://github.com/appium/appium/issues/5377,
   https://github.com/appium/appium/issues/5490), mobile API deprecated, sendKeyEvent()
 * iOS: Scroll not working (https://github.com/appium/appium/issues/5629,
   https://github.com/appium/appium/issues/4836, https://github.com/appium/appium/issues/4716)


Workaround: Send Key Event 20 (Arrow down) (http://stackoverflow.com/questions/7789826/adb-shell-input-events)
https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/appium-bindings.md

key_event changed to press_keycode (https://github.com/appium/ruby_lib/blob/ad8bf400711005f32440618b370ee2551f172a7d/docs/migration.md)
https://discuss.appium.io/t/undefined-method-key-event-for-appium-driver/714/4
