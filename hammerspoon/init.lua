-- Functions
local gridset = function(cords)
  return function()
    cur_window = hs.window.focusedWindow()
    hs.grid.set(
      cur_window,
      cords,
      cur_window:screen()
    )
    if cords.x ~= 0 or cords.w == 6 then
    -- fix for dock
      local f = cur_window:frame()
      f.x = f.x - 4
      cur_window:setFrame(f)
      f.w = f.w + 4
      f.x = f.x + 4
      cur_window:setFrame(f)
    end
  end
end

-- Config
hs.window.animationDuration = 0

-- Set grid size.  yy
hs.grid.GRIDWIDTH  = 6
hs.grid.GRIDHEIGHT = 8
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
local gw = hs.grid.GRIDWIDTH
local gh = hs.grid.GRIDHEIGHT
local gomiddle = {x = 1, y = 1, w = 4, h = 6}
local goleft = {x = 0, y = 0, w = gw/2, h = gh}
local goright = {x = gw/2, y = 0, w = gw/2, h = gh}
local gobig = {x = 0, y = 0, w = gw, h = gh}

local mash = {"ctrl", "cmd"}
hs.hotkey.bind(mash, 'left', gridset(goleft)) -- left half
hs.hotkey.bind(mash, 'space', gridset(gobig))
hs.hotkey.bind(mash, 'right', gridset(goright)) -- right half
