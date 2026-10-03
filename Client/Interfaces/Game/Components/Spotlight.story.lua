-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Spotlight.story
-- Decompile time: 1.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Spotlight = require(script.Parent.Spotlight)
local createElement = React.createElement
local useEffect = React.useEffect

local function render(a1) -- Line: 9 -- upvalues: React (val), useEffect (val), createElement (val), Spotlight (val)
    local u4, u5 = React.useState(false)
    local v1 = React.useRef(nil)
    useEffect(function() -- Line: 13 -- upvalues: u5 (val), u4 (val)
        local u0 = true
        task.spawn(function() -- Line: 16 -- upvalues: u0 (ref), u5 (upval), u4 (upval)
            while u0 do
                task.wait(3)
                u5(not u4)
            end
        end)
        return function() -- Line: 24 -- upvalues: u0 (ref)
            u0 = false
        end
    end, {})
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0)}, {
        highlightedElement = createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.new(0.1, 0, 0.1, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 0, 0),
            ref = v1,
        }),
        spotlight = createElement(Spotlight, {rootRef = v1, visible = u4}),
    })
end

return function(a1) -- Line: 47 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render)))
    return function() -- Line: 51 -- upvalues: u4 (val)
        u4:unmount()
    end
end