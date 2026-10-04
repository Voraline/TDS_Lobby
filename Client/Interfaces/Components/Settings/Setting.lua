-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Setting
-- Decompile time: 4.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local ToggleButton = require(ReplicatedStorage.Client.Interfaces.Components.ToggleButton)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
local v1 = {
    __index = function(a1, a2) -- Line: 11
        local v1 = script.Parent.Custom:FindFirstChild(a2)
        local v2 = nil
        if v1 then
            v2 = require(v1)
            rawset(a1, a2, v2)
        end
        return v2
    end,
}
local u33 = setmetatable({}, v1)

local function CreateSetting(a1) -- Line: 24 -- upvalues: createElement (val), ToggleButton (val), u33 (val)
    local v1 = a1.Type or ""
    local UpdateSetting = a1.UpdateSetting
    if not UpdateSetting then
        function UpdateSetting(a1, a2) end
    end
    if v1 == "Switch" then
        local v2 = {
            Enabled = a1.Current,
            Clicked = function() -- Line: 31 -- upvalues: UpdateSetting (val), a1 (val)
                UpdateSetting(a1.Name, not a1.Current)
            end,
        }
        local SwitchProps = a1.SwitchProps or {}
        v2.SwitchProps = SwitchProps
        return createElement(ToggleButton, v2)
    end
    if u33[v1] then
        return createElement(u33[v1], {
            Default = a1.Default,
            Properties = a1.Properties,
            Current = a1.Current,
            Clicked = function(a1_2) -- Line: 41 -- upvalues: UpdateSetting (val), a1 (val)
                UpdateSetting(a1.Name, a1_2)
            end,
        })
    end
    warn("No setting type found for " .. v1)
end

return function(a1) -- Line: 50 -- upvalues: createElement (val), ImageLabel (val), TextLabel (val), CreateSetting (val)
    local v1 = {BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(121, 121, 121)}
    local Size = a1.Size or UDim2.new(1, 0, 0, 80)
    v1.Size = Size
    local Position = a1.Position or UDim2.fromScale(0, 0)
    v1.Position = Position
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0, 0)
    v1.AnchorPoint = AnchorPoint
    v1.LayoutOrder = a1.LayoutOrder
    local v2 = {}
    local v3 = {BackgroundTransparency = 1, ZIndex = 1, Image = "rbxassetid://" .. (a1.Icon or 0)}
    local IconAnchorPoint = a1.IconAnchorPoint or Vector2.new(0, 0.5)
    v3.AnchorPoint = IconAnchorPoint
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    local IconPosition = a1.IconPosition or UDim2.new(0, 6, 0.5, 0)
    v3.Position = IconPosition
    local IconSize = a1.IconSize or UDim2.fromOffset(64, 64)
    v3.Size = IconSize
    v2.imageLabel = createElement(ImageLabel, v3)
    v2.title = createElement(TextLabel, {
        FontWeight = "Bold",
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        ZIndex = 1,
        StrokeThickness = 2,
        StrokeTransparency = 0.5,
        Text = a1.Title,
        TextXAlignment = Enum.TextXAlignment.Left,
        Position = UDim2.fromOffset(80, 12),
        Size = UDim2.new(1, -180, 0, 28),
        AnchorPoint = Vector2.zero,
    })
    v2.description = createElement(TextLabel, {
        FontWeight = "Medium",
        TextTransparency = 0.5,
        TextSize = 18,
        TextWrapped = true,
        ZIndex = 3,
        Text = a1.Description,
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        Position = UDim2.fromOffset(80, 44),
        Size = UDim2.new(1, -180, 0, 24),
        AnchorPoint = Vector2.zero,
    }, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20})})
    v2.uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)})
    v2.button = createElement(CreateSetting, a1.Value or {})
    return createElement("Frame", v1, v2)
end