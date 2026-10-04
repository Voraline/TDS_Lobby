-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.HudCurrency.story
-- Decompile time: 5.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local HudCurrency = require(script.Parent.HudCurrency)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useScale = require(Hooks.useScale)
local Fragment = React.Fragment
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState

local function Frame(a1) -- Line: 16 -- upvalues: useScale (val), createElement (val), Fragment (val)
    local v1 = useScale(1, nil, nil, true)
    print(v1)
    local v2 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
    }
    local Position = a1.Position or UDim2.new(0.5 * v1, 0, 0.5, 0)
    v2.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.093 * v1, 0.2 * v1)
    v2.Size = Size
    return createElement("Frame", v2, {
        uIListLayout = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        content = createElement(Fragment, nil, a1.children or {}),
    })
end

return function(a1) -- Line: 39
    -- upvalues: createElement (val), useState (val), useEffect (val), Frame (val), HudCurrency (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 40
        -- upvalues: useState (upval), useEffect (upval), createElement (upval), Frame (upval), HudCurrency (upval)
        local u2, u3 = useState(99999999999)
        local u6, u7 = useState(99999999999)
        local v1 = {u6}
        useEffect(function() -- Line: 44 -- upvalues: u7 (val), u6 (val)
            task.spawn(function() -- Line: 45 -- upvalues: u7 (upval), u6 (upval)
                task.wait(math.random(0, 1))
                u7(u6 + math.floor((math.random(10, 50000))))
            end)
        end, v1)
        v1 = {u2}
        useEffect(function() -- Line: 51 -- upvalues: u3 (val), u2 (val)
            task.spawn(function() -- Line: 52 -- upvalues: u3 (upval), u2 (upval)
                task.wait(math.random(0, 1))
                u3(u2 + math.floor((math.random(10, 50000))))
            end)
        end, v1)
        return createElement(Frame, {}, {
            coins = createElement(HudCurrency, {
                LayoutOrder = 0,
                name = "Coins",
                icon = 6794338720,
                currency = u2,
                textColor = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(254, 243, 23)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(216, 101, 0))),
                }),
                textStrokeColor = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 21, 0)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(83, 69, 18))),
                }),
            }),
            gems = createElement(HudCurrency, {
                LayoutOrder = 1,
                name = "Gems",
                icon = 6794338899,
                currency = u6,
                textColor = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(244, 201, 246)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 100, 234))),
                }),
                textStrokeColor = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(107, 36, 94)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(102, 38, 99))),
                }),
            }),
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 100 -- upvalues: u7 (val)
        u7:unmount()
    end
end