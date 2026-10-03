-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.HudPartyMember.story
-- Decompile time: 1.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HudPartyMember = require(script.Parent.HudPartyMember)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 12
    -- upvalues: createElement (val), useState (val), useCallback (val), HudPartyMember (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 13 -- upvalues: useState (upval), useCallback (upval), createElement (upval), HudPartyMember (upval)
        local v1, u3 = useState(true)
        local v2 = useCallback(function() -- Line: 16 -- upvalues: u3 (val)
            u3(false)
            task.wait(2)
            u3(true)
        end, {})
        return createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(0, 50),
            Position = UDim2.fromOffset(20, 20),
            AutomaticSize = Enum.AutomaticSize.Y,
        }, {
            listLayout = createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 10),
            }),
            tyler = createElement(HudPartyMember, {
                glow = true,
                icon = "rbxthumb://type=AvatarHeadShot&id=11643&w=180&h=180",
                LayoutOrder = 1,
                Visible = v1,
                clicked = v2,
                Size = UDim2.fromOffset(50, 50),
            }),
            mewious = createElement(HudPartyMember, {
                icon = "rbxthumb://type=AvatarHeadShot&id=49601674&w=180&h=180",
                LayoutOrder = 2,
                Visible = v1,
                clicked = v2,
                Size = UDim2.fromOffset(50, 50),
                strokeColor = Color3.fromRGB(255, 255, 255),
            }),
            add = createElement(HudPartyMember, {
                icon = 16885338903,
                LayoutOrder = 3,
                Visible = v1,
                Size = UDim2.fromOffset(50, 50),
                clicked = v2,
                iconSize = UDim2.fromScale(0.5, 0.5),
                strokeColor = Color3.fromRGB(255, 255, 255),
            }),
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 68 -- upvalues: u7 (val)
        u7:unmount()
    end
end