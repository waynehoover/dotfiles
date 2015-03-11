local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local grid = require "mjolnir.bg.grid"

-- Functions
local gridset = function(cords)
  return function()
    cur_window = window.focusedwindow()
    grid.set(
      cur_window,
      cords,
      cur_window:screen()
    )
    if cords.x ~= 0 or cords.w == 6 then
    -- fix for dock
      local f = cur_window:frame()
      f.x = f.x - 4
      cur_window:setframe(f)
      f.w = f.w + 4
      f.x = f.x + 4
      cur_window:setframe(f)
    end
  end
end

-- Config

-- Set grid size.
grid.GRIDWIDTH  = 6
grid.GRIDHEIGHT = 8
grid.MARGINX = 0
grid.MARGINY = 0
local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT
local gomiddle = {x = 1, y = 1, w = 4, h = 6}
local goleft = {x = 0, y = 0, w = gw/2, h = gh}
local goright = {x = gw/2, y = 0, w = gw/2, h = gh}
local gobig = {x = 0, y = 0, w = gw, h = gh}

local mash = {"ctrl", "cmd"}
hotkey.bind(mash, 'left', gridset(goleft)) -- left half
hotkey.bind(mash, 'space', gridset(gobig))
hotkey.bind(mash, 'right', gridset(goright)) -- right half