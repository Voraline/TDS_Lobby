-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.StickerPreview
-- Decompile time: 1.72 ms

game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local UI = ReplicatedStorage.Shared.UI
local Modules = ReplicatedStorage.Shared.Modules
local React = require(UI.React)
local Stickers = require(Modules.Asset.Handlers.Stickers)
local Fragment = React.Fragment
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local memo = React.memo
local ImageLabel = require(Components.ImageLabel)
local u41 = {}
return memo(function(a1) -- Line: 33
    -- upvalues: useState (val), useEffect (val), u41 (val), Stickers (val), createElement (val), ImageLabel (val)
    -- upvalues: Fragment (val)
    local name = a1.name
    local v1, u5 = useState(true)
    local v2, u9 = useState(nil)
    local v3 = {name}
    useEffect(function() -- Line: 39 -- upvalues: u41 (upval), name (val), u5 (val), Stickers (upval), u9 (val)
        local u2 = task.spawn(function() -- Line: 40 -- upvalues: u41 (upval), name (upval), u5 (upval), Stickers (upval), u9 (upval)
            if not u41[name] then
                u5(true)
                u41[name] = true
            end
            local v1 = Stickers(name)
            local Icon_3 = if typeof(v1.Icon) ~= "number" then v1.Icon else ("rbxassetid://%*"):format(v1.Icon)
            u9(Icon_3)
            u5(false)
        end)
        return function() -- Line: 55 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, v3)
    v3 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v3.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 0.5, 0)
    v3.Position = Position
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v3.Size = Size
    v3.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    v3.Visible = a1.Visible
    v3.Image = v2 or ""
    local ImageColor3 = a1.ImageColor3 or Color3.fromRGB(255, 255, 255)
    v3.ImageColor3 = ImageColor3
    v3.ImageTransparency = a1.ImageTransparency or 0
    v3.ClipsDescendants = a1.ClipsDescendants
    v3.imageLoading = v1 or v2 == nil
    v3.ZIndex = a1.ZIndex
    local ScaleType = a1.ScaleType or Enum.ScaleType.Fit
    v3.ScaleType = ScaleType
    return createElement(ImageLabel, v3, {children = createElement(Fragment, nil, a1.children or {})})
end)