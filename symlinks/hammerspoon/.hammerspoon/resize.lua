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

local mash = { "alt" }

hs.hotkey.bind(mash, "h", resizeLeft)
--hs.hotkey.bind(mash, "t", resizeBottom)
--hs.hotkey.bind(mash, "t", resizeTop)
hs.hotkey.bind(mash, "n",  resizeRight)
hs.hotkey.bind(mash, "c", resizeFull)


local iterm = "com.googlecode.iterm2"
local vscode = "com.microsoft.VSCode"

local dev = {
  { key = "a", bundleID = iterm },
  { key = "d", bundleID = vscode}
}

for i, object in ipairs(dev) do
  hs.hotkey.bind({'alt'}, object.key, function()
    local bundleID = object.bundleID
    local beforeBundleId = hs.window.focusedWindow():application():bundleID();

    hs.application.launchOrFocusByBundleID(bundleID)
    local win = hs.window.focusedWindow()

    local frame = win:frame()
    local max = win:screen():frame()
    local isFull = frame.w == max.w and frame.h == max.h

    local isSame = beforeBundleId == bundleID

    if(isFull and isSame) then
      if(bundleID == iterm) then
        resizeLeft()
      elseif(bundleID == vscode) then
        resizeRight()
      end
    else
      if(isSame) then
        resizeFull()
      end
    end
  end)
end


hs.hotkey.bind({'ctrl'}, "s", function()
  local currentBundleID = hs.window.focusedWindow():application():bundleID()
  if(currentBundleID == iterm) then
    resizeBottom()
    hs.application.launchOrFocusByBundleID(vscode)
    resizeTop()
  elseif(currentBundleID == vscode) then
    resizeTop()
    hs.application.launchOrFocusByBundleID(iterm)
    resizeBottom()
  else
    hs.application.launchOrFocusByBundleID(vscode)
    resizeTop()
    hs.application.launchOrFocusByBundleID(iterm)
    resizeBottom()
  end
end)
