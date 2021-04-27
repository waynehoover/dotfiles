local log = hs.logger.new('hammerspoon','debug')
hs.window.animationDuration = 0
-- log.d('here')

require('resize')

local empty = [[ASCII:
..........
..........
..........
..........
..........
..........
..........
..........
..........
..........
]]

local circle = [[ASCII:
....11....
....22....
....33....
....44....
1234554321
1234554321
....44....
....33....
....22....
....11....
]]

local menu = hs.menubar.new()

m = hs.hotkey.modal.new({}, nil)

local pressed  = function() m:enter() end
local released = function() m:exit() end

local launch = function(app)
  hs.application.launchOrFocus(app)
end

hs.hotkey.bind({}, 'f19', pressed, released)

m:bind({}, 'c', function() launch('Visual Studio Code') end)
m:bind({}, 't', function() launch('iTerm') end)
m:bind({}, 'h', function() launch('Mimestream') end)
m:bind({}, 'n', function() launch('Brave Browser') end)
m:bind({}, 's', function() launch('Slack') end)
m:bind({}, 'e', function() m:exit() end)
m:bind({}, 'escape', function() m:exit() end)
m:bind({}, 'fn', function() m:exit() end)

function m:entered() menu:setTitle("⚫") end
function m:exited()  menu:setTitle("")  end

-- If in vscode send delete line key code, otherwise send below.
-- SEND_STRING(SS_LCTRL("d")SS_LSFT(SS_LCTRL("a")SS_TAP(X_LEFT))SS_TAP(X_BSPC));
hs.hotkey.bind({'alt'}, 's', function()
  local front = hs.application.frontmostApplication()
  if front and front:name() == "Code" then
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.shift, true):post()
    hs.eventtap.event.newKeyEvent('k', true):post()
    hs.eventtap.event.newKeyEvent('k', false):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.shift, false):post()
  elseif front and front:name() == "iTerm2" then
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
    hs.eventtap.event.newKeyEvent('a', true):post()
    hs.eventtap.event.newKeyEvent('a', false):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, true):post()
    hs.eventtap.event.newKeyEvent('k', true):post()
    hs.eventtap.event.newKeyEvent('k', false):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.ctrl, false):post()
  else
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, true):post()
    hs.eventtap.event.newKeyEvent('Right', true):post()
    hs.eventtap.event.newKeyEvent('Right', false):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.shift, true):post()
    hs.eventtap.event.newKeyEvent('Left', true):post()
    hs.eventtap.event.newKeyEvent('Left', false):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.cmd, false):post()
    hs.eventtap.event.newKeyEvent('Left', true):post()
    hs.eventtap.event.newKeyEvent('Left', false):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.shift, false):post()

    hs.eventtap.event.newKeyEvent(hs.keycodes.map.delete, true):post()
    hs.eventtap.event.newKeyEvent(hs.keycodes.map.delete, false):post()
  end
end)


function changeVolume(diff)
  return function()
    local current = hs.audiodevice.defaultOutputDevice():volume()
    local new = math.min(100, math.max(0, math.floor(current + diff)))
    if new > 0 then
      hs.audiodevice.defaultOutputDevice():setMuted(false)
    end
    hs.alert.closeAll(0.0)
    hs.alert.show("Volume " .. new .. "%", {}, 0.5)
    hs.audiodevice.defaultOutputDevice():setVolume(new)
  end
end

hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'Down', changeVolume(-3))
hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'Up', changeVolume(3))


function changeBrightness(diff)
  return function()
    local current = hs.brightness.get()
    local new = math.min(100, math.max(0, math.floor(current + diff)))
    hs.brightness.set(new)
  end
end

hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'Left', changeBrightness(-3), nil, changeBrightness(-3))
hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'Right', changeBrightness(3), nil, changeBrightness(3))
