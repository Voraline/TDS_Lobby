-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Watermark.story
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Watermark = require(script.Parent.Watermark)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
return function(a1) -- Line: 10 -- upvalues: ReactRoblox (val), createElement (val), Watermark (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render(createElement(Watermark, {Text = "OnlyTwentyCharacters (123456789)"}), a1)
    return function() -- Line: 20 -- upvalues: u4 (val)
        u4:unmount()
    end
end