-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.VoteWave.story
-- Decompile time: 0.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local VoteWave = require(script.Parent.VoteWave)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), VoteWave (val), ReactRoblox (val)
    local v1 = createElement(VoteWave, {
        Title = "Skip Cutscene?",
        YesVotes = 1,
        NoVotes = 2,
        TotalVotes = 4,
        Timer = 1,
    })
    local u8 = ReactRoblox.createRoot(a1)
    u8:render(v1)
    return function() -- Line: 22 -- upvalues: u8 (val)
        u8:unmount()
    end
end