-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Ability
-- Decompile time: 32.47 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local AbilitiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilitiesStore)
local AbilityIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilityIndicatorStore)
local Container = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Container)
local LockedAbilitiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.LockedAbilitiesStore)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local useBinding = React.useBinding
local createElement = React.createElement
local Event = React.Event
require(ReplicatedStorage.Shared.Modules.GameState)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useOneShot = require(ReplicatedStorage.Client.Interfaces.Hooks.useOneShot)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local u142 = if not RunService:IsRunning() then function(a1) end else require(ReplicatedStorage.Client.Interfaces.Hooks.useAbilityKeybind)
local Binding = require(script.Parent.Binding)

local function useAbility(a1, a2, a3, a4, a5) -- Line: 50
    -- upvalues: useState (val), useCharmSelector (val), AbilitiesStore (val), useEffect (val), RunService (val)
    -- upvalues: ServerTicks (val)
    local u7, u8 = useState(0)
    local v1 = {a1, a2}
    local u16 = useCharmSelector(AbilitiesStore.getState, function(a1_2) -- Line: 52 -- upvalues: a1 (val), a2 (val)
        if a1 and a2 then
            local v1 = a1_2[a2]
            if v1 then
                return v1[a1]
            end
        end
    end, v1)
    v1 = {u16, u7}
    useEffect(function() -- Line: 61 -- upvalues: u16 (val), u7 (val), u8 (val)
        local maxDeltaTime = u16 and u16.maxDeltaTime or 0
        if maxDeltaTime ~= u7 then
            u8(maxDeltaTime)
        end
    end, v1)
    v1 = {u16, a2, u7}
    useEffect(function() -- Line: 68 -- upvalues: u16 (val), a3 (val), RunService (upval), ServerTicks (upval), a4 (val), a5 (val)
        local deltaTime, maxDeltaTime
        if not u16 then
            deltaTime = 0
        else
            deltaTime = u16.deltaTime
            if not deltaTime then
                deltaTime = 0
            end
        end
        if not u16 then
            maxDeltaTime = 0
        else
            maxDeltaTime = u16.maxDeltaTime
            if not maxDeltaTime then
                maxDeltaTime = 0
            end
        end
        if u16 and maxDeltaTime > 0 then
            local u11 = nil
            u11 = RunService.Stepped:Connect(function() -- Line: 78
                -- upvalues: deltaTime (val), ServerTicks (upval), maxDeltaTime (val), a4 (upval), a3 (upval), u11 (ref)
                -- upvalues: a5 (upval)
                local v1 = math.max(0, deltaTime - (ServerTicks.getTime()))
                local v2 = math.clamp(v1 / maxDeltaTime, 0, 1)
                a4((math.ceil(v1)))
                a3(1 - v2)
                if v1 <= 0 then
                    u11:Disconnect()
                    if a5 then
                        a5()
                    end
                end
            end)
            a4((math.ceil((math.max(0, deltaTime - (ServerTicks.getTime()))))))
            return function() -- Line: 96 -- upvalues: u11 (ref)
                if u11.Connected then
                    u11:Disconnect()
                end
            end
        end
        a3(0)
    end, v1)
end

return function(a1) -- Line: 104
    -- upvalues: useMemo (val), HttpService (val), useState (val), useBinding (val), u142 (ref), useGameStateValue (val)
    -- upvalues: useCharmSelector (val), LockedAbilitiesStore (val), useSound (val), ReactFlow (val)
    -- upvalues: useReactBindings (val), useEffect (val), AbilityIndicatorStore (val), useAbility (val), useSpring (val)
    -- upvalues: useOneShot (val), useRef (val), React (val), Comma (val), ReplicatedStorage (val), createElement (val)
    -- upvalues: Binding (val), useTransparencyModifier (val), Container (val), TextLabel (val), Event (val)
    -- upvalues: Tooltip (val)
    local u277, u279, v1
    local Model = a1.Model
    local u3 = a1.Icon or 0
    local u5 = a1.Scale or 1
    local u8 = a1.Disabled == true
    local v2 = a1.UseBorder == true
    local v3 = a1.Name and a1.Name:gsub("[^%w]", "") or ""
    local Visible = if a1.Visible == nil then true else a1.Visible
    local u30 = useMemo(function() -- Line: 112 -- upvalues: HttpService (upval)
        return (("AbilityTooltip_%*"):format((HttpService:GenerateGUID(false))))
    end, {})
    local DisplayName = a1.DisplayName or a1.Name
    local TowerDisplayName = a1.TowerDisplayName or a1.TowerName or Model and Model.Name
    local v4 = if not a1.Description or a1.Description == "" then nil else {{Text = a1.Description}}
    local OnReady = a1.OnReady
    local OnHover = a1.OnHover
    if not OnHover then
        function OnHover() end
    end
    local u59, u60 = useState(false)
    local u63, u64 = useState(false)
    local u67, u68 = useState(false)
    local v5, v6 = useBinding(0)
    local u75, v7 = useBinding(0)
    local v8 = u142(a1.Name)
    local u88 = false
    if typeof(a1.Ammo) == "table" then
        u88 = a1.Ammo.map ~= nil
    end
    local v9 = false
    if typeof(a1.MaxAmmo) == "table" then
        v9 = a1.MaxAmmo.map ~= nil
    end
    local v10 = useGameStateValue("GlobalModifiersEnabled", {}).Inflation == true
    local v11 = useCharmSelector
    local getState = LockedAbilitiesStore.getState
    local v12 = {a1.Name}
    local u113 = v11(getState, function(a1_2) -- Line: 140 -- upvalues: a1 (val)
        return a1.Name and a1_2[a1.Name] == true
    end, v12)
    local u116, u117 = useBinding(false)
    local u120 = useSound("New Hover")
    local u123 = useSound("New Click")
    local v13, u128 = ReactFlow.useSpring({target = 1, start = -90, speed = 16.5, damper = 0.4})
    local v14, u133 = ReactFlow.useSpring({target = 1, start = 1, speed = 10, damper = 0.6})
    local v15 = {u116}
    useReactBindings(function(a1) -- Line: 161 -- upvalues: u133 (val), u128 (val)
        u133({start = 1, target = if not a1 then 1 else 0.3})
        u128({start = -90, target = 0})
    end, v15, {})
    local v16 = useEffect
    v15 = {u113, a1.ForcedLocked, a1.Name}
    v16(function() -- Line: 172 -- upvalues: a1 (val), u116 (val), u117 (val), u113 (val)
        local Name = a1.Name
        if a1.ForcedLocked and not u116:getValue() then
            u117(true)
            return
        end
        if u113 and not u116:getValue() then
            u117(true)
            return
        end
        u117(false)
    end, v15)
    v15 = {u30}
    useEffect(function() -- Line: 187 -- upvalues: AbilityIndicatorStore (upval), u30 (val)
        return function() -- Line: 188 -- upvalues: AbilityIndicatorStore (upval), u30 (upval)
            if AbilityIndicatorStore.getState().source == u30 then
                AbilityIndicatorStore.update({})
            end
        end
    end, v15)
    useAbility(v3, Model, v7, v6, OnReady)
    v16 = if not u88 then {u116} else {a1.Ammo, u116}
    local v17 = useReactBindings
    local v18 = {u67, u59, u63, Visible, u8, Model, a1.Ammo, u3, u30}
    v17(function(a1_2, a2) -- Line: 198
        -- upvalues: u88 (val), a1 (val), AbilityIndicatorStore (upval), u30 (val), Model (val), Visible (val)
        -- upvalues: u67 (val), u59 (val), u63 (val), u8 (val), u3 (val)
        if not u88 then
            a2 = a1_2
            a1_2 = a1.Ammo
        end
        local v1 = AbilityIndicatorStore.getState()
        local v2 = true
        if typeof(a1_2) == "number" then
            v2 = a1_2 > 0
        end
        local v3 = u30
        local v4 = false
        if Model ~= nil then
            v4 = Visible and (if u67 then not u8 and not a2 and v2 else if u59 then not u8 and not a2 and v2 else u63 and not u8 and not a2 and v2)
        end
        local v5 = "rbxassetid://" .. u3
        if not v4 then
            if v1.source == v3 then
                AbilityIndicatorStore.update({})
            end
            return
        end
        if v1.target == Model and v1.icon == v5 and v1.source == v3 then
            return
        end
        AbilityIndicatorStore.update({target = Model, icon = v5, source = v3})
    end, v16, v18)
    v17, u277, _, u279 = useSpring(1, 0.6, 40, true)
    local v19, u290 = useOneShot(0, 1, TweenInfo.new(0.4, Enum.EasingStyle.Sine), nil, true)
    local u293 = useRef(a1.ActivationSignal)
    local v20 = useEffect
    local v21 = {a1.ActivationSignal}
    v20(function() -- Line: 252 -- upvalues: a1 (val), u293 (val), u290 (val), u279 (val)
        if a1.ActivationSignal == nil or u293.current == a1.ActivationSignal then
            return
        end
        u293.current = a1.ActivationSignal
        u290()
        u279(4)
    end, v21)
    local Callback = a1.Callback
    local v22 = Color3.new(1, 1, 1)
    if a1.Ammo ~= nil then
        if typeof(a1.Ammo) ~= "table" then
            if typeof(a1.Ammo) == "number" and a1.Ammo <= 0 then
                v22 = Color3.fromRGB(35, 35, 35)
            end
        elseif a1.Ammo.map then
            v22 = a1.Ammo:map(function(a1) -- Line: 270
                if a1 <= 0 then
                    return (Color3.fromRGB(35, 35, 35))
                end
                return (Color3.new(1, 1, 1))
            end)
        elseif typeof(a1.Ammo) == "number" and a1.Ammo <= 0 then
            v22 = Color3.fromRGB(35, 35, 35)
        end
    end

    function v21(a1_2) -- Line: 278 -- upvalues: a1 (val)
        if a1_2 == 0 then
            return false
        end
        if a1.HideSingleAmmoCount and a1_2 == 1 then
            return false
        end
        return true
    end

    local v23 = true
    if u88 then
        v23 = a1.Ammo:map(function(a1_2) -- Line: 291 -- upvalues: a1 (val)
            if a1_2 == 0 then
                return false
            end
            if a1.HideSingleAmmoCount and a1_2 == 1 then
                return false
            end
            return true
        end)
    elseif typeof(a1.Ammo) == "number" then
        local Ammo_6 = a1.Ammo
        v23 = if Ammo_6 ~= 0 then if not a1.HideSingleAmmoCount then true else Ammo_6 ~= 1 else false
    end
    local v24 = false
    if a1.Ammo ~= nil then
        local Ammo_8, MaxAmmo_3

        local function v25(a1_2, a2) -- Line: 300 -- upvalues: a1 (val)
            if a1.HideTimeLeftAboveAmmo ~= nil and a1.HideTimeLeftAboveAmmo < (a1_2 or 0) then
                return false
            end
            if not a1.ShowTimeLeftAtZero then
                return a1_2 ~= a2
            end
            local v1 = false
            if a1.TimeLeft ~= nil then
                v1 = (a1_2 or 0) <= 0
            end
            return v1
        end

        if not u88 then
            if u88 then
                v24 = a1.Ammo:map(function(a1_2) -- Line: 317 -- upvalues: a1 (val)
                    local MaxAmmo = a1.MaxAmmo
                    if a1.HideTimeLeftAboveAmmo ~= nil and a1.HideTimeLeftAboveAmmo < (a1_2 or 0) then
                        return false
                    end
                    if not a1.ShowTimeLeftAtZero then
                        return a1_2 ~= MaxAmmo
                    end
                    if a1.TimeLeft ~= nil then
                        return (a1_2 or 0) <= 0
                    end
                    return false
                end)
            elseif not v9 then
                Ammo_8 = a1.Ammo
                MaxAmmo_3 = a1.MaxAmmo
                if a1.HideTimeLeftAboveAmmo == nil then
                    if not a1.ShowTimeLeftAtZero then
                        v24 = Ammo_8 ~= MaxAmmo_3
                    else
                        v24 = false
                        if a1.TimeLeft ~= nil then
                            v24 = (Ammo_8 or 0) <= 0
                        end
                    end
                elseif a1.HideTimeLeftAboveAmmo < (Ammo_8 or 0) then
                    v24 = false
                elseif not a1.ShowTimeLeftAtZero then
                    v24 = Ammo_8 ~= MaxAmmo_3
                else
                    v24 = false
                    if a1.TimeLeft ~= nil then
                        v24 = (Ammo_8 or 0) <= 0
                    end
                end
            else
                v24 = a1.MaxAmmo:map(function(a1_2) -- Line: 321 -- upvalues: a1 (val)
                    local Ammo = a1.Ammo
                    if a1.HideTimeLeftAboveAmmo ~= nil and a1.HideTimeLeftAboveAmmo < (Ammo or 0) then
                        return false
                    end
                    if not a1.ShowTimeLeftAtZero then
                        return Ammo ~= a1_2
                    end
                    if a1.TimeLeft ~= nil then
                        return (Ammo or 0) <= 0
                    end
                    return false
                end)
            end
        elseif v9 then
            v24 = (React.joinBindings({a1.Ammo, a1.MaxAmmo})):map(function(a1_2) -- Line: 313 -- upvalues: a1 (val)
                local v1 = a1_2[1]
                local v2 = a1_2[2]
                if a1.HideTimeLeftAboveAmmo ~= nil and a1.HideTimeLeftAboveAmmo < (v1 or 0) then
                    return false
                end
                if not a1.ShowTimeLeftAtZero then
                    return v1 ~= v2
                end
                if a1.TimeLeft ~= nil then
                    return (v1 or 0) <= 0
                end
                return false
            end)
        elseif u88 then
            v24 = a1.Ammo:map(function(a1_2) -- Line: 317 -- upvalues: a1 (val)
                local MaxAmmo = a1.MaxAmmo
                if a1.HideTimeLeftAboveAmmo ~= nil and a1.HideTimeLeftAboveAmmo < (a1_2 or 0) then
                    return false
                end
                if not a1.ShowTimeLeftAtZero then
                    return a1_2 ~= MaxAmmo
                end
                if a1.TimeLeft ~= nil then
                    return (a1_2 or 0) <= 0
                end
                return false
            end)
        elseif not v9 then
            Ammo_8 = a1.Ammo
            MaxAmmo_3 = a1.MaxAmmo
            if a1.HideTimeLeftAboveAmmo == nil then
                if not a1.ShowTimeLeftAtZero then
                    v24 = Ammo_8 ~= MaxAmmo_3
                else
                    v24 = false
                    if a1.TimeLeft ~= nil then
                        v24 = (Ammo_8 or 0) <= 0
                    end
                end
            elseif a1.HideTimeLeftAboveAmmo < (Ammo_8 or 0) then
                v24 = false
            elseif not a1.ShowTimeLeftAtZero then
                v24 = Ammo_8 ~= MaxAmmo_3
            else
                v24 = false
                if a1.TimeLeft ~= nil then
                    v24 = (Ammo_8 or 0) <= 0
                end
            end
        else
            v24 = a1.MaxAmmo:map(function(a1_2) -- Line: 321 -- upvalues: a1 (val)
                local Ammo = a1.Ammo
                if a1.HideTimeLeftAboveAmmo ~= nil and a1.HideTimeLeftAboveAmmo < (Ammo or 0) then
                    return false
                end
                if not a1.ShowTimeLeftAtZero then
                    return Ammo ~= a1_2
                end
                if a1.TimeLeft ~= nil then
                    return (Ammo or 0) <= 0
                end
                return false
            end)
        end
    end
    local u414 = false
    if a1.Price ~= nil then
        u414 = false
        if 0 < a1.Price then
            u414 = not a1.Disabled
        end
    end
    if not u414 then
        v1 = ""
    else
        local Price_2 = if not v10 then a1.Price else math.round(a1.Price * 1.5)
        v1 = ("$%*"):format((Comma(Price_2))) or ""
    end
    local v26 = u75:map(function(a1) -- Line: 333
        if a1 > 0 and a1 < 1 then
            return (Color3.fromRGB(255, 0, 0))
        end
        return (Color3.fromRGB(71, 255, 114))
    end)
    local v27 = u414
    if u88 then
        v27 = a1.Ammo:map(function(a1) -- Line: 340 -- upvalues: u414 (val)
            return u414 and a1 > 0
        end)
    elseif typeof(a1.Ammo) == "number" then
        v27 = u414 and 0 < a1.Ammo
    end

    local function u493() -- Line: 347
        -- upvalues: u8 (val), u75 (val), ReplicatedStorage (upval), a1 (val), Visible (val), u123 (val), Callback (val)
        if u8 then
            return
        end
        local v1 = u75:getValue()
        if v1 > 0 and v1 < 1 then
            (require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)).Create({
                Text = string.format("%q ability is on cooldown", a1.Name or ""),
                Color = Color3.fromRGB(255, 0, 0),
            })
            return
        end
        if not Visible then
            return
        end
        u123()
        if Callback then
            Callback()
        end
    end

    local v28 = nil
    if v8 then
        v28 = createElement(Binding, {
            FitText = true,
            ZIndex = 3,
            Visible = not u8 and Visible,
            Disabled = u8,
            Locked = u116,
            Binding = v8,
            Callback = u493,
            Pressed = function(a1) -- Line: 376 -- upvalues: u64 (val), u277 (val), u67 (val) -- types: a1: boolean
                u64(a1)
                u277(if not a1 then if not u67 then 1 else 1.1 else 0.9)
            end,
            Dark = a1.HotkeyDark ~= false,
            Position = UDim2.fromScale(0.5, 1.25),
            Size = UDim2.fromScale(0.3, 0.3),
            AnchorPoint = Vector2.new(0.5, 0.5),
        })
    end
    local v29 = useTransparencyModifier(a1.TransparencyModifier)
    local v30 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromOffset(80, 80)
    v30.Size = Size
    v30.Position = a1.Position
    v30.AnchorPoint = a1.AnchorPoint
    v30.LayoutOrder = a1.LayoutOrder
    v30.ZIndex = if not u67 then a1.ZIndex else 1000
    v30.Visible = Visible
    v30.ref = a1.Ref
    local v31 = {
        particle = createElement("ImageLabel", {
            Image = "rbxassetid://1057939773",
            BackgroundTransparency = 1,
            ImageColor3 = Color3.new(1, 1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ImageTransparency = v29(v19),
            Size = v19:map(function(a1) -- Line: 421
                return UDim2.fromScale(a1 * 4, a1 * 4)
            end),
        }),
    }
    local v32 = {
        Text = "",
        TextSize = 14,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        TextColor3 = Color3.fromRGB(),
        BackgroundColor3 = Color3.fromRGB(),
        BackgroundTransparency = v29(a1.Transparency or 0.3),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Active = not u8,
    }
    local v33 = {}
    local v34 = {}
    local v35 = if typeof(u5) ~= "table" then v17:map(function(a1) -- Line: 443 -- upvalues: u8 (val), u5 (val)
        return u8 and u5 or a1 * u5
    end) else (React.joinBindings({v17, u5})):map(function(a1) -- Line: 440 -- upvalues: u8 (val)
        return u8 and a1[2] or a1[1] * a1[2]
    end)
    v34.Scale = v35
    v33.scale = createElement("UIScale", v34)
    v33.uIStroke = createElement("UIStroke", {
        Thickness = 2,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = v29(0.7),
    })
    v33.uICorner = createElement("UICorner")
    v33.timerOutlineGradientFrame = v2 and createElement(Container, {
        CornerRadius = 8,
        StrokeThickness = 4,
        StrokeTransparency = 0,
        StrokeGradientRotation = -90,
        Size = UDim2.new(1, -2, 1, -2),
        StrokeColor = Color3.fromRGB(85, 255, 127),
        StrokeGradientOffset = u75:map(function(a1) -- Line: 465
            return Vector2.new(0, a1 - 0.5)
        end),
        StrokeGradientColor = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.505, Color3.fromRGB(0, 0, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
        }),
        StrokeGradientTransparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, 0),
            NumberSequenceKeypoint.new(0.505, 0.4),
            (NumberSequenceKeypoint.new(1, 0.4)),
        }),
        Transparency = a1.Transparency,
        Visible = u75:map(function(a1) -- Line: 483
            local v1 = false
            if a1 > 0 then
                v1 = a1 < 1
            end
            return v1
        end),
    })
    local Ammo_11 = a1.Ammo and createElement(Container, {
        CornerRadius = 8,
        StrokeThickness = 4,
        StrokeTransparency = 0,
        StrokeGradientRotation = -90,
        Size = UDim2.new(1, -2, 1, -2),
        StrokeColor = a1.bounceSpring:map(function(a1) -- Line: 492
            return (Color3.fromRGB(85, 255, 127)):Lerp(Color3.fromRGB(255, 255, 255), a1 * 10)
        end),
        StrokeGradientOffset = a1.percentageProgress:map(function(a1) -- Line: 499
            return Vector2.new(0, a1 - 0.5)
        end),
        StrokeGradientColor = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.505, Color3.fromRGB(0, 0, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
        }),
        StrokeGradientTransparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, 0),
            NumberSequenceKeypoint.new(0.505, 0.4),
            (NumberSequenceKeypoint.new(1, 0.4)),
        }),
        Transparency = a1.Transparency,
        Visible = a1.Ammo ~= a1.MaxAmmo,
    })
    v33.progressGradientFrame = Ammo_11
    v33.Locked = createElement("Frame", {
        ZIndex = 999,
        BackgroundTransparency = v14,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = u116,
    }, {
        Image = createElement("ImageLabel", {
            Image = "rbxassetid://91688211474848",
            ZIndex = 999,
            BackgroundTransparency = 1,
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Rotation = v13:map(function(a1) -- Line: 538
                return a1
            end),
        }, {
            uIScale = createElement("UIScale", {
                Scale = v13:map(function(a1) -- Line: 543
                    return 1 + a1 / 90
                end),
            }),
        }),
        uICorner = createElement("UICorner"),
    })
    local Ammo_12 = a1.Ammo and createElement(TextLabel, {
        FontWeight = "Black",
        StrokeThickness = 2,
        StrokeTransparency = 0.2,
        BackgroundTransparency = 1,
        ZIndex = 6,
        Text = a1.Ammo,
        TextColor3 = Color3.fromRGB(225, 225, 225),
        Transparency = a1.Transparency,
        Size = UDim2.fromScale(0.35, 0.35),
        Position = UDim2.fromScale(0.85, 0.15),
        Visible = v23,
        BackgroundColor3 = a1.bounceSpring:map(function(a1) -- Line: 564
            return (Color3.fromRGB(0, 0, 0)):Lerp(Color3.fromRGB(255, 255, 255), a1 * 4)
        end),
        Rotation = a1.bounceSpring:map(function(a1) -- Line: 568
            return a1 * 45
        end),
    }, {
        uIScale = createElement("UIScale", {
            Scale = a1.bounceSpring:map(function(a1) -- Line: 574
                return 1 + a1 * 2
            end),
        }),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0.1, 0),
            PaddingTop = UDim.new(0.1, 0),
            PaddingLeft = UDim.new(0.1, 0),
            PaddingRight = UDim.new(0.1, 0),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
    })
    v33.AmmoLabel = Ammo_12
    local Ammo_13 = a1.Ammo and createElement(TextLabel, {
        ZIndex = 7,
        FontWeight = "Black",
        StrokeThickness = 3,
        StrokeTransparency = 0.2,
        Size = UDim2.fromScale(0.7, 0.45),
        Position = UDim2.fromScale(0.5, 0.5),
        Text = a1.TimeLeft,
        Transparency = a1.Transparency,
        Visible = v24,
    }, {
        uIScale = createElement("UIScale", {
            Scale = React.joinBindings({a1.bounceSpring, a1.durationBounceSpring}):map(function(a1) -- Line: 605
                return 1 + a1[1] * 4 + a1[2]
            end),
        }),
    })
    v33.timeLeftAbility = Ammo_13
    local v36 = createElement
    v34 = {
        Image = "rbxassetid://" .. u3,
        ImageColor3 = v22,
        ImageTransparency = v29(),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(13, 2, 2),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.95, 0.95),
    }

    v34[Event.MouseButton1Down] = function() -- Line: 621 -- upvalues: u277 (val), u60 (val)
        u277(0.9)
        u60(true)
    end

    v34[Event.MouseButton1Up] = function() -- Line: 626 -- upvalues: u277 (val), u67 (val), u60 (val), u493 (val)
        u277(if not u67 then 1 else 1.1)
        u60(false)
        u493()
    end

    v34[Event.MouseEnter] = function() -- Line: 632 -- upvalues: u120 (val), u277 (val), u68 (val), OnHover (val)
        u120()
        u277(1.1)
        u68(true)
        OnHover(true)
    end

    v34[Event.MouseLeave] = function() -- Line: 639 -- upvalues: u277 (val), u68 (val), OnHover (val)
        u277(1)
        u68(false)
        OnHover(false)
    end

    v33.imageButton = v36("ImageButton", v34, {uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.12, 0)})})
    v33.cooldown = if v2 then nil else createElement("Frame", {
        ZIndex = 2,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v29(0.3),
        Size = UDim2.fromScale(1, 1),
        Visible = u75:map(function(a1) -- Line: 655
            local v1 = false
            if a1 > 0 then
                v1 = a1 < 1
            end
            return v1
        end),
    }, {
        uiCorner = createElement("UICorner"),
        uiGradient = createElement("UIGradient", {
            Rotation = -90,
            Offset = u75:map(function(a1) -- Line: 663
                return Vector2.new(0, (math.clamp(a1 - 0.5, -0.5, 0.5)))
            end),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.505, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v33.timeLeft = not v2 and createElement("TextLabel", {
        ZIndex = 3,
        TextScaled = true,
        TextSize = 10,
        TextWrapped = true,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = v5:map(function(a1) -- Line: 684
            return (math.ceil(a1))
        end),
        TextTransparency = v29(),
        Visible = u75:map(function(a1) -- Line: 688
            local v1 = false
            if a1 > 0 then
                v1 = a1 < 1
            end
            return v1
        end),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.5),
    }, {uiStroke2 = createElement("UIStroke", {Thickness = 3, Transparency = v29(0.5)})})
    v33.priceLabel = createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 4,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        TextColor3 = v26,
        TextTransparency = v29(),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Text = v1,
        Position = UDim2.fromScale(0.5, 0.95),
        Size = UDim2.fromScale(0.85, 0.225),
        AnchorPoint = Vector2.new(0.5, 1),
        Visible = v27,
    }, {uIStroke = createElement("UIStroke", {Thickness = 2.5, Transparency = v29(0.36)})})
    v33.binding = v28
    v33.tooltip = DisplayName and TowerDisplayName and createElement(Tooltip, {
        Bullets = false,
        Name = u30,
        Header = DisplayName,
        Subject = TowerDisplayName,
        Content = v4,
    })
    v31.content = createElement("TextButton", v32, v33)
    return createElement("Frame", v30, v31)
end