local hyper = {'ctrl', 'shift', 'alt', 'cmd'}

local resizeFull = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = 0
  f.y = 0
  f.w = max.w
  f.h = max.h
  win:setFrame(f, 0)
end

local resizeLeft = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = 0
  f.y = 0
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f, 0)
end

local resizeRight = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f, 0)
end

local resizeTop = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = 0
  f.y = 0
  f.w = max.w
  f.h = max.h / 1.5
  win:setFrame(f, 0)
end

local resizeBottom = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = 0
  f.y = (max.h / 1.5) + 25
  f.w = max.w
  f.h = (max.h / 3)
  win:setFrame(f, 0)
end

hs.hotkey.bind(hyper, "h", resizeLeft)
hs.hotkey.bind(hyper, "t", function() hs.eventtap.keyStroke({'cmd'}, '`') end)
hs.hotkey.bind(hyper, "n",  resizeRight)
hs.hotkey.bind(hyper, "c", resizeFull)
