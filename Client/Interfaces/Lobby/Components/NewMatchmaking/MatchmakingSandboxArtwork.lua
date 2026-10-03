-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingSandboxArtwork
-- Decompile time: 1.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local createElement = React.createElement
local memo = React.memo
local useState = React.useState
local u42 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 203, 251)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 81, 160))),
})
return memo(function(a1) -- Line: 26
    -- upvalues: useState (val), createElement (val), React (val), u42 (val), ImageLabel (val)
    local v1, u4 = useState(Enum.DominantAxis.Width)
    local v2, u11 = useState(UDim2.fromScale(1, 1))
    local imageOffset = a1.imageOffset or UDim2.fromScale(0, 0)
    local v3 = math.max(a1.imageScale or 1, 0)
    local v4 = createElement
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
    }
    local v6 = {}
    local v7 = createElement
    local v8 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(8, 203, 251),
        BorderSizePixel = 0,
        Position = a1.artworkOffset:map(function(a1) -- Line: 42
            return (UDim2.fromScale(0.5, 0.5)) + UDim2.fromOffset(a1.X * 0.35, a1.Y * 0.35)
        end),
        Size = UDim2.fromScale(1.08, 1.08),
        ZIndex = 1,
    }

    v8[React.Change.AbsoluteSize] = function(a1) -- Line: 51 -- upvalues: u4 (val), u11 (val)
        local AbsoluteSize = a1.AbsoluteSize
        local v1 = math.max(AbsoluteSize.X, AbsoluteSize.Y)
        u4(if not (AbsoluteSize.Y <= AbsoluteSize.X) then Enum.DominantAxis.Height else Enum.DominantAxis.Width)
        u11(UDim2.fromOffset(v1, v1))
    end

    v6.Background = v7("Frame", v8, {
        Gradient = createElement("UIGradient", {Rotation = -120, Color = u42}),
        GridTexture = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = 80830170555292,
            ZIndex = 1,
            disableSpinner = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Tile,
            Size = v2,
            TileSize = UDim2.fromScale(0.3, 0.3),
        }, {
            AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1, DominantAxis = v1}),
        }),
    })
    v6.Foreground = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        ZIndex = 2,
        disableSpinner = true,
        AnchorPoint = Vector2.new(0.5, 0.4),
        Image = a1.foregroundImage,
        Position = UDim2.fromScale(0.5, 0.5) + imageOffset,
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromScale(v3 * 2, v3 * 2),
    })
    return v4("Frame", v5, v6)
end)