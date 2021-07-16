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

return del_line
