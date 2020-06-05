require "keybow"

function setup()
    keybow.auto_lights(false)
    keybow.clear_lights()
    
    keybow.set_pixel(0, 255, 0, 0) -- Red - Sound toggle
    keybow.set_pixel(1, 255, 215, 0) -- Orange
    keybow.set_pixel(2, 55, 0, 255) -- Blue - VPN

    keybow.set_pixel(3, 0, 255, 255) -- Cyan - Volume Down
    keybow.set_pixel(4, 55, 255, 0) -- Magenta
    keybow.set_pixel(5, 55, 255, 0) -- Magenta
    
    keybow.set_pixel(6, 0, 255, 255) -- Cyan - Volume up
    keybow.set_pixel(7, 0, 55, 255) -- Cyan
    keybow.set_pixel(8, 0, 55, 255) -- Cyan
    
    keybow.set_pixel(9, 255, 0, 0) -- Red - Mic toggle
    keybow.set_pixel(10, 155, 155, 155) -- Gray - Screenshot
    keybow.set_pixel(11, 255, 100, 100) -- Pink - Lock
end

-- Handy hotkeys for Adobe Lightroom Classic CC --

meta_key = keybow.LEFT_META -- For macOS
-- meta_key = keybow.LEFT_CTRL -- For Windows

-- Key mappings --

function handle_key_00(pressed) -- Toggle sound
-- Meta + F1
    if pressed then
        keybow.set_modifier(meta_key, keybow.KEY_DOWN)
        keybow.tap_key(keybow.F1)
        keybow.set_modifier(meta_key, keybow.KEY_UP)
    end
end

function handle_key_01(pressed) -- Crop
-- Meta + F3 : Volume increase
    keybow.set_key(keybow.F3, "pressed")
end

function handle_key_02(pressed) -- VPN
-- Meta + F12
    if pressed then
        keybow.set_modifier(meta_key, keybow.KEY_DOWN)
        keybow.tap_key(keybow.F12)
        keybow.set_modifier(meta_key, keybow.KEY_UP)
    end
end

function handle_key_03(pressed) -- Volume down
-- Meta + F3
    if pressed then
        keybow.set_modifier(meta_key, keybow.KEY_DOWN)
        keybow.tap_key(keybow.F3)
        keybow.set_modifier(meta_key, keybow.KEY_UP)
    end
end

function handle_key_04(pressed) -- Full screen
-- Meta + F2 : Volume decrease
    keybow.set_key(keybase.F2, pressed)
end

function handle_key_05(pressed) -- Compare view
    keybow.set_key("c", pressed)
end

function handle_key_06(pressed) -- Volume up
-- Meta + F2
    if pressed then
        keybow.set_modifier(meta_key, keybow.KEY_DOWN)
        keybow.tap_key(keybow.F2)
        keybow.set_modifier(meta_key, keybow.KEY_UP)
    end
end

function handle_key_07(pressed) -- Mute sound
-- Meta + F1
-- amixer -D pulse set Master 1+ toggle 
    if pressed then
        keybow.set_modifier(meta_key, keybow.KEY_DOWN)
        keybow.tap_key(keybow.F1)
        keybow.set_modifier(meta_key, keybow.KEY_UP)
    end
end

function handle_key_08(pressed) -- Develop view
    keybow.set_key("8", pressed)
end

function handle_key_09(pressed) -- Import
-- Meta + F4
-- amixer -D pulse set Capture 1+ toggle 
    if pressed then
        keybow.set_modifier(meta_key, keybow.KEY_DOWN)
        keybow.tap_key(keybow.F4)
        keybow.set_modifier(meta_key, keybow.KEY_UP)
    end
end

function handle_key_10(pressed) -- Zoom out
    if pressed then
        keybow.set_modifier(meta_key, keybow.KEY_DOWN)
        keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_DOWN)
        keybow.tap_key("s")
        keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_UP)
        keybow.set_modifier(meta_key, keybow.KEY_UP)
    end
end

function handle_key_11(pressed) -- Mic toggle
    if pressed then
        keybow.set_modifier(meta_key, keybow.KEY_DOWN)
        keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_DOWN)
        keybow.tap_key(keybow.DELETE)
        keybow.set_modifier(keybow.LEFT_SHIFT, keybow.KEY_UP)
        keybow.set_modifier(meta_key, keybow.KEY_UP)
    end
end
