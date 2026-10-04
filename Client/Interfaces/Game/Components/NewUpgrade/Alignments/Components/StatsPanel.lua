-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.StatsPanel
-- Decompile time: 17.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local BaseComponents = script.Parent.Parent.BaseComponents
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local table = require(Shared.Modules.Utils.table)
local Container = require(BaseComponents.Container)
local ImageLabel = require(BaseComponents.ImageLabel)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local useBinding = React.useBinding
local joinBindings = React.joinBindings
local useSpring = ReactFlow.useSpring
local u51 = Color3.new(1, 1, 1)
local u56 = Color3.new(0, 1, 0)

local function updateBindingIfChanged(a1, a2, a3, a4) -- Line: 35 -- types: a3: number, a4: number?
    if (a4 or 0) < math.abs((a1:getValue()) - a3) then
        a2(a3)
    end
end

local u61 = React.memo(function(a1) -- Line: 44
    -- upvalues: u51 (val), u56 (val), useSpring (val), useRef (val), useEffect (val), createElement (val)
    -- upvalues: Container (val), ImageLabel (val), TextLabel (val), Tooltip (val)
    local TextColor3 = a1.TextColor3
    if not TextColor3 then
        TextColor3 = u51
    end
    local PulseColor3 = a1.PulseColor3
    if not PulseColor3 then
        PulseColor3 = u56
    end
    local u9 = a1.IsVertical ~= false
    local v1, u13 = useSpring({start = 0, speed = 20, damper = 0.7})
    local u16 = useRef(0)
    local v2 = useEffect
    local v3 = {a1.Value, a1.BuffText}
    v2(function() -- Line: 57 -- upvalues: u16 (val), a1 (val), u13 (val)
        local v1 = u16
        v1.current = v1.current + 1
        local current = u16.current
        local u12 = task.delay(0.02 * (a1.LayoutOrder - 1), function() -- Line: 61 -- upvalues: u16 (upval), current (val), u13 (upval)
            if u16.current ~= current then
                return
            end
            u13({start = 8, target = 0})
        end)
        return function() -- Line: 72 -- upvalues: u16 (upval), u12 (val)
            local v1 = u16
            v1.current = v1.current + 1
            if coroutine.status(u12) ~= "dead" then
                task.cancel(u12)
            end
        end
    end, v3)
    v3 = {Size = UDim2.new(1, 0, 0, 24), LayoutOrder = a1.LayoutOrder}
    local v4 = false
    if a1.Tooltip ~= nil then
        v4 = a1.Value ~= 0
    end
    v3.Active = v4
    v3.Visible = a1.Value ~= 0
    v4 = {}
    local v5 = {
        Size = UDim2.fromOffset(22, 22),
        Position = v1:map(function(a1) -- Line: 91
            return UDim2.new(-a1 / 150, 15, 0.5, 0)
        end),
    }
    local Icon_3 = typeof(a1.Icon) == "number" and ("rbxassetid://%*"):format(a1.Icon) or a1.Icon
    v5.Image = Icon_3
    v5.ScaleType = Enum.ScaleType.Fit
    v5.Transparency = a1.Transparency
    v4.iconImage = createElement(ImageLabel, v5)
    v4.textLabel = createElement(TextLabel, {
        FontWeight = "Bold",
        StrokeThickness = 2,
        Size = UDim2.new(1, -37, 0, 20),
        Position = v1:map(function(a1) -- Line: 103
            return UDim2.new(1 - a1 / 100, -8, 0.5, 0)
        end),
        AnchorPoint = Vector2.new(1, 0.5),
        Text = a1.Value,
        TextColor3 = v1:map(function(a1) -- Line: 109 -- upvalues: TextColor3 (val), PulseColor3 (val)
            return TextColor3:Lerp(PulseColor3, a1 / 10)
        end),
        TextXAlignment = Enum.TextXAlignment.Right,
        StrokeColor = Color3.fromRGB(0, 0, 0),
        Transparency = a1.Transparency,
    })
    v5 = {
        FontWeight = "Bold",
        StrokeThickness = 2,
        Size = UDim2.new(1, 0, 0, 20),
        Position = v1:map(function(a1) -- Line: 124 -- upvalues: u9 (val)
            if u9 then
                return UDim2.new(1 - a1 / 100, 16, 0.5, 0)
            end
            return UDim2.new(-a1 / 100, -8, 0.5, 0)
        end),
    }
    local v6 = if not u9 then Vector2.new(1, 0.5) else Vector2.new(0, 0.5)
    v5.AnchorPoint = v6
    v5.Text = a1.BuffText or ""
    local BuffColor = a1.BuffColor or Color3.fromRGB(255, 255, 255)
    v5.TextColor3 = BuffColor
    v5.Visible = a1.BuffText ~= nil
    v5.TextXAlignment = if not u9 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Left
    v5.StrokeColor = Color3.fromRGB(0, 0, 0)
    v5.Transparency = a1.Transparency
    v4.buffLabel = createElement(TextLabel, v5)
    local Tooltip_2 = a1.Tooltip
    if Tooltip_2 then
        Tooltip_2 = false
        if a1.Value ~= 0 then
            Tooltip_2 = createElement(Tooltip, {
                Name = a1.Tooltip.Name,
                Header = a1.Tooltip.Header,
                Subject = a1.Tooltip.Subject,
                Content = a1.Tooltip.Content,
                Disabled = a1.Tooltip.Disabled,
                Bullets = a1.Tooltip.Bullets,
            })
        end
    end
    v4.tooltip = Tooltip_2
    return createElement(Container, v3, v4)
end, function(a1, a2) -- Line: 157 -- upvalues: table (val)
    local v1 = false
    if a1.Icon == a2.Icon then
        v1 = false
        if a1.Value == a2.Value then
            v1 = false
            if a1.LayoutOrder == a2.LayoutOrder then
                v1 = false
                if a1.Transparency == a2.Transparency then
                    v1 = false
                    if a1.BuffText == a2.BuffText then
                        v1 = false
                        if a1.BuffColor == a2.BuffColor then
                            v1 = false
                            if a1.TextColor3 == a2.TextColor3 then
                                v1 = false
                                if a1.PulseColor3 == a2.PulseColor3 then
                                    v1 = false
                                    if a1.IsVertical == a2.IsVertical then
                                        v1 = table.deepCompare(a1.Tooltip, a2.Tooltip)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return v1
end)

local function getTooltipData(a1, a2, a3) -- Line: 170 -- types: a2: number
    if a3.ShowTooltips and a1.Tooltip then
        local Tooltip = a1.Tooltip
        local Name = Tooltip
        local TooltipSubject = a1.TooltipSubject
        local TooltipContent = a1.TooltipContent
        local TooltipBullets = a1.TooltipBullets
        if type(Tooltip) == "table" then
            Name = Tooltip.Header or Tooltip.Name or a1.Name
            TooltipSubject = Tooltip.Subject
            TooltipContent = Tooltip.Content
            TooltipBullets = Tooltip.Bullets
        end
        if type(Name) ~= "string" or Name == "" then
            Name = a1.Name
        end
        if type(Name) == "string" and Name ~= "" then
            return {
                Name = ("%*_%*_%*"):format(a3.TooltipName or a3.Title or "Stats", a2, Name),
                Header = Name,
                Subject = TooltipSubject,
                Content = TooltipContent,
                Bullets = TooltipBullets,
                Disabled = a3.TooltipsEnabled == false,
            }
        end
        return nil
    end
    return nil
end

return React.memo(function(a1) -- Line: 207
    -- upvalues: createElement (val), u61 (val), getTooltipData (val), useRef (val), table (val), useSpring (val)
    -- upvalues: useEffect (val), useBinding (val), Container (val), joinBindings (val), React (val), TextLabel (val)
    local v1 = {}
    for i, v in ipairs(a1.Stats) do
        table.insert(v1, (createElement(u61, {
            Icon = v.Icon,
            Value = v.Value,
            BuffText = v.BuffText,
            BuffColor = v.BuffColor,
            TextColor3 = v.TextColor3,
            PulseColor3 = v.PulseColor3,
            Tooltip = getTooltipData(v, i, a1),
            IsVertical = a1.IsVertical,
            LayoutOrder = i,
            Transparency = a1.Transparency,
        })))
    end
    local current = useRef({token = 0}).current
    local Stats = a1.Stats or {}
    if current.stats == nil or not table.deepCompare(current.stats, Stats) then
        current.stats = table.deepClone(Stats)
        current.token = current.token + 1
    end
    local v2, u47 = useSpring({speed = 25, damper = 0.8, start = #a1.Stats * 24 + 46})
    local v3, u51 = useSpring({start = 0, speed = 20, damper = 0.7})
    local v4 = useEffect
    local v5 = {current.token}
    v4(function() -- Line: 259 -- upvalues: u51 (val)
        u51({force = 1})
    end, v5)
    local u60, u61_2 = useBinding(1)
    local u64 = useRef(nil)
    local v6 = {
        Size = (joinBindings({v2, u60})):map(function(a1_2) -- Line: 268 -- upvalues: a1 (val)
            local v1 = a1_2[1]
            local v2 = a1_2[2]
            if v2 <= 0 or v2 ~= v2 then
                v2 = 1
            end
            return UDim2.new(a1.Size.X.Scale, a1.Size.X.Offset, 0, v1 / v2 + 10)
        end),
        Position = v3:map(function(a1_2) -- Line: 281 -- upvalues: a1 (val)
            return a1.Position + UDim2.fromOffset(0, 500 * (a1_2 * 2))
        end),
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.2,
        LayoutOrder = a1.LayoutOrder,
        Visible = if a1.Visible ~= nil then a1.Visible else true,
        Transparency = a1.Transparency,
        CornerRadius = 4,
        StrokeColor = Color3.fromRGB(90, 90, 90),
        StrokeThickness = 2,
    }

    v6[React.Change.AbsoluteSize] = function(a1) -- Line: 298 -- upvalues: u60 (val), u61_2 (val)
        local Offset = a1.Size.Y.Offset
        if Offset <= 0 then
            return
        end
        local v1 = a1.AbsoluteSize.Y / Offset
        if v1 <= 0 or v1 ~= v1 then
            v1 = 1
        end
        if 0.001 < math.abs((u60:getValue()) - v1) then
            u61_2(v1)
        end
    end

    local v7 = {}
    local v8 = createElement
    local v9 = {
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 3),
    }

    v9[React.Change.AbsoluteContentSize] = function(a1) -- Line: 326 -- upvalues: u64 (val), u47 (val)
        local Y = a1.AbsoluteContentSize.Y
        if u64.current and (math.abs(u64.current - Y)) <= 0.5 then
            return
        end
        u64.current = Y
        u47({target = Y})
    end

    v7.uiListLayout = v8("UIListLayout", v9)
    v7.uiPadding = createElement("UIPadding", {
        PaddingTop = UDim.new(0, 4),
        PaddingBottom = UDim.new(0, 4),
        PaddingLeft = UDim.new(0, 4),
        PaddingRight = UDim.new(0, 4),
    })
    v9 = {LayoutOrder = 1, Size = UDim2.new(0.7, 0, 0, a1.TitleHeight or 28)}
    local v10 = {}
    local v11 = {FontWeight = "Bold", StrokeThickness = 2}
    local TitleTextSize = a1.TitleTextSize or UDim2.fromScale(0.9, 0.625)
    v11.Size = TitleTextSize
    v11.Position = UDim2.fromScale(0.5, 0.05)
    v11.AnchorPoint = Vector2.new(0.5, 0)
    v11.Text = a1.Title or "STATS"
    v11.StrokeColor = Color3.fromRGB(0, 0, 0)
    v11.Transparency = a1.Transparency
    v10.statsText = createElement(TextLabel, v11)
    local v12 = false
    if a1.ShowUnderline ~= false then
        v12 = createElement(Container, {
            BackgroundTransparency = 0,
            Size = UDim2.new(1.2, 0, 0, 2),
            Position = UDim2.fromScale(0.5, 0.85),
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(109, 109, 109),
            Transparency = a1.Transparency,
        })
    end
    v10.underscoreFrame = v12
    v7.titleText = createElement(Container, v9, v10)
    v7.statEntries = createElement(React.Fragment, {}, v1)
    return createElement(Container, v6, v7)
end, function(a1, a2) -- Line: 379 -- upvalues: table (val)
    local v1 = table.deepCompare(a1.Stats, a2.Stats)
    if v1 then
        v1 = false
        if a1.Visible == a2.Visible then
            v1 = false
            if a1.Title == a2.Title then
                v1 = false
                if a1.TitleHeight == a2.TitleHeight then
                    v1 = false
                    if a1.TitleTextSize == a2.TitleTextSize then
                        v1 = false
                        if a1.ShowUnderline == a2.ShowUnderline then
                            v1 = false
                            if a1.ShowTooltips == a2.ShowTooltips then
                                v1 = false
                                if a1.TooltipsEnabled == a2.TooltipsEnabled then
                                    v1 = false
                                    if a1.TooltipName == a2.TooltipName then
                                        v1 = a1.IsVertical == a2.IsVertical
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return v1
end)