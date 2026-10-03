-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Nametag.Flair.story
-- Decompile time: 1.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Flair = require(script.Parent.Flair)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Story() -- Line: 9 -- upvalues: createElement (val), Flair (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(540, 180),
    }, {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 18),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        Default = createElement(
            "Frame",
            {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.fromOffset(360, 44)},
            {Flair = createElement(Flair, {name = "Default", visible = true})}
        ),
        Styled = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.fromOffset(360, 44)}, {
            Flair = createElement(Flair, {
                icon = "rbxassetid://6031071057",
                name = "Champion",
                visible = true,
                style = {
                    colorRotation = 45,
                    strokeWidth = 2,
                    color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 219, 89)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 96, 72))),
                    }),
                    strokeColor = ColorSequence.new(Color3.fromRGB(0, 0, 0)),
                    strokeColorTransparency = NumberSequence.new(0.35),
                },
            }),
        }),
        Hidden = createElement(
            "Frame",
            {BackgroundTransparency = 1, LayoutOrder = 3, Size = UDim2.fromOffset(360, 44)},
            {Flair = createElement(Flair, {name = "Hidden", visible = false})}
        ),
    })
end

return function(a1) -- Line: 70 -- upvalues: ReactRoblox (val), createElement (val), Story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Story)))
    return function() -- Line: 74 -- upvalues: u4 (val)
        u4:unmount()
    end
end