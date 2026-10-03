-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.MobileButton
-- Decompile time: 1.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local ImageLabel = require(Components.ImageLabel)
local useSound = require(Hooks.useSound)
local memo = React.memo
local Event = React.Event
local useState = React.useState
local createElement = React.createElement
return memo(function(a1) -- Line: 34
    -- upvalues: useState (val), useSound (val), createElement (val), Event (val), ImageLabel (val)
    local v1, u4 = useState(false)
    local Click = useSound("Click")
    local v2 = {LayoutOrder = a1.LayoutOrder, AnchorPoint = a1.AnchorPoint}
    v2.Visible = a1.Visible ~= false
    local Position = a1.Position or UDim2.new(1, -170, 1, -210)
    v2.Position = Position
    local Size = a1.Size or UDim2.fromOffset(100, 100)
    v2.Size = Size
    v2.Image = ("rbxassetid://%*"):format(if not v1 then 115147425306157 else 80809386446021)
    v2.ImageTransparency = 0.25
    v2.BackgroundTransparency = 1

    v2[Event.MouseEnter] = function() -- Line: 48 -- upvalues: u4 (val)
        u4(true)
    end

    v2[Event.MouseLeave] = function() -- Line: 52 -- upvalues: u4 (val)
        u4(false)
    end

    v2[Event.MouseButton1Click] = function() -- Line: 56 -- upvalues: Click (val), a1 (val)
        Click()
        if a1.click then
            a1.click()
        end
    end

    local v3 = {}
    local v4 = {
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Size = UDim2.fromScale(1, 1),
    }
    local ImageColor3 = a1.ImageColor3 or Color3.fromRGB(255, 255, 255)
    v4.ImageColor3 = ImageColor3
    local Image_3 = typeof(a1.Image) == "number" and ("rbxassetid://%*"):format(a1.Image) or a1.Image
    v4.Image = Image_3
    v3.image = createElement(ImageLabel, v4)
    return createElement("ImageButton", v2, v3)
end)