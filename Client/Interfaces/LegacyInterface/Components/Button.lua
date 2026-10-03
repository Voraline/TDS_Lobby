-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.Button
-- Decompile time: 5.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UI = ReplicatedStorage.Shared.UI
local Fusion = require(UI.Fusion)
local Scale = require(UI.Components.Scale)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Elements = require(script.Parent.Elements)
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local OnChange = Fusion.OnChange
local Computed = Fusion.Computed
local Tween = Fusion.Tween
local Value = Fusion.Value
local New = Fusion.New
local Spring = Fusion.Spring
local u43 = Elements.Button:Clone()
local u47 = u43.Icon:Clone()
u43.Icon:Destroy()
ViewController = require(script.Parent.Parent.Controllers.ViewController)
SpotLight = require(script.Parent.SpotLight)

local function Darken(a1, a2) -- Line: 28
    return a1:Lerp(Color3.new(), a2)
end

return function(a1) -- Line: 32
    -- upvalues: u43 (val), u47 (val), Value (val), Computed (val), Tween (val), Hydrate (val), OnEvent (val)
    -- upvalues: RunService (val), Sound (val), OnChange (val), Children (val), Scale (val), Spring (val), New (val)
    local v1 = u43:Clone()
    local v2 = u47:Clone()
    local v3 = a1.Transparency or 0
    local Color = a1.Color
    if not Color then
        Color = v1.ImageColor3
    end
    local Animate = a1.Animate
    if Animate == nil then
        Animate = true
    end
    local Clicking = a1.Clicking
    if not Clicking then
        Clicking = Value(false)
    end
    local Hovering = a1.Hovering
    if not Hovering then
        Hovering = Value(false)
    end
    local Active = a1.Active
    if not Active then
        Active = Value(true)
    end
    local Text = a1.Text and a1.Text ~= ""
    local u39 = Computed(function() -- Line: 48 -- upvalues: a1 (val)
        if not a1.Icon then
            return ""
        end
        if typeof(a1.Icon) ~= "string" then
            return a1.Icon:get() or ""
        end
        return a1.Icon
    end)
    local v4 = Tween(Computed(function() -- Line: 61 -- upvalues: Color (val), Hovering (val), Active (val)
        local v1 = Color
        if typeof(v1) ~= "Color3" then
            v1 = v1:get()
        end
        if Hovering:get() and Active:get() then
            return (v1:Lerp(Color3.new(), 0.4))
        end
        return v1
    end), TweenInfo.new(0.1, Enum.EasingStyle.Linear))
    local v5 = Hydrate(v1)
    local v6 = {
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Selectable = true,
        BorderSizePixel = 0,
    }
    v6.BackgroundTransparency = if Text then 1 else v3
    v6.BackgroundColor3 = v4
    v6.ImageTransparency = if not Text then 1 else v3
    v6.ImageColor3 = v4
    local MouseButton1Down = OnEvent("MouseButton1Down")

    v6[MouseButton1Down] = function() -- Line: 86 -- upvalues: Clicking (val)
        Clicking:set(true)
    end

    local MouseButton1Up = OnEvent("MouseButton1Up")

    v6[MouseButton1Up] = function() -- Line: 89 -- upvalues: RunService (upval), a1 (val), Sound (upval), Animate (ref), Clicking (val)
        if RunService:IsRunning() then
            local ClickSound = a1.ClickSound
            if ClickSound == nil then
                ClickSound = "Click"
            end
            if ClickSound ~= "" then
                Sound(ClickSound):Play()
            end
        end
        if Animate then
            if not Clicking:get() then
                return
            end
            Clicking:set(false)
        end
        if a1.Clicked then
            a1.Clicked()
        end
    end

    local Active_2 = OnChange("Active")

    v6[Active_2] = function(a1) -- Line: 114 -- upvalues: Active (val)
        Active:set(a1)
    end

    local MouseEnter = OnEvent("MouseEnter")

    v6[MouseEnter] = function() -- Line: 117 -- upvalues: Hovering (val), a1 (val)
        Hovering:set(true)
        if a1.MouseEnter then
            a1.MouseEnter()
        end
    end

    local MouseLeave = OnEvent("MouseLeave")

    v6[MouseLeave] = function() -- Line: 124 -- upvalues: Hovering (val), Clicking (val), a1 (val)
        Hovering:set(false)
        Clicking:set(false)
        if a1.MouseLeave then
            a1.MouseLeave()
        end
    end

    local v7 = {}
    local v8 = not a1.NoScale and Scale({
        Scale = Spring(Computed(function() -- Line: 136 -- upvalues: Animate (ref), Clicking (val), Hovering (val), Active (val)
            if not Animate then
                return 1
            end
            local v1 = Clicking:get()
            local v2 = Hovering:get()
            if Active:get() then
                if v1 then
                    return 0.9
                end
                if v2 then
                    return 1.1
                end
            end
            return 1
        end), 50, 0.6),
    }) or nil
    local v9 = New("UICorner")({CornerRadius = UDim.new(0, if Text then 0 else 6)})
    local v10 = New("UIStroke")({
        Thickness = if Text then 0 else 2,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Transparency = if Text then 1 else 0.5,
        Color = v4,
    })
    local v11 = Hydrate(v2)({
        AnchorPoint = if Text then nil else Vector2.new(0.5, 0.5),
        Position = if Text then nil else UDim2.fromScale(0.5, 0.5),
        Image = u39,
        ImageTransparency = v3,
        Visible = Computed(function() -- Line: 178 -- upvalues: u39 (val)
            local v1 = u39:get()
            local v2 = false
            if v1 ~= nil then
                v2 = v1 ~= ""
            end
            return v2
        end),
    })
    local v12 = Hydrate(v1.Value)
    local v13 = {
        Size = UDim2.new(UDim.new(0, 0), v1.Value.Size.Y),
        Visible = not not Text,
        AutomaticSize = Enum.AutomaticSize.X,
        RichText = a1.RichText,
        Text = if Text then a1.Text else "",
        TextColor3 = a1.TextColor,
        TextTransparency = v3,
        LayoutOrder = 3,
        TextXAlignment = Computed(function() -- Line: 196 -- upvalues: u39 (val)
            local v1 = u39:get()
            if v1 ~= nil and v1 ~= "" then
                return Enum.TextXAlignment.Left
            end
            return Enum.TextXAlignment.Center
        end),
    }
    v13[Children] = {
        Hydrate(v1.Value.UIStroke)({
            Color = a1.TextStrokeColor,
            Transparency = a1.TextStrokeTransparency or v3,
            LineJoinMode = Enum.LineJoinMode.Miter,
        }),
    }
    v12 = v12(v13)
    v7[1] = v8
    v7[2] = v9
    v7[3] = v10
    v7[4] = v11
    v7[5] = v12
    v7[6] = a1[Children]
    v6[Children] = v7
    v5 = v5(v6)
    local Frame = New("Frame")
    local v14 = {}
    local Position = a1.Position or v1.Position
    v14.Position = Position
    local Size = a1.Size or v1.Size
    v14.Size = Size
    local SizeConstraint = a1.SizeConstraint or v1.SizeConstraint
    v14.SizeConstraint = SizeConstraint
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v14.AnchorPoint = AnchorPoint
    v14.BackgroundTransparency = 1
    v14.Visible = a1.Visible
    v14.ZIndex = a1.ZIndex
    v14.LayoutOrder = a1.LayoutOrder
    v8 = {}
    v10 = a1.SpotLight and SpotLight({Name = a1.SpotLight, Target = v5}) or nil
    v8[1] = v5
    v8[2] = v10
    v14[Children] = v8
    return (Frame(v14))
end