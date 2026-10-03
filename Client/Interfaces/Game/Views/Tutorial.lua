-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.Tutorial
-- Decompile time: 5.23 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Cache = require(ReplicatedStorage.Shared.UI.Cache)
local Reward = require(ReplicatedStorage.Client.Interfaces.Game.Components.Reward)
local Spotlight = require(ReplicatedStorage.Client.Interfaces.Game.Components.Spotlight)
local upgradeHandler = require(ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Upgrade.upgradeHandler)
local useConfetti = require(ReplicatedStorage.Client.Interfaces.Hooks.useConfetti)
local useDelayedCallback = require(ReplicatedStorage.Client.Interfaces.Hooks.useDelayedCallback)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useNetworkEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useNetworkEvent)
local useOneShot = require(ReplicatedStorage.Client.Interfaces.Hooks.useOneShot)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local DialogStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.DialogStore)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local TutorialStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TutorialStore)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local useEffect = React.useEffect
local useMemo = React.useMemo
local useCallback = React.useCallback
local useBinding = React.useBinding
local createElement = React.createElement

local function TutorialApp(a1) -- Line: 33
    -- upvalues: ReactCharm (val), TutorialStore (val), useGameStateValue (val), useBinding (val), useSpring (val)
    -- upvalues: useOneShot (val), useConfetti (val), useSound (val), React (val), useNetworkEvent (val)
    -- upvalues: useEffect (val), StarterGui (val), GameState (val), HttpService (val), DialogStore (val), Network (val)
    -- upvalues: upgradeHandler (val), UpgradesStore (val), useMemo (val), Cache (val), useCallback (val)
    -- upvalues: useDelayedCallback (val), useEvent (val), createElement (val), Reward (val), Spotlight (val)
    local u59
    local u5 = ReactCharm.useSignalState(TutorialStore.getState)
    local UpgradesDisabled = useGameStateValue("UpgradesDisabled")
    local Tutorial = useGameStateValue("Tutorial")
    local u14 = u5.SpotlightId ~= nil
    local v1, u19 = useBinding(u5.UnlockedTower)
    local v2, u26 = useSpring(0, 1, 10, true)
    local v3, u40 = useOneShot(0, 1, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), nil, true)
    local v4, u47 = useConfetti({{Amount = 20, Direction = -Vector2.yAxis}})
    local GoldenPerks = useSound("GoldenPerks")
    local u54 = React.useRef(nil)
    _, u59 = React.useState(nil)
    useNetworkEvent("TutorialSpotlight", "setSpotlight", function(a1) -- Line: 56 -- upvalues: TutorialStore (upval) -- types: a1: string
        TutorialStore.setSpotlightId(a1)
    end)
    local v5 = {u14}
    useEffect(function() -- Line: 60 -- upvalues: u14 (val), StarterGui (upval)
        if not u14 then
            return
        end
        StarterGui:SetCore("ResetButtonCallback", false)
        return function() -- Line: 67 -- upvalues: StarterGui (upval)
            StarterGui:SetCore("ResetButtonCallback", true)
        end
    end, v5)
    useEffect(function() -- Line: 72 -- upvalues: GameState (upval), HttpService (upval), DialogStore (upval), Network (upval)
        local u0 = nil

        local function checkGameState() -- Line: 75
            -- upvalues: GameState (upval), u0 (ref), HttpService (upval), DialogStore (upval), Network (upval)
            if not GameState.Replicator:Get("TutorialReadyPrompt") then
                if u0 then
                    u0()
                    u0 = nil
                end
                return
            end
            local u14 = HttpService:GenerateGUID(false)

            function u0() -- Line: 85 -- upvalues: DialogStore (upval), u14 (val), u0 (upval)
                DialogStore.remove(u14)
                u0 = nil
            end

            DialogStore.add({
                OverrideSetting = true,
                id = u14,
                dialog = {
                    Text = "Welcome recruit! Let's get started on teaching you the basics.",
                    Speaker = "Commander",
                    Emotion = "Default",
                    Voice = "rbxassetid://118443819128305",
                    Actions = {
                        ok = {
                            Text = "Ready!",
                            Color = Color3.fromRGB(109, 243, 72),
                            Clicked = function() -- Line: 105 -- upvalues: Network (upval), DialogStore (upval), u14 (val), u0 (upval)
                                Network.Channel("TutorialReady"):FireServer("Ready")
                                DialogStore.remove(u14)
                                u0 = nil
                            end,
                        },
                    },
                },
            })
        end

        local u11 = (GameState.Replicator:GetStateChangedSignal("TutorialReadyPrompt")):Connect(checkGameState)
        checkGameState()
        return function() -- Line: 120 -- upvalues: u11 (val), u0 (ref)
            u11:Disconnect()
            if u0 then
                u0()
            end
        end
    end, {})
    local v6 = useEffect
    v5 = {u5.ValidInstancesOrRefs, u5.SpotlightId}
    v6(function() -- Line: 128 -- upvalues: u5 (val), u54 (val), u59 (val)
        local v1 = u5.ValidInstancesOrRefs[u5.SpotlightId]
        if typeof(v1) == "table" then
            u54.current = v1.current
            u59(v1.current)
            return
        end
        u54.current = v1
        u59(v1)
    end, v5)
    v5 = {UpgradesDisabled}
    useEffect(function() -- Line: 139 -- upvalues: UpgradesDisabled (val), upgradeHandler (upval), UpgradesStore (upval)
        if UpgradesDisabled then
            upgradeHandler:clearTroop()
        end
        UpgradesStore.setDisabled(UpgradesDisabled)
    end, v5)
    v6 = useMemo(function() -- Line: 147 -- upvalues: Cache (upval)
        return Cache("Equipped.Troops")
    end, {})
    useDelayedCallback(5, useCallback(function() -- Line: 151 -- upvalues: TutorialStore (upval), u26 (val)
        TutorialStore.setUnlockedTower(nil)
        u26(0)
    end, {}), {u5.UnlockedTower ~= nil})
    useEvent(v6.Updated, function(a1, a2) -- Line: 157
        -- upvalues: Tutorial (val), TutorialStore (upval), u19 (val), u26 (val), GoldenPerks (val), u47 (val)
        -- upvalues: u40 (val)
        if not Tutorial then
            return
        end
        local v1 = a1[#a1]
        if v1 == nil then
            return
        end
        local v2 = #a1
        if v2 <= (a2 and #a2 or (1 / 0)) then
            return
        end
        TutorialStore.setUnlockedTower(v1)
        u19(v1)
        u26(1)
        GoldenPerks()
        u47(true)
        u40()
    end)
    v5 = createElement(Reward, {
        Type = "Tower",
        Tower = v1:getValue(),
        Visible = u5.UnlockedTower ~= nil,
        Size = UDim2.fromScale(0.5, 0.5),
    }, {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1, DominantAxis = Enum.DominantAxis.Height}),
    })
    if not Tutorial then
        return nil
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        Spotlight = createElement(Spotlight, {rootRef = u54, visible = u5.SpotlightId ~= nil}),
        TextContainer = createElement("TextLabel", {
            Text = "You've been given a new tower!",
            TextSize = 24,
            TextScaled = true,
            TextWrapped = false,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            TextColor3 = v3:map(function(a1) -- Line: 217
                return (Color3.fromRGB(255, 255, 255)):Lerp(Color3.fromRGB(240, 229, 82), a1)
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.4),
            Size = v2:map(function(a1) -- Line: 228
                return (UDim2.new(0.125, 0, 0.05, 0)):Lerp(UDim2.new(0.25, 0, 0.1, 0), a1)
            end),
            TextTransparency = v2:map(function(a1) -- Line: 232
                return 1 - a1
            end),
            ref = v4,
        }, {
            uIStroke = createElement("UIStroke", {
                Thickness = 2,
                LineJoinMode = Enum.LineJoinMode.Miter,
                Transparency = v2:map(function(a1) -- Line: 241
                    return (math.clamp(1 - a1 + 0.5, 0, 1))
                end),
            }),
        }),
        rewardContainer = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0.1),
            Size = UDim2.fromScale(1, 0.25),
        }, {
            listLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            towerReward = v5,
        }),
    })
end

return function(a1) -- Line: 265 -- upvalues: createElement (val), useGameStateValue (val), TutorialApp (val)
    a1.setDisplayOrder(9999999)
    a1.setIgnoreGuiInset(true)
    return createElement(function() -- Line: 269 -- upvalues: useGameStateValue (upval), createElement (upval), TutorialApp (upval)
        if not useGameStateValue("Tutorial") then
            return nil
        end
        return createElement(TutorialApp)
    end)
end