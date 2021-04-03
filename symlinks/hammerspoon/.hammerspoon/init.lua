local log = hs.logger.new('hammerspoon','debug')
log.d('here')

m = hs.hotkey.modal.new({}, nil)

local pressed  = function() m:enter() end
local released = function() m:exit() end

local launch = function(app)
  hs.application.launchOrFocus(app)
end

hs.hotkey.bind({}, 'f19', pressed, released)

m:bind({}, '.', function() launch('Visual Studio Code'); end)
m:bind({}, 'i', function() launch('iTerm'); end)
m:bind({}, 'o', function() launch('Mimestream'); end)
m:bind({}, 'e', function() launch('Brave Browser'); end)
m:bind({}, 'a', function() launch('Slack'); end)

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
