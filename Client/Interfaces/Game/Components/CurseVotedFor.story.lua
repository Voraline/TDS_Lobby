-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.CurseVotedFor.story
-- Decompile time: 0.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurseVotedFor = require(script.Parent.CurseVotedFor)
require(script.Parent.CutsceneSubtitle)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function app() -- Line: 10 -- upvalues: React (val), createElement (val), CurseVotedFor (val)
    local v1, u4 = React.useState(true)
    React.useEffect(function() -- Line: 12 -- upvalues: u4 (val)
        task.spawn(function() -- Line: 13 -- upvalues: u4 (upval)
            wait(2)
            u4(false)
        end)
    end, {})
    return createElement(CurseVotedFor, {
        description = "Towers have -60% range for 3 waves.",
        index = 1,
        modifier = "Vision",
        colors = {Color3.fromRGB(161, 92, 255), (Color3.fromRGB(81, 184, 255))},
        enabled = v1,
    })
end

return function(a1) -- Line: 31 -- upvalues: ReactRoblox (val), createElement (val), app (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(app)))
    return function() -- Line: 35 -- upvalues: u4 (val)
        u4:unmount()
    end
end