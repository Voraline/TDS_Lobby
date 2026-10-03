-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.TagPreview.story
-- Decompile time: 0.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local TagPreview = require(script.Parent.TagPreview)
local Event = React.Event
local createElement = React.createElement
local useState = React.useState
return function(a1) -- Line: 12
    -- upvalues: createElement (val), useState (val), Event (val), TagPreview (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 13 -- upvalues: useState (upval), createElement (upval), Event (upval), TagPreview (upval)
        local v1, u3 = useState(false)
        local v2 = createElement
        local v3 = {
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(600, 600),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 0.5,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        }

        v3[Event.MouseEnter] = function() -- Line: 23 -- upvalues: u3 (val)
            u3(true)
        end

        v3[Event.MouseLeave] = function() -- Line: 27 -- upvalues: u3 (val)
            u3(false)
        end

        return v2("Frame", v3, {
            uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)}),
            tag = createElement(TagPreview, {name = "Rainbow", Size = UDim2.fromScale(1, 1), playing = v1}),
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 47 -- upvalues: u7 (val)
        u7:unmount()
    end
end