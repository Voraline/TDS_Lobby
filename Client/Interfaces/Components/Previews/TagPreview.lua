-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.TagPreview
-- Decompile time: 2.33 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local UI = ReplicatedStorage.Shared.UI
local Modules = ReplicatedStorage.Shared.Modules
local React = require(UI.React)
local NewTags = require(Modules.Asset.Handlers.NewTags)
local Fragment = React.Fragment
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local memo = React.memo
local ImageLabel = require(Components.ImageLabel)
local Loader = require(Components.Loader)
local RichText = require(Components.RichText)
local UserId = Players.LocalPlayer.UserId
local u44 = {}
return memo(function(a1) -- Line: 56
    -- upvalues: useState (val), useEffect (val), u44 (val), NewTags (val), createElement (val), RichText (val)
    -- upvalues: ImageLabel (val), UserId (val), Fragment (val), Loader (val)
    local name = a1.name
    local v1, u5 = useState(true)
    local v2, u9 = useState("")
    local v3 = useEffect
    local v4 = {name, a1.text}
    v3(function() -- Line: 62 -- upvalues: u44 (upval), name (val), u5 (val), u9 (val), NewTags (upval), a1 (val)
        local u2 = task.spawn(function() -- Line: 63 -- upvalues: u44 (upval), name (upval), u5 (upval), u9 (upval), NewTags (upval), a1 (upval)
            if not u44[name] then
                u5(true)
                u44[name] = true
            end
            u9("")
            if NewTags(name) then
                local text = a1.text or name
                u9((("<%*>%*</%*>"):format(name:lower(), text, (name:lower()))))
            end
            u5(false)
        end)
        return function() -- Line: 80 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, v4)
    v4 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v4.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 0.5, 0)
    v4.Position = Position
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v4.Size = Size
    v4.ZIndex = a1.ZIndex
    v4.BackgroundColor3 = Color3.new(0, 0, 0)
    v4.GroupTransparency = a1.ImageTransparency
    v4.Visible = a1.Visible
    v4.ClipsDescendants = a1.ClipsDescendants
    local v5 = {}
    local v6 = {}
    local tagSize = a1.tagSize or UDim2.fromScale(0.8, 0.18)
    v6.Size = tagSize
    local tagPosition = a1.tagPosition or UDim2.fromScale(0.5, 0.2)
    v6.Position = tagPosition
    local tagAnchorPoint = a1.tagAnchorPoint or Vector2.new(0.5, 0.5)
    v6.AnchorPoint = tagAnchorPoint
    v6.Playing = a1.playing
    v6.Text = v2
    v5.text = createElement(RichText, v6)
    local v7 = false
    if a1.showPlayer ~= false then
        v7 = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 9999,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.fromScale(1, 0.75),
            ScaleType = Enum.ScaleType.Fit,
            Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(UserId),
        })
    end
    v5.player = v7
    v5.children = createElement(Fragment, nil, a1.children or {})
    v7 = v1 and createElement(Loader, {
        BackgroundTransparency = 1,
        Visible = true,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.2, 0.2),
    }) or nil
    v5.loader = v7
    return createElement("CanvasGroup", v4, v5)
end)