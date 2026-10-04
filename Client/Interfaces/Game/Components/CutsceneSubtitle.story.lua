-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.CutsceneSubtitle.story
-- Decompile time: 2.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CutsceneSubtitle = require(script.Parent.CutsceneSubtitle)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local u21 = {}
local v1 = {
    delay = 1.5,
    text = "Hello, is anyone able to pick up this frequency?",
    speaker = "Dispatcher",
    lifetime = 3.8,
    speakerColor = Color3.fromRGB(0, 174, 255),
}
local v2 = {
    delay = 2.87,
    text = "If you can hear this, the portal didn’t seem to have worked intentionally.",
    speaker = "Dispatcher",
    lifetime = 3.64,
    speakerColor = Color3.fromRGB(0, 174, 255),
}
local v3 = {
    text = "The good news is that the computer appears to have been sucked in with you guys.",
    speaker = "Dispatcher",
    lifetime = 4.1,
    speakerColor = Color3.fromRGB(0, 174, 255),
}
local v4 = {
    delay = 0.1,
    text = "If you can fix it up and find a power source...",
    speaker = "Dispatcher",
    lifetime = 2.6,
    speakerColor = Color3.fromRGB(0, 174, 255),
}
local v5 = {
    text = "you can probably get home.",
    speaker = "Dispatcher",
    lifetime = 1.61,
    speakerColor = Color3.fromRGB(0, 174, 255),
}
local v6 = {
    delay = 0.21,
    text = "Be careful though...",
    speaker = "Dispatcher",
    lifetime = 0.97,
    speakerColor = Color3.fromRGB(0, 174, 255),
}
local v7 = {
    text = "we can’t see what dimension you guys are in and anything could be lurking in there.",
    speaker = "Dispatcher",
    lifetime = 4.576,
    speakerColor = Color3.fromRGB(0, 174, 255),
}
local v8 = {
    delay = 1.342,
    text = "Anything?",
    speaker = "???",
    lifetime = 1.625,
    speakerColor = Color3.fromRGB(255, 47, 47),
}
u21[1] = v1
u21[2] = v2
u21[3] = v3
u21[4] = v4
u21[5] = v5
u21[6] = v6
u21[7] = v7
u21[8] = v8
return function(a1) -- Line: 65
    -- upvalues: createElement (val), React (val), u21 (val), CutsceneSubtitle (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 66 -- upvalues: React (upval), u21 (upval), createElement (upval), CutsceneSubtitle (upval)
        local v1, u4 = React.useState("")
        local v2, u9 = React.useState("")
        local v3, u15 = React.useState(Color3.new())
        local v4, u20 = React.useState(false)
        React.useEffect(function() -- Line: 72 -- upvalues: u21 (upval), u20 (val), u4 (val), u9 (val), u15 (val)
            local u2 = task.spawn(function() -- Line: 73 -- upvalues: u21 (upval), u20 (upval), u4 (upval), u9 (upval), u15 (upval)
                local v1, v2
                while task.wait(1) do
                    v1 = nil
                    v2 = nil
                    for i, j in u21, v1, v2 do
                        if j.delay then
                            task.wait(j.delay)
                        end
                        u20(true)
                        u4(j.text)
                        u9(j.speaker)
                        u15(j.speakerColor)
                        task.wait(j.lifetime)
                        u20(false)
                    end
                    u20(false)
                end
            end)
            return function() -- Line: 93 -- upvalues: u2 (val)
                task.cancel(u2)
            end
        end, {})
        return createElement(CutsceneSubtitle, {
            size = UDim2.fromScale(0.9, 0.5),
            position = UDim2.fromScale(0.5, 0.9),
            anchorPoint = Vector2.new(0.5, 1),
            text = v1,
            speaker = v2,
            speakerColor = v3,
            visible = v4,
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 112 -- upvalues: u7 (val)
        u7:unmount()
    end
end