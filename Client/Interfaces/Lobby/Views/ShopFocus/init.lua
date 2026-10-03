-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.ShopFocus
-- Decompile time: 19.18 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Interfaces = ReplicatedStorage.Client.Interfaces
local ShopFocus = Interfaces.Lobby.Views.ShopFocus
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Shared = ReplicatedStorage.Shared
local UI = Shared.UI
local Packages = ReplicatedStorage.Packages
local Network = require(Shared.Modules.Network)
local NewNetwork = require(Shared.Modules.NewNetwork)
local Promise = require(Packages.Promise)
local React = require(UI.React)
local Sift = require(Packages.Sift)
local InventoryContext = require(ReplicatedStorage.Client.Interfaces.Contexts.InventoryContext)
local ShopFocusStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.ShopFocusStore)
local CrateContents = require(Interfaces.Lobby.Components.ShopRevamp.CrateContents)
local CratePreview3D = require(ShopFocus.PreviewClasses.CratePreview3D)
local EmotePreview3D = require(ShopFocus.PreviewClasses.EmotePreview3D)
local HudCurrency = require(Interfaces.Lobby.Components.Hud.HudCurrency)
local Icons = require(Interfaces.LegacyInterface.Icons)
local LevelPreviewNavigation = require(Interfaces.Lobby.Components.ShopRevamp.PreviewInfo.LevelPreviewNavigation)
local NametagPreview3D = require(ShopFocus.PreviewClasses.NametagPreview3D)
local PreviewCamera = require(ShopFocus.PreviewCamera)
local PreviewInfo = require(Interfaces.Lobby.Components.ShopRevamp.PreviewInfo)
local PurchasePrompt = require(ReplicatedStorage.Client.Interfaces.Universal.Components.PurchasePrompt)
local RestrictedCrateView = require(Interfaces.Lobby.Components.ShopRevamp.Components.RestrictedCrateView)
local TowerPreview3D = require(ShopFocus.PreviewClasses.TowerPreview3D)
local TowerPreviewPanel = require(Interfaces.Lobby.Components.ShopRevamp.TowerPreviewPanel)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local TroopsModel = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.TroopsModel)
local Streaming = Network.Channel("Streaming")
local NewShop = NewNetwork.Channel("NewShop")
local useCache = require(Hooks.useCache)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useViewEnabled = require(Hooks.useViewEnabled)
local useCallback = React.useCallback
local useBinding = React.useBinding
local useEffect = React.useEffect
local createElement = React.createElement
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
local u163 = {}

local function fetchTroopModel(a1, a2) -- Line: 70
    -- upvalues: Promise (val), u163 (val), Streaming (val), TroopsModel (val)
    return Promise.new(function(a1_2, a2_2, a3) -- Line: 71
        -- upvalues: a1 (val), a2 (val), u163 (upval), Streaming (upval), TroopsModel (upval)
        if not a1 then
            a2_2("Invalid shop focus data")
            return
        end
        local u7 = false
        a3(function() -- Line: 78 -- upvalues: u7 (ref)
            u7 = true
        end)
        local v1 = os.clock()
        local v2 = a2 or "Default"
        local v3 = u163[a1]
        if not v3 then
            u163[a1] = {}
        end
        local v4 = v3[v2] == true
        v3[v2] = true
        Streaming:FireServer("SelectTower", a1, a2)
        local v5 = TroopsModel(a1, a2)
        if not v5 then
            a2_2((("Failed to fetch troop model for ShopFocus: %*, %*"):format(a1, v2)))
            return
        end
        local v6 = os.clock() - v1
        if not v4 and v6 < 0.5 then
            task.wait(0.5 - v6)
        end
        if u7 then
            return
        end
        a1_2(v5)
    end)
end

local function fetchLocalCharacterModel() -- Line: 118 -- upvalues: Promise (val), Players (val)
    return Promise.new(function(a1, a2, a3) -- Line: 119 -- upvalues: Players (upval)
        local LocalPlayer = Players.LocalPlayer
        if not LocalPlayer then
            a2("LocalPlayer is not available")
            return
        end
        if LocalPlayer.Character then
            a1(LocalPlayer.Character)
            return
        end
        a2("Character model not found for local player")
    end)
end

local function cleanupShopFocusModel(a1) -- Line: 137 -- upvalues: Promise (val) -- types: a1: table
    return Promise.new(function(a1_2) -- Line: 138 -- upvalues: a1 (val)
        if a1.current then
            a1.current:Destroy()
            a1.current = nil
        end
        a1_2()
    end)
end

local function getTowerPreviewDefinition(a1, a2) -- Line: 148
    -- upvalues: Troops (val)
    local Title, Title_2, Title_3, v1, v2
    local v3 = Troops(a1)
    local Stats = v3 and v3.Stats
    local Default = Stats and (a2 and Stats[a2] or Stats.Default)
    local v4 = {[0] = "Base Level"}
    if not Default then
        return {maxLevel = 0, pathCount = 0}, {}, v4
    end
    local v5 = nil
    local v6 = 0
    local v7 = {}
    for i, v in ipairs(Default.Upgrades) do
        if type(v) ~= "table" then
            v4[i] = (("Level %*"):format(i))
        elseif type(v[1]) == "table" then
            v1 = {}
            for i2, i3 in ipairs(v) do
                Title_3 = i3.Title or ("Level %*"):format(i)
                v1[i2] = Title_3
            end
            v4[i] = v1
            if not v5 then
                v5 = i
                v6 = #v
                for i4, j in ipairs(v) do
                    v2 = {path = i4}
                    Title_2 = j.Title or ("Path %*"):format(i4)
                    v2.title = Title_2
                    table.insert(v7, v2)
                end
            end
        else
            Title = v.Title or ("Level %*"):format(i)
            v4[i] = Title
        end
    end
    return {maxLevel = #Default.Upgrades, branchLevel = v5, pathCount = v6}, v7, v4
end

local function getPreviewLevelName(a1, a2) -- Line: 206
    local v1 = a1[a2.level]
    if type(v1) == "table" then
        local path = a2.path or a2.lastPath or 1
        v1 = v1[path]
    end
    if type(v1) == "string" and v1 ~= "" then
        return v1
    end
    if a2.level == 0 then
        return "Base Level"
    end
    return (("Level %*"):format(a2.level))
end

return function() -- Line: 219
    -- upvalues: useRef (val), LevelPreviewNavigation (val), useBinding (val), useViewEnabled (val)
    -- upvalues: useCharmSelector (val), ShopFocusStore (val), useCache (val), useState (val), useMemo (val)
    -- upvalues: getTowerPreviewDefinition (val), useCallback (val), useEffect (val), NewShop (val), PreviewCamera (val)
    -- upvalues: RunService (val), Promise (val), Sift (val), cleanupShopFocusModel (val), u163 (val), Streaming (val)
    -- upvalues: TroopsModel (val), TowerPreview3D (val), Players (val), EmotePreview3D (val), NametagPreview3D (val)
    -- upvalues: CratePreview3D (val), createElement (val), PurchasePrompt (val), InventoryContext (val)
    -- upvalues: HudCurrency (val), Icons (val), PreviewInfo (val), TowerPreviewPanel (val), CrateContents (val)
    -- upvalues: RestrictedCrateView (val)
    local u2 = useRef(nil)
    local u5 = useRef(nil)
    local u8 = useRef(nil)
    local u11 = useRef(nil)
    local u14 = useRef(nil)
    local u17 = useRef(false)
    local u22 = useRef(LevelPreviewNavigation.createInitialState())
    local u25 = useRef(0)
    local u28, u29 = useBinding(1)
    local ShopFocus, ShopFocus_2 = useViewEnabled("ShopFocus")
    local u38 = useCharmSelector(ShopFocusStore.getShopFocusData, function(a1) -- Line: 230
        return a1
    end)
    local u43 = useCache("Values.Coins", 0, ShopFocus)
    local u48 = useCache("Values.Gems", 0, ShopFocus)
    local u52, u53 = useState(LevelPreviewNavigation.createInitialState)
    local u56 = useRef(u52)
    local u59, u60 = useState(nil)
    local v1 = useMemo
    local v2 = {u38.name, u38.skin, u38.type}
    local u67 = v1(function() -- Line: 239 -- upvalues: u38 (val), getTowerPreviewDefinition (upval)
        if u38.type ~= "tower" and u38.type ~= "skin" then
            return {
                config = {maxLevel = 0, pathCount = 0},
                levelNames = {[0] = "Base Level"},
                pathOptions = {},
            }
        end
        local v1, v2, v3 = getTowerPreviewDefinition(u38.name, u38.skin)
        return {config = v1, levelNames = v3, pathOptions = v2}
    end, v2)
    local v3 = u67.levelNames[u52.level]
    if type(v3) == "table" then
        local path = u52.path or u52.lastPath or 1
        v3 = v3[path]
    end
    local u95 = if type(v3) ~= "string" then if u52.level ~= 0 then ("Level %*"):format(u52.level) else "Base Level" else if v3 ~= "" then v3 else if u52.level ~= 0 then ("Level %*"):format(u52.level) else "Base Level"
    local u131 = useCallback(function(a1) -- Line: 263
        -- upvalues: u14 (val), u17 (val), u25 (val), u2 (val), u22 (val), u5 (val), u56 (val), u53 (val)
        local u7
        u14.current = a1
        if u17.current then
            return
        end
        local current = u25.current

        function u7() -- Line: 271
            -- upvalues: current (val), u25 (upval), u14 (upval), u2 (upval), u17 (upval), u22 (upval), u7 (ref)
            -- upvalues: u5 (upval), u56 (upval), u53 (upval)
            if current ~= u25.current then
                return
            end
            local current_2 = u14.current
            u14.current = nil
            local current_3 = u2.current
            if current_2 and current_3 and current_3.SetUpgrade then
                local path = current_2.path or current_2.lastPath or 1
                if current_3.upgradeLevel ~= current_2.level then
                    u17.current = true
                    ;(((current_3:SetUpgrade(current_2.level, path)):andThen(function() -- Line: 302
                        -- upvalues: current (upval), u25 (upval), u2 (upval), current_3 (val), u5 (upval), u22 (upval)
                        -- upvalues: current_2 (val)
                        if current == u25.current and u2.current == current_3 then
                            local model = current_3.model
                            if model then
                                local current_4 = u5.current
                                if current_4 then
                                    current_4:SetSubject(model, true)
                                end
                            end
                            u22.current = current_2
                            return
                        end
                    end)):catch(function(a1) -- Line: 319
                        -- upvalues: current (upval), u25 (upval), u2 (upval), current_3 (val), u14 (upval), u22 (upval)
                        -- upvalues: u56 (upval), u53 (upval)
                        warn(a1)
                        if current == u25.current and u2.current == current_3 then
                            u14.current = nil
                            local current_2 = u22.current
                            u56.current = current_2
                            u53(current_2)
                            return
                        end
                    end)):finally(function() -- Line: 333 -- upvalues: current (upval), u25 (upval), u14 (upval), u7 (upval), u17 (upval)
                        if current ~= u25.current then
                            return
                        end
                        if u14.current then
                            u7()
                            return
                        end
                        u17.current = false
                    end)
                    return
                end
                if current_2.level ~= 0 and current_3.path ~= path then
                    u17.current = true
                    ;(((current_3:SetUpgrade(current_2.level, path)):andThen(function() -- Line: 302
                        -- upvalues: current (upval), u25 (upval), u2 (upval), current_3 (val), u5 (upval), u22 (upval)
                        -- upvalues: current_2 (val)
                        if current == u25.current and u2.current == current_3 then
                            local model = current_3.model
                            if model then
                                local current_4 = u5.current
                                if current_4 then
                                    current_4:SetSubject(model, true)
                                end
                            end
                            u22.current = current_2
                            return
                        end
                    end)):catch(function(a1) -- Line: 319
                        -- upvalues: current (upval), u25 (upval), u2 (upval), current_3 (val), u14 (upval), u22 (upval)
                        -- upvalues: u56 (upval), u53 (upval)
                        warn(a1)
                        if current == u25.current and u2.current == current_3 then
                            u14.current = nil
                            local current_2 = u22.current
                            u56.current = current_2
                            u53(current_2)
                            return
                        end
                    end)):finally(function() -- Line: 333 -- upvalues: current (upval), u25 (upval), u14 (upval), u7 (upval), u17 (upval)
                        if current ~= u25.current then
                            return
                        end
                        if u14.current then
                            u7()
                            return
                        end
                        u17.current = false
                    end)
                    return
                end
                u22.current = current_2
                if u14.current then
                    u7()
                    return
                end
                u17.current = false
                return
            end
            u17.current = false
        end

        u7()
    end, {})
    local v4 = {u131}
    local u136 = useCallback(function(a1) -- Line: 349 -- upvalues: u56 (val), u53 (val), u131 (val)
        if a1 == u56.current then
            return
        end
        u56.current = a1
        u53(a1)
        u131(a1)
    end, v4)
    local v5 = useCallback
    local v6 = {u67.config, u136}
    local u146 = v5(function() -- Line: 359 -- upvalues: u136 (val), LevelPreviewNavigation (upval), u56 (val), u67 (val)
        u136(LevelPreviewNavigation.next(u56.current, u67.config))
    end, v6)
    v4 = useCallback
    local v7 = {u67.config, u136}
    local u152 = v4(function() -- Line: 365 -- upvalues: u136 (val), LevelPreviewNavigation (upval), u56 (val), u67 (val)
        u136(LevelPreviewNavigation.previous(u56.current, u67.config))
    end, v7)
    v6 = useCallback
    local v8 = {u67.config, u136}
    local u158 = v6(function(a1) -- Line: 371
        -- upvalues: u136 (val), LevelPreviewNavigation (upval), u56 (val), u67 (val)
        u136(LevelPreviewNavigation.selectPath(u56.current, u67.config, a1))
    end, v8)
    local v9 = {u38}
    useEffect(function() -- Line: 381
        -- upvalues: LevelPreviewNavigation (upval), u25 (val), u14 (val), u17 (val), u22 (val), u56 (val), u53 (val)
        local v1 = LevelPreviewNavigation.createInitialState()
        local v2 = u25
        v2.current = v2.current + 1
        u14.current = nil
        u17.current = false
        u22.current = v1
        u56.current = v1
        u53(v1)
    end, v9)
    v7 = useEffect
    v9 = {ShopFocus, u38.type, u38.name}
    v7(function() -- Line: 391 -- upvalues: ShopFocus (val), u38 (val), u60 (val), NewShop (upval)
        if ShopFocus and u38.type == "crate" and type(u38.name) == "string" and u38.name ~= "" then
            local u9 = false
            local name = u38.name
            u60(nil)
            task.spawn(function() -- Line: 406 -- upvalues: NewShop (upval), name (val), u9 (ref), u60 (upval)
                local success, result = pcall(function() -- Line: 407 -- upvalues: NewShop (upval), name (upval)
                    return NewShop:invokeServer("getCratePreview", name)
                end)
                if u9 then
                    return
                end
                if success and type(result) == "table" then
                    u60(result)
                    return
                end
                if not success then
                    warn("[SHOP FOCUS] Failed to fetch crate preview: " .. tostring(result))
                end
            end)
            return function() -- Line: 422 -- upvalues: u9 (ref)
                u9 = true
            end
        end
        u60(nil)
    end, v9)
    useEffect(function() -- Line: 427 -- upvalues: PreviewCamera (upval), u5 (val), RunService (upval), u29 (val)
        local u2 = PreviewCamera.new()
        local u3 = nil
        u5.current = u2
        local u10 = RunService.RenderStepped:Connect(function() -- Line: 432 -- upvalues: u2 (val), u3 (ref), u29 (upval)
            local v1 = u2.distanceSpring:getPosition()
            if v1 == u3 then
                return
            end
            u3 = v1
            u29(u2:GetZoomInScalar())
        end)
        return function() -- Line: 442 -- upvalues: u10 (val), u5 (upval), u2 (val)
            u10:Disconnect()
            if u5.current == u2 then
                u5.current = nil
            end
            u2:Destroy()
        end
    end, {})
    v9 = {ShopFocus}
    useEffect(function() -- Line: 452 -- upvalues: ShopFocus (val), u5 (val), u2 (val), Promise (upval)
        if ShopFocus then
            return
        end
        local current = u5.current
        if current then
            (current:Disable()):catch(warn)
        end
        local u10 = u2
        ;(Promise.new(function(a1) -- Line: 138 -- upvalues: u10 (val)
            if u10.current then
                u10.current:Destroy()
                u10.current = nil
            end
            a1()
        end)):catch(warn)
    end, v9)
    v9 = {u131, u38, ShopFocus}
    useEffect(function() -- Line: 465
        -- upvalues: ShopFocus (val), Sift (upval), u38 (val), u8 (val), u11 (val), u2 (val), u5 (val)
        -- upvalues: cleanupShopFocusModel (upval), Promise (upval), u163 (upval), Streaming (upval)
        -- upvalues: TroopsModel (upval), TowerPreview3D (upval), u131 (val), u56 (val), Players (upval)
        -- upvalues: EmotePreview3D (upval), NametagPreview3D (upval), CratePreview3D (upval), u25 (val), u14 (val)
        -- upvalues: u17 (val)
        if ShopFocus and not Sift.Dictionary.equals(u38, {}) then
            local u7 = false
            local u8_2 = nil

            local function destroyLoadingPreview() -- Line: 474 -- upvalues: u8_2 (ref)
                local v1 = u8_2
                u8_2 = nil
                if v1 then
                    v1:Destroy()
                end
            end

            local function handleItemError(a1) -- Line: 482 -- upvalues: u8_2 (ref), u7 (ref)
                local v1 = u8_2
                u8_2 = nil
                if v1 then
                    v1:Destroy()
                end
                if not u7 then
                    warn(a1)
                end
            end

            if u8.current then
                u8.current:cancel()
                u8.current = nil
            end
            if u11.current and type(u11.current) ~= "boolean" then
                u11.current:cancel()
                u11.current = nil
            end
            if u2.current then
                u2.current:Destroy()
                u2.current = nil
            end
            local current = u5.current
            if not current then
                warn("PreviewCamera not initialized for ShopFocus")
                return
            end
            local type_2 = u38.type
            local u77 = ((((current:Enable()):andThenCall(cleanupShopFocusModel, u2)):andThen(function() -- Line: 515
                -- upvalues: u7 (ref), type_2 (val), u38 (upval), Promise (upval), u163 (upval), Streaming (upval)
                -- upvalues: TroopsModel (upval), TowerPreview3D (upval), u8_2 (ref), u2 (upval), u131 (upval)
                -- upvalues: u56 (upval), handleItemError (val), u11 (upval), Players (upval), EmotePreview3D (upval)
                -- upvalues: NametagPreview3D (upval), CratePreview3D (upval)
                local v1
                if u7 then
                    return
                end
                if type_2 ~= "tower" and type_2 ~= "skin" then
                    if type_2 == "emote" then
                        v1 = ((Promise.new(function(a1, a2, a3) -- Line: 119 -- upvalues: Players (upval)
                            local LocalPlayer = Players.LocalPlayer
                            if not LocalPlayer then
                                a2("LocalPlayer is not available")
                                return
                            end
                            if LocalPlayer.Character then
                                a1(LocalPlayer.Character)
                                return
                            end
                            a2("Character model not found for local player")
                        end)):andThen(function(a1) -- Line: 544 -- upvalues: EmotePreview3D (upval), u8_2 (upval), u7 (upval), u38 (upval), u2 (upval)
                            a1.Archivable = true
                            local v1 = a1:Clone()
                            a1.Archivable = false
                            local u9 = EmotePreview3D.new(v1)
                            u8_2 = u9
                            return (u9:Spawn()):andThen(function() -- Line: 551 -- upvalues: u7 (upval), u8_2 (upval), u9 (val), u38 (upval), u2 (upval)
                                if not u7 then
                                    u9:PlayEmote(u38.name, true)
                                    u8_2 = nil
                                    u2.current = u9
                                    return
                                end
                                local v1 = u8_2
                                u8_2 = nil
                                if v1 then
                                    v1:Destroy()
                                end
                            end)
                        end)):catch(handleItemError)
                        u11.current = v1
                        return v1
                    end
                    if type_2 == "nametag" then
                        v1 = ((Promise.new(function(a1, a2, a3) -- Line: 119 -- upvalues: Players (upval)
                            local LocalPlayer = Players.LocalPlayer
                            if not LocalPlayer then
                                a2("LocalPlayer is not available")
                                return
                            end
                            if LocalPlayer.Character then
                                a1(LocalPlayer.Character)
                                return
                            end
                            a2("Character model not found for local player")
                        end)):andThen(function(a1) -- Line: 568
                            -- upvalues: NametagPreview3D (upval), u8_2 (upval), Players (upval), u38 (upval)
                            -- upvalues: u7 (upval), u2 (upval)
                            a1.Archivable = true
                            local v1 = a1:Clone()
                            a1.Archivable = false
                            local v2 = NametagPreview3D.new(v1)
                            u8_2 = v2
                            v2:Spawn(Players.LocalPlayer.DisplayName, u38.name)
                            if not u7 then
                                u8_2 = nil
                                u2.current = v2
                                return
                            end
                            local v3 = u8_2
                            u8_2 = nil
                            if v3 then
                                v3:Destroy()
                            end
                        end)):catch(handleItemError)
                        u11.current = v1
                        return v1
                    end
                    if type_2 ~= "crate" then
                        warn("Unknown shop focus data type: " .. tostring(type_2))
                        return
                    end
                    local u36 = CratePreview3D.new(u38.name)
                    u8_2 = u36
                    local v2 = ((u36:Spawn()):andThen(function() -- Line: 596 -- upvalues: u7 (upval), u8_2 (upval), u2 (upval), u36 (val)
                        if not u7 then
                            u8_2 = nil
                            u2.current = u36
                            return
                        end
                        local v1 = u8_2
                        u8_2 = nil
                        if v1 then
                            v1:Destroy()
                        end
                    end)):catch(handleItemError)
                    u11.current = v2
                    return v2
                end
                local name = u38.name
                local skin = u38.skin
                v1 = ((Promise.new(function(a1, a2, a3) -- Line: 71
                    -- upvalues: name (val), skin (val), u163 (upval), Streaming (upval), TroopsModel (upval)
                    if not name then
                        a2("Invalid shop focus data")
                        return
                    end
                    local u7 = false
                    a3(function() -- Line: 78 -- upvalues: u7 (ref)
                        u7 = true
                    end)
                    local v1 = os.clock()
                    local v2 = skin or "Default"
                    local v3 = u163[name]
                    if not v3 then
                        u163[name] = {}
                    end
                    local v4 = v3[v2] == true
                    v3[v2] = true
                    Streaming:FireServer("SelectTower", name, skin)
                    local v5 = TroopsModel(name, skin)
                    if not v5 then
                        a2((("Failed to fetch troop model for ShopFocus: %*, %*"):format(name, v2)))
                        return
                    end
                    local v6 = os.clock() - v1
                    if not v4 and v6 < 0.5 then
                        task.wait(0.5 - v6)
                    end
                    if u7 then
                        return
                    end
                    a1(v5)
                end)):andThen(function(a1) -- Line: 523
                    -- upvalues: TowerPreview3D (upval), u38 (upval), u8_2 (upval), u7 (upval), u2 (upval), u131 (upval)
                    -- upvalues: u56 (upval)
                    local v1 = a1:Clone()
                    local u9 = TowerPreview3D.new(v1, u38.name)
                    u8_2 = u9
                    return (u9:Spawn()):andThen(function() -- Line: 527 -- upvalues: u7 (upval), u8_2 (upval), u2 (upval), u9 (val), u131 (upval), u56 (upval)
                        if not u7 then
                            u8_2 = nil
                            u2.current = u9
                            u131(u56.current)
                            return
                        end
                        local v1 = u8_2
                        u8_2 = nil
                        if v1 then
                            v1:Destroy()
                        end
                    end)
                end)):catch(handleItemError)
                u11.current = v1
                return v1
            end)):andThen(function() -- Line: 613 -- upvalues: u7 (ref), u2 (upval), current (val)
                if u7 then
                    return
                end
                local current_2 = u2.current
                local model = current_2 and current_2.model
                if not model then
                    warn("No model found for shop focus preview object")
                    return
                end
                current:SetSubject(model)
            end)):catch(warn)
            u8.current = u77
            return function() -- Line: 630
                -- upvalues: u7 (ref), u25 (upval), u14 (upval), u17 (upval), u8_2 (ref), current (val), u8 (upval)
                -- upvalues: u77 (val), u11 (upval)
                u7 = true
                local v1 = u25
                v1.current = v1.current + 1
                u14.current = nil
                u17.current = false
                v1 = u8_2
                u8_2 = nil
                if v1 then
                    v1:Destroy()
                end
                current:ClearSubject()
                if u8.current == u77 then
                    u77:cancel()
                    u8.current = nil
                end
                local current_2 = u11.current
                if current_2 and type(current_2) ~= "boolean" then
                    current_2:cancel()
                    if u11.current == current_2 then
                        u11.current = nil
                    end
                end
            end
        end
    end, v9)
    if not ShopFocus or Sift.Dictionary.equals(u38, {}) then
        return
    end
    return createElement(PurchasePrompt, {
        render = function(a1) -- Line: 662
            -- upvalues: createElement (upval), InventoryContext (upval), HudCurrency (upval), u43 (val), Icons (upval)
            -- upvalues: u48 (val), PreviewInfo (upval), u38 (val), u95 (val), ShopFocus_2 (val), u146 (val), u158 (val)
            -- upvalues: u152 (val), u67 (val), u52 (val), TowerPreviewPanel (upval), u28 (val), CrateContents (upval)
            -- upvalues: u59 (val), RestrictedCrateView (upval)
            local path
            local v1 = createElement
            local inventoryProvider = InventoryContext.inventoryProvider
            local v2 = {
                CurrencyHolder = createElement("Frame", {
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(0.95, 0.1),
                    Size = UDim2.fromScale(0.07, 0.07),
                }, {
                    UIListLayout = createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        Padding = UDim.new(0.08, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                    }),
                    CoinsLabel = createElement(HudCurrency, {
                        LayoutOrder = 0,
                        name = "Coins",
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        AutomaticSize = Enum.AutomaticSize.X,
                        Size = UDim2.fromScale(0, 0.8),
                        currency = u43,
                        icon = Icons.Coins,
                    }),
                    GemsLabel = createElement(HudCurrency, {
                        LayoutOrder = 1,
                        name = "Gems",
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        AutomaticSize = Enum.AutomaticSize.X,
                        Size = UDim2.fromScale(0, 0.8),
                        currency = u48,
                        icon = Icons.Gems,
                        textColor = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(244, 201, 246)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 100, 234))),
                        }),
                        textStokeColor = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(107, 36, 94)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(102, 38, 99))),
                        }),
                    }),
                }),
            }
            local v3 = createElement
            local v4 = {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            }
            local v5 = {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 2})}
            local v6 = createElement
            local v7 = PreviewInfo
            local v8 = {
                itemData = u38,
                levelName = u95,
                onClose = function() -- Line: 720 -- upvalues: ShopFocus_2 (upval), u38 (upval)
                    ShopFocus_2(u38.returnView or "Shop")
                end,
                onNextLevel = u146,
                onPathSelected = u158,
                onPreviousLevel = u152,
                pathOptions = u67.pathOptions,
                previewConfig = u67.config,
                previewState = u52,
                purchasePrompt = a1,
            }
            v5.Panel = v6(v7, v8)
            if u38.type == "tower" then
                v6 = createElement
                v8 = {level = u52.level}
                path = u52.path or u52.lastPath
                v8.path = path
                v8.skinName = u38.skin
                v8.towerName = u38.name
                v8.zoomInScalar = u28
                v6 = v6(TowerPreviewPanel, v8)
            elseif u38.type ~= "skin" then
                v6 = nil
            else
                v6 = createElement
                v8 = {level = u52.level}
                path = u52.path or u52.lastPath
                v8.path = path
                v8.skinName = u38.skin
                v8.towerName = u38.name
                v8.zoomInScalar = u28
                v6 = v6(TowerPreviewPanel, v8)
            end
            v5.TowerPreviewPanel = v6
            v5.CrateContents = if u38.type ~= "crate" then nil else createElement(CrateContents, {crateName = u38.name})
            v5.RestrictedCrateView = if u38.type ~= "crate" or not u59 then nil else createElement(RestrictedCrateView, {crate = u59})
            v2.MainFrame = v3("Frame", v4, v5)
            return v1(inventoryProvider, {}, v2)
        end,
    })
end