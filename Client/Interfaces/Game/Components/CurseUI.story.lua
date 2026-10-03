-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.CurseUI.story
-- Decompile time: 1.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurseUI = require(script.Parent.CurseUI)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useEffect = React.useEffect

local function render() -- Line: 10 -- upvalues: React (val), useEffect (val), createElement (val), CurseUI (val)
    local v1, u4 = React.useState("")
    local v2, u9 = React.useState(false)
    local v3, u14 = React.useState("")
    useEffect(function() -- Line: 15 -- upvalues: u9 (val)
        local u3 = task.delay(1, function() -- Line: 16 -- upvalues: u9 (upval)
            u9(true)
        end)
        return function() -- Line: 20 -- upvalues: u3 (val)
            task.cancel(u3)
        end
    end, {})
    return createElement(CurseUI, {
        cards = {
            {
                data = {
                    icon = "rbxassetid://70426824265683",
                    title = "The Sun",
                    modifiers = {"All enemies have 50% more health.", "All enemies have 25% more speed."},
                    votedFor = {49601674},
                },
            },
            {
                data = {
                    icon = "rbxassetid://70426824265683",
                    title = "The Moon",
                    modifiers = {"All enemies have 50% more health.", "All enemies have 25% more speed."},
                    votedFor = {},
                },
            },
            {
                data = {
                    icon = "rbxassetid://70426824265683",
                    title = "The Stars",
                    modifiers = {"All enemies have 50% more health.", "All enemies have 25% more speed."},
                    votedFor = {},
                },
            },
        },
        selected = v1,
        clickedOn = v3,
        enabled = v2,
        onHover = function(a1) -- Line: 64 -- upvalues: u4 (val) -- types: a1: string
            u4(a1)
        end,
        onUnhover = function() -- Line: 67 -- upvalues: u4 (val)
            u4("")
        end,
        selectCurse = function(a1) -- Line: 70 -- upvalues: u14 (val) -- types: a1: string
            u14(a1)
        end,
    })
end

return function(a1) -- Line: 77 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render)))
    return function() -- Line: 81 -- upvalues: u4 (val)
        u4:unmount()
    end
end