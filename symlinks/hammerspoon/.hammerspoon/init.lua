local log = hs.logger.new('hammerspoon','debug')
local am = require('app-management')
local hyper = {'ctrl', 'shift', 'alt', 'cmd'}
hs.window.animationDuration = 0
require('resize')
local menu = hs.menubar.new()

m = hs.hotkey.modal.new({}, nil)

local pressed  = function() m:enter() end
local released = function() m:exit() end

local launch = function(app)
  hs.application.launchOrFocus(app)
end

hs.hotkey.bind({}, 'f19', pressed, released)

m:bind({}, 'h', function() am.switchToAndFromApp('com.microsoft.VSCode') end)
m:bind({}, 't', function() am.switchToAndFromApp('com.brave.Browser') end)
m:bind({}, 'n', function() am.switchToAndFromApp('com.googlecode.iterm2') end)
m:bind({}, 's', function() am.switchToAndFromApp('com.tinyspeck.slackmacgap') end)
m:bind({}, 'w', function() am.switchToAndFromApp('com.mimestream.Mimestream') end)

-- show the bundleid of the currently open window
m:bind({}, 'b', function()
  local bundleId = hs.window.focusedWindow():application():bundleID()
  hs.alert.show(bundleId)
  hs.pasteboard.setContents(bundleId)
end)

m:bind({}, 'escape', function() m:exit() end)
m:bind({}, 'fn', function() m:exit() end)

function m:entered() menu:setTitle("⚫") end
function m:exited()  menu:setTitle("") end

hs.hotkey.bind(hyper, "i", function() am.switchToAndFromApp('com.microsoft.VSCode') end)
hs.hotkey.bind(hyper, "e", function() am.switchToAndFromApp('com.brave.Browser') end)
hs.hotkey.bind(hyper, "o", function() am.switchToAndFromApp('com.googlecode.iterm2') end)
hs.hotkey.bind(hyper, "a", function() am.switchToAndFromApp('com.tinyspeck.slackmacgap') end)
hs.hotkey.bind(hyper, "k", function() am.switchToAndFromApp('com.mimestream.Mimestream') end)

-- hs.hints.style = 'vimperator'
-- hs.hints.showTitleTesh = 0
hs.hints.hintChars = {"A","O","E","I","H","T","N","S","C","."}
hs.hints.fontName = "MonoLisa"
hs.hotkey.bind(hyper, ".", function() hs.hints.windowHints(hs.window.focusedWindow():application():allWindows()) end)
hs.hotkey.bind(hyper, 'x', hs.reload)

-- If in vscode send delete line key code, otherwise send below.
-- SEND_STRING(SS_LCTRL("d")SS_LSFT(SS_LCTRL("a")SS_TAP(X_LEFT))SS_TAP(X_BSPC));
local del_line = function()
  local front = hs.application.frontmostApplication()
  if front and front:bundleID() == 'com.microsoft.VSCode' then
    hs.eventtap.keyStroke({'ctrl', 'shift'}, 'k')
  elseif front and front:bundleID() == 'com.googlecode.iterm2' then
    -- faster than calling keyStroke twice
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

    hs.eventtap.keyStroke(nil, 'delete')
  end
end

hs.hotkey.bind(nil, 'f19', del_line)
hs.hotkey.bind({'alt'}, 's', del_line)
hs.hotkey.bind({'alt'}, 'w', function() hs.eventtap.keyStroke({'option'}, 'delete') end)
