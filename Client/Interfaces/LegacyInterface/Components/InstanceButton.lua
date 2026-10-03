-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.InstanceButton
-- Decompile time: 5.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local SpotLight = require(script.Parent.SpotLight)

local function darken(a1, a2) -- Line: 37 -- types: a1: userdata, a2: number
    return a1:Lerp(Color3.new(), a2)
end

local function tween(a1, a2) -- Line: 41 -- upvalues: TweenService (val) -- types: a1: userdata, a2: table
    TweenService:Create(a1, TweenInfo.new(0.1, Enum.EasingStyle.Linear), a2):Play()
end

return function(a1) -- Line: 45
    -- upvalues: TweenService (val), RunService (val), Sound (val), SpotLight (val)
    local Frame = Instance.new("Frame")
    local Position = a1.Position or UDim2.new(0, 0, 1, 40)
    Frame.Position = Position
    local Size = a1.Size or UDim2.fromOffset(200, 60)
    Frame.Size = Size
    local SizeConstraint = a1.SizeConstraint or Enum.SizeConstraint.RelativeXY
    Frame.SizeConstraint = SizeConstraint
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    Frame.AnchorPoint = AnchorPoint
    Frame.BackgroundTransparency = 1
    Frame.Visible = if a1.Visible ~= nil then a1.Visible else true
    Frame.LayoutOrder = a1.LayoutOrder or 0
    if a1.ZIndex then
        Frame.ZIndex = a1.ZIndex
    end
    local v1 = a1.Transparency or 0
    local Color = a1.Color
    if not Color then
        Color = Color3.fromRGB(150, 150, 150)
    end
    local v2 = false
    if a1.Text ~= nil then
        v2 = a1.Text ~= ""
    end
    local Animate = if a1.Animate ~= nil then a1.Animate else true
    local Active = if a1.Active ~= nil then a1.Active else true
    local u69 = false
    local u70 = false
    local ImageButton = Instance.new("ImageButton")
    ImageButton.Name = "Button"
    ImageButton.Position = UDim2.fromScale(0.5, 0.5)
    ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
    ImageButton.Size = UDim2.fromScale(1, 1)
    ImageButton.Selectable = true
    ImageButton.Active = Active
    ImageButton.AutoButtonColor = false
    ImageButton.BorderSizePixel = 0
    ImageButton.BackgroundTransparency = if not v2 then v1 else 1
    ImageButton.BackgroundColor3 = Color
    ImageButton.Image = "rbxassetid://8429088937"
    ImageButton.ImageColor3 = Color
    ImageButton.ImageTransparency = if not v2 then 1 else v1
    ImageButton.ScaleType = Enum.ScaleType.Slice
    ImageButton.SliceCenter = Rect.new(8, 8, 152, 32)
    ImageButton.Parent = Frame
    if a1.ZIndex then
        ImageButton.ZIndex = a1.ZIndex
    end
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout.Parent = ImageButton
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "Value"
    TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel.Position = UDim2.fromScale(0.625, 0.5)
    TextLabel.Size = UDim2.new(0, 0, 0.5, 0)
    TextLabel.AutomaticSize = Enum.AutomaticSize.X
    TextLabel.BackgroundTransparency = 1
    TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    TextLabel.LayoutOrder = 3
    TextLabel.RichText = a1.RichText == true
    TextLabel.Text = a1.Text or ""
    local TextColor = a1.TextColor or Color3.new(1, 1, 1)
    TextLabel.TextColor3 = TextColor
    TextLabel.TextScaled = true
    TextLabel.TextTransparency = v1
    TextLabel.TextXAlignment = Enum.TextXAlignment.Center
    TextLabel.TextYAlignment = Enum.TextYAlignment.Center
    TextLabel.Visible = v2
    TextLabel.Parent = ImageButton
    if a1.ZIndex then
        TextLabel.ZIndex = a1.ZIndex
    end
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Name = "UIStroke"
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    local TextStrokeColor = a1.TextStrokeColor or Color3.new()
    UIStroke.Color = TextStrokeColor
    UIStroke.LineJoinMode = Enum.LineJoinMode.Miter
    UIStroke.Thickness = 2
    UIStroke.Transparency = a1.TextStrokeTransparency or v1
    UIStroke.Parent = TextLabel
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "Icon"
    ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    ImageLabel.Position = UDim2.fromScale(if not v2 then 0.5 else 0.25, 0.5)
    ImageLabel.Size = UDim2.fromScale(0.7, 0.7)
    ImageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Image = a1.Icon or "rbxassetid://8437655886"
    ImageLabel.ImageTransparency = v1
    ImageLabel.LayoutOrder = 2
    local v3 = false
    if a1.Icon ~= nil then
        v3 = a1.Icon ~= ""
    end
    ImageLabel.Visible = v3
    ImageLabel.Parent = ImageButton
    if a1.ZIndex then
        ImageLabel.ZIndex = a1.ZIndex
    end
    local u269 = nil
    if a1.NoScale ~= true then
        u269 = Instance.new("UIScale")
        u269.Parent = ImageButton
    end

    local function setScale(a1) -- Line: 155
        -- upvalues: u269 (ref), Animate (val), TweenService (upval)
        if u269 and Animate then
            TweenService:Create(u269, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Scale = a1}):Play()
        end
    end

    local function updateVisuals() -- Line: 163
        -- upvalues: u69 (ref), Active (ref), Color (val), ImageButton (val), TweenService (upval), u70 (ref)
        -- upvalues: u269 (ref), Animate (val)
        local v1 = if not u69 or not Active then Color else Color:Lerp(Color3.new(), 0.4)
        TweenService:Create(ImageButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {BackgroundColor3 = v1, ImageColor3 = v1}):Play()
        if not Active then
            if u269 and Animate then
                TweenService:Create(u269, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Scale = 1}):Play()
            end
            return
        end
        if u70 then
            if u269 and Animate then
                TweenService:Create(u269, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Scale = 0.9}):Play()
                return
            end
            return
        end
        if u69 then
            if u269 and Animate then
                TweenService:Create(u269, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Scale = 1.1}):Play()
                return
            end
            return
        end
        if u269 and Animate then
            TweenService:Create(u269, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Scale = 1}):Play()
            return
        end
    end

    local u331 = {}
    table.insert(u331, (ImageButton.MouseButton1Down:Connect(function() -- Line: 187 -- upvalues: u70 (ref), updateVisuals (val)
        u70 = true
        updateVisuals()
    end)))
    table.insert(u331, (ImageButton.MouseButton1Up:Connect(function() -- Line: 195
        -- upvalues: RunService (upval), a1 (val), Sound (upval), Animate (val), u70 (ref), updateVisuals (val)
        if RunService:IsRunning() then
            local ClickSound = if a1.ClickSound ~= nil then a1.ClickSound else "Click"
            if ClickSound ~= "" then
                Sound(ClickSound):Play()
            end
        end
        if Animate then
            if not u70 then
                return
            end
            u70 = false
        end
        updateVisuals()
        if a1.Clicked then
            a1.Clicked()
        end
    end)))
    table.insert(u331, (ImageButton.MouseEnter:Connect(function() -- Line: 222 -- upvalues: u69 (ref), updateVisuals (val), a1 (val)
        u69 = true
        updateVisuals()
        if a1.MouseEnter then
            a1.MouseEnter()
        end
    end)))
    table.insert(u331, (ImageButton.MouseLeave:Connect(function() -- Line: 234 -- upvalues: u69 (ref), u70 (ref), updateVisuals (val), a1 (val)
        u69 = false
        u70 = false
        updateVisuals()
        if a1.MouseLeave then
            a1.MouseLeave()
        end
    end)))
    table.insert(u331, ((ImageButton:GetPropertyChangedSignal("Active")):Connect(function() -- Line: 247 -- upvalues: Active (ref), ImageButton (val), updateVisuals (val)
        Active = ImageButton.Active
        updateVisuals()
    end)))
    Frame.Destroying:Once(function() -- Line: 253 -- upvalues: u331 (val)
        for i, j in u331 do
            j:Disconnect()
        end
    end)
    if a1.SpotLight then
        local v4 = SpotLight
        local v5 = {Name = a1.SpotLight, Target = ImageButton}
        v4(v5).Parent = Frame
    end
    return Frame
end