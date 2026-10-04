-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerOptions
-- Decompile time: 12.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local React = require(ReplicatedStorage.Shared.UI.React)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local TowerUpgradeUtils = require(ReplicatedStorage.Shared.Modules.TowerUpgradeUtils)
require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local Event = React.Event
local createElement = React.createElement
local useBinding = React.useBinding
local useRef = React.useRef
local useEffect = React.useEffect
local useCallback = React.useCallback
local u53 = Color3.fromRGB(126, 255, 87)

local function TowerOption(a1) -- Line: 22
    -- upvalues: createElement (val), Event (val), useCallback (val), Tooltip (val)
    local Callback = a1.Callback
    local v1 = {
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Text = "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        BackgroundColor3 = Color3.fromRGB(29, 29, 29),
        BackgroundTransparency = 0.25,
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.fromOffset(65, 65),
        Visible = a1.Visible,
    }
    local v2 = {Callback}
    v1[Event.MouseButton1Up] = (useCallback(function() -- Line: 36 -- upvalues: Callback (val)
        if Callback then
            Callback()
        end
    end, v2))
    local v3 = {
        uIStroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
        }),
        uICorner = createElement("UICorner"),
    }
    local Tooltip_2 = a1.Tooltip and createElement(Tooltip, a1.Tooltip)
    v3.tooltip = Tooltip_2
    v3.icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = ("rbxassetid://%*"):format(a1.Icon or 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        aspectRatio = createElement("UIAspectRatioConstraint"),
        uICorner = createElement("UICorner"),
    })
    v2 = {
        TextScaled = true,
        TextSize = 10,
        TextWrapped = true,
        BackgroundTransparency = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }
    local DisplayText = a1.DisplayText or a1.Name or ""
    v2.Text = DisplayText
    v2.TextColor3 = Color3.fromRGB(255, 255, 255)
    v2.AnchorPoint = Vector2.new(0.5, 0.5)
    v2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v2.Position = UDim2.fromScale(0.5, 1)
    v2.Size = UDim2.fromScale(1.2, 0.3)
    v3.title = createElement("TextLabel", v2, {uIStroke1 = createElement("UIStroke", {Thickness = 3, Transparency = 0.5})})
    v3.selected = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 90,
        Image = if not a1.Selected then if not a1.Locked then "" else "rbxassetid://1197061307" else "rbxassetid://15303988233",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(1, -4, 0, 0),
        Size = UDim2.fromOffset(24, 24),
    })
    return createElement("TextButton", v1, v3)
end

return function(a1) -- Line: 105
    -- upvalues: useReactBinding (val), useRef (val), useEffect (val), RunService (val), GameState (val)
    -- upvalues: TowerUpgradeUtils (val), createElement (val), TowerOption (val), u53 (val), React (val)
    local DisplayText, v1, v2, v3, v4
    local v5 = a1.Level or 0
    local Icon = a1.Icon or 28591139
    local v6 = a1.TooltipKey or "1"
    local v7 = {}
    local v8 = 0
    local CooldownStart = a1.CooldownStart
    local CooldownInterval = a1.CooldownInterval
    local CooldownSync = a1.CooldownSync
    if not CooldownSync then
        CooldownSync = workspace:GetServerTimeNow()
    end
    local u473 = false
    if CooldownStart ~= nil then
        u473 = CooldownInterval ~= nil
    end
    local u25, u26 = useReactBinding(CooldownSync)
    local u29 = useRef(0)
    local v9 = u25:map(function(a1) -- Line: 120 -- upvalues: CooldownInterval (val)
        local v1 = CooldownInterval or 0.01
        return 1 - a1 % v1 / v1
    end)
    local v10 = {u473, CooldownStart, CooldownInterval, u26}
    useEffect(function() -- Line: 125
        -- upvalues: u473 (val), u26 (val), CooldownSync (val), CooldownStart (val), u29 (val), RunService (upval)
        -- upvalues: GameState (upval), u25 (val)
        if not u473 then
            return
        end
        u26(CooldownSync - CooldownStart)
        u29.current = 0
        local u13 = RunService.Heartbeat:Connect(function(a1) -- Line: 133 -- upvalues: u29 (upval), GameState (upval), u26 (upval), u25 (upval) -- types: a1: number
            local v1 = u29
            v1.current = v1.current + a1 * GameState.TimeScale
            if u29.current < 0.03333333333333333 then
                return
            end
            local current = u29.current
            u29.current = 0
            u26(u25:getValue() + current)
        end)
        return function() -- Line: 144 -- upvalues: u13 (val)
            if u13.Connected then
                u13:Disconnect()
            end
        end
    end, v10)
    local Values = a1.Values or {}
    local v11 = nil
    v10 = nil
    for i, j in Values, v11, v10 do
        local u346 = true
        if not (v5 < (j.Level or 0)) then
            u346 = not TowerUpgradeUtils.matchesPath(j, a1.Path)
        end
        v1 = a1.Selected == j.Value
        DisplayText = j.DisplayText or j.Name
        if v1 and j.Icon then
            Icon = j.Icon
        end
        if j.Tooltip and not j.Tooltip.Name then
            j.Tooltip.Name = ("%*TowerOption%*"):format(j.Name, v6)
        end
        if j.Tooltip and not j.DisplayText then
            DisplayText = ""
        end
        v2 = createElement
        v3 = TowerOption
        v4 = {
            Locked = u346,
            LayoutOrder = v8,
            Name = j.Name,
            DisplayText = DisplayText,
            Icon = j.Icon,
            Level = j.Level,
            Value = j.Value,
            Tooltip = j.Tooltip,
            Selected = v1,
            Callback = function() -- Line: 183 -- upvalues: u346 (val), a1 (val), j (val)
                if u346 then
                    return
                end
                if a1.Callback then
                    a1.Callback(j)
                end
            end,
        }
        v7[i] = (v2(v3, v4))
        v8 = v8 + 1
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(0, 80),
        AutomaticSize = Enum.AutomaticSize.X,
        LayoutOrder = a1.LayoutOrder,
        Visible = a1.Selected ~= nil,
    }, {
        header = createElement("Frame", {
            BackgroundTransparency = 0.5,
            LayoutOrder = 10,
            BackgroundColor3 = Color3.fromRGB(39, 39, 39),
            Size = UDim2.fromOffset(78, 78),
        }, {
            uIStroke = createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Transparency = if not u473 then 0.5 else 0,
                Thickness = if not u473 then nil else 3,
                Color = if not u473 then nil else u53,
            }, {
                gradient = if not u473 then nil else createElement("UIGradient", {
                    Rotation = 90,
                    Color = v9:map(function(a1) -- Line: 220
                        return ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                            if not (a1 + 0.005 < 1) then ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) else ColorSequenceKeypoint.new(a1, Color3.fromRGB(255, 255, 255)),
                            if not (a1 + 0.005 < 1) then nil else ColorSequenceKeypoint.new(a1 + 0.005, Color3.fromRGB(0, 0, 0)),
                            if not (a1 + 0.005 < 1) then nil else ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
                        })
                    end),
                    Offset = Vector2.new(0, -0.01),
                }),
            }),
            uICorner = createElement("UICorner"),
            icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = ("rbxassetid://%*"):format(Icon),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            }, {
                aspectRatio = createElement("UIAspectRatioConstraint"),
                uICorner = createElement("UICorner"),
            }),
            title = createElement("TextLabel", {
                TextScaled = true,
                TextSize = 10,
                TextWrapped = true,
                BackgroundTransparency = 1,
                ZIndex = 2,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = if not u473 then a1.Name or "" else v9:map(function(a1) -- Line: 270 -- upvalues: CooldownInterval (val)
                    return (tostring((math.ceil(a1 * CooldownInterval))))
                end),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 1),
                Size = UDim2.fromScale(1.2, 0.3),
            }, {uIStroke1 = createElement("UIStroke", {Thickness = 3, Transparency = 0.5})}),
        }),
        content = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0, 88, 0, 0),
            Size = UDim2.fromScale(0, 1),
        }, {
            uIListLayout = createElement("UIListLayout", {
                Padding = UDim.new(0, 8),
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
            }),
            buttons = React.createElement(React.Fragment, {}, v7),
        }),
    })
end