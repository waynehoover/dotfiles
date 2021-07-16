require('resize')
local del_line = require('del-line')

local log = hs.logger.new('hammerspoon','debug')
local am = require('app-management')
local hyper = {'ctrl', 'shift', 'alt', 'cmd'}
hs.window.animationDuration = 0

hs.hotkey.bind(hyper, "i", function() am.switchToAndFromApp('com.microsoft.VSCode') end)
hs.hotkey.bind(hyper, "e", function() am.switchToAndFromApp('com.brave.Browser') end)
hs.hotkey.bind(hyper, "o", function() am.switchToAndFromApp('com.googlecode.iterm2') end)
hs.hotkey.bind(hyper, "a", function() am.switchToAndFromApp('com.tinyspeck.slackmacgap') end)
hs.hotkey.bind(hyper, "k", function() am.switchToAndFromApp('com.mimestream.Mimestream') end)
hs.hotkey.bind(hyper, "j", function() am.switchToAndFromApp('md.obsidian') end)

hs.hotkey.bind(hyper, 'x', hs.reload)

hs.hotkey.bind({'alt'}, 's', del_line)
hs.hotkey.bind({'alt'}, 'w', function() hs.eventtap.keyStroke({'option'}, 'delete') end)

-- working half step up sound
-- could possibly remove BTT and use this instead
-- hs.hotkey.bind({'alt'}, 'p', function()
--   hs.eventtap.event.newSystemKeyEvent('SOUND_UP', true):setFlags({["alt"]=true, ["shift"]=true}):post()
--   hs.eventtap.event.newSystemKeyEvent('SOUND_UP', false):setFlags({["alt"]=true, ["shift"]=true}):post()
-- end)
