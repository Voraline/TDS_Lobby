-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MatchmakingInterface
-- Decompile time: 8.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local GamemodeBrowser = require(script.Parent.GamemodeBrowser)
local MatchmakingModel = require(script.Parent.MatchmakingModel)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local MatchmakingTrialContext = require(script.Parent.MatchmakingTrialContext)
local MatchmakingTrialData = require(script.Parent.MatchmakingTrialData)
local PartyBar = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.PartyBar)
local SquadSizeWindow = require(script.Parent.SquadSizeWindow)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
local memo = React.memo
local useCallback = React.useCallback
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
return memo(function(a1) -- Line: 88
    -- upvalues: useSound (val), MatchmakingModel (val), useMemo (val), MatchmakingTrialData (val), useState (val)
    -- upvalues: useRef (val), useEffect (val), useCallback (val), createElement (val), MatchmakingStyle (val)
    -- upvalues: React (val), MatchmakingTrialContext (val), GamemodeBrowser (val), SquadSizeWindow (val)
    -- upvalues: PartyBar (val)
    local u46
    local Click = useSound("Click")
    local modeGroups = a1.modeGroups
    if not modeGroups then
        modeGroups = MatchmakingModel.MODE_GROUPS
    end
    local u15 = math.clamp(math.floor(a1.currentPartySize or 1), 1, 8)
    local v1 = useMemo
    local v2 = {
        u15,
        a1.hasSandboxAdmin,
        a1.hasVoidcoreAccess,
        a1.isPartyLeader,
        a1.playerLevel,
        a1.pvpEnabled,
        a1.sandboxEnabled,
    }
    local u26 = v1(function() -- Line: 92 -- upvalues: a1 (val), u15 (val)
        return {
            hasSandboxAdmin = a1.hasSandboxAdmin ~= false,
            hasVoidcoreAccess = a1.hasVoidcoreAccess ~= false,
            isPartyLeader = a1.isPartyLeader ~= false,
            partySize = u15,
            playerLevel = a1.playerLevel or (1 / 0),
            pvpEnabled = a1.pvpEnabled ~= false,
            sandboxEnabled = a1.sandboxEnabled ~= false,
        }
    end, v2)
    local v3 = {u26, modeGroups}
    local v4 = useMemo(function() -- Line: 111 -- upvalues: MatchmakingModel (upval), modeGroups (val), u26 (val)
        return MatchmakingModel.applyAvailability(modeGroups, u26)
    end, v3)
    v2 = useMemo
    local v5 = {u26, a1.trialRotation}
    v2 = v2(function() -- Line: 114 -- upvalues: a1 (val), MatchmakingTrialData (upval), MatchmakingModel (upval), u26 (val)
        local v1
        if not (if not a1.trialRotation then nil else MatchmakingTrialData.resolve(a1.trialRotation)) then
            return nil
        end
        local v2 = MatchmakingModel.getQueueAvailability(v1, u26)
        local v3 = table.clone(v1)
        v3.locked = v2.locked
        v3.lockReason = v2.lockReason
        return v3
    end, v5)
    local u42 = a1.canStartMatchmaking ~= false
    v5, u46 = useState(Vector2.zero)
    local v6, u50 = useState(0)
    local u61, u62 = useState(if not a1.directMode then {kind = "Browse"} else {
        focusFirstCard = false,
        kind = "SquadSize",
        modeEntry = a1.directMode,
        modeTab = a1.directModeTab or "Arcade",
    })
    local u65 = useRef(true)
    local u68 = useRef(false)
    useEffect(function() -- Line: 145 -- upvalues: u65 (val)
        return function() -- Line: 146 -- upvalues: u65 (upval)
            u65.current = false
        end
    end, {})
    local v7 = {u42}
    useEffect(function() -- Line: 151 -- upvalues: u42 (val), u68 (val)
        if u42 then
            u68.current = false
        end
    end, v7)
    local v8 = true
    if not (v5.X < 1000) then
        v8 = v5.Y < 800
    end
    local v9 = {u26}
    local u95 = useCallback(function(a1) -- Line: 158 -- upvalues: MatchmakingModel (upval), u26 (val)
        if MatchmakingModel.getQueueAvailability(a1, u26).locked then
            return nil
        end
        local v1 = table.clone(a1)
        v1.locked = false
        v1.lockReason = nil
        return v1
    end, v9)
    v7 = if u61.kind ~= "SquadSize" then nil else u61
    local u128 = if not v7 then nil else u95(MatchmakingModel.findMode(v7.modeTab, v7.modeEntry.id, v4) or (if not v2 then v7.modeEntry else if v2.id ~= v7.modeEntry.id then v7.modeEntry else v2))
    local v10 = true
    if u61.kind ~= "Browse" then
        v10 = u128 == nil
    end
    local v11 = a1.visible ~= false
    local v12 = {u42, u95}
    local u180 = useCallback(function(a1, a2, a3) -- Line: 189 -- upvalues: u42 (val), u95 (val), u50 (val), u62 (val) -- types: a3: boolean
        if not u42 then
            return
        end
        local v1 = u95(a2)
        if not v1 then
            return
        end
        u50(function(a1) -- Line: 199
            return a1 + 1
        end)
        u62({kind = "SquadSize", focusFirstCard = a3, modeEntry = v1, modeTab = a1})
    end, v12)
    v12 = useCallback
    local v13 = {a1.onClose}
    local u187 = v12(function() -- Line: 226 -- upvalues: u50 (val), a1 (val)
        u50(function(a1) -- Line: 227
            return a1 + 1
        end)
        if a1.onClose then
            a1.onClose()
        end
    end, v13)
    local v14 = useCallback
    local v15 = {u42, u187, a1.onMatchmakingRequested}
    local u208 = v14(function(a1_2, a2, a3, a4) -- Line: 236
        -- upvalues: u42 (val), u68 (val), a1 (val), u65 (val), u187 (val)
        if u42 and not u68.current then
            if not a1.onMatchmakingRequested then
                return
            end
            u68.current = true
            local success, result, v1 = pcall(a1.onMatchmakingRequested, {modeEntry = a2, modeTab = a1_2, playerCount = a3, squadSizeId = a4})
            if not u65.current then
                return
            end
            if success and result then
                u187()
                return
            end
            u68.current = false
            if not success then
                warn((("[NewMatchmaking] Failed to request matchmaking: %*"):format(result)))
                return
            end
            if v1 then
                warn((("[NewMatchmaking] Matchmaking request was rejected: %*"):format(v1)))
            end
            return
        end
    end, v15)
    local v16 = {u95, u180, u208}
    v15 = useCallback(function(a1, a2, a3) -- Line: 310 -- upvalues: u95 (val), u208 (val), u180 (val) -- types: a3: boolean
        local v1 = u95(a2)
        if not v1 then
            return
        end
        local queue = v1.queue
        if queue and queue.targetPlayerCount then
            u208(a1, v1, queue.targetPlayerCount, nil)
            return
        end
        if queue then
            u180(a1, v1, a3)
        end
    end, v16)
    local v17 = {
        AnchorPoint = a1.anchorPoint,
        BackgroundColor3 = MatchmakingStyle.colors.background,
    }
    v17.BackgroundTransparency = if not v11 then 1 else MatchmakingStyle.transparency.background
    v17.BorderSizePixel = 0
    v17.Name = "MatchmakingInterface"
    v17.Position = a1.position
    local size = a1.size or UDim2.fromScale(1, 1)
    v17.Size = size

    v17[React.Change.AbsoluteSize] = function(a1) -- Line: 339 -- upvalues: u46 (val)
        u46(a1.AbsoluteSize)
    end

    local v18 = {
        BackgroundGradient = createElement("UIGradient", {
            Rotation = 8,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, MatchmakingStyle.colors.backgroundGradientStart),
                ColorSequenceKeypoint.new(0.48, MatchmakingStyle.colors.background),
                (ColorSequenceKeypoint.new(1, MatchmakingStyle.colors.backgroundGradientEnd)),
            }),
            Enabled = v11,
        }),
    }
    local v19 = {
        BackgroundTransparency = 1,
        ClipsDescendants = false,
        Selectable = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Active = v11,
        Size = UDim2.fromScale(1, 1),
        Visible = v11,
    }
    local v20 = {}
    local v21 = not v8 and createElement("UIAspectRatioConstraint", {AspectRatio = MatchmakingStyle.aspectRatios.regular})
    v20.AspectRatio = v21
    local Provider = MatchmakingTrialContext.Provider
    local v22 = {value = v2}
    local v23 = {
        Content = createElement(GamemodeBrowser, {
            active = v10 and v11,
            compact = v8,
            getSuggestedTowerActionColor = a1.getSuggestedTowerActionColor,
            getSuggestedTowerActionText = a1.getSuggestedTowerActionText,
            hasTrialMode = v2 ~= nil,
            initialTab = a1.initialTab,
            isPartyLeader = u26.isPartyLeader,
            loadStoryMissionRewards = a1.loadStoryMissionRewards,
            modeGroups = v4,
            mostPopularCategory = a1.mostPopularCategory,
            onClose = u187,
            onActivated = Click,
            onModeActivated = v15,
            isSuggestedTowerActionDisabled = a1.isSuggestedTowerActionDisabled,
            onSuggestedTowerView = a1.onSuggestedTowerView,
            playerCounts = a1.playerCounts,
            revealCycle = v6,
            storySections = a1.storySections,
            viewportSize = v5,
        }),
    }
    v20.Browser = createElement(Provider, v22, v23)
    if not u128 or not v7 then
        v21 = nil
    else
        v22 = {
            BackgroundTransparency = 1,
            ZIndex = 4,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }
        v23 = if not v8 then UDim2.fromScale(1, 1) else UDim2.fromScale(0.82, 1)
        v22.Size = v23
        v21 = createElement("Frame", v22, {
            Window = createElement(SquadSizeWindow, {
                currentPartySize = u15,
                focusFirstCard = v7.focusFirstCard,
                maxPlayers = u128.maxPlayers or 4,
                modeEntry = u128,
                onBack = function() -- Line: 213 -- upvalues: a1 (val), u62 (val)
                    if not a1.directMode then
                        u62({kind = "Browse"})
                        return
                    end
                    if a1.onClose then
                        a1.onClose()
                    end
                end,
                onClose = u187,
                onActivated = Click,
                onSquadSizeActivated = function(a1) -- Line: 277 -- upvalues: u61 (val), MatchmakingModel (upval), u128 (val), u15 (val), u62 (val), u208 (val)
                    if u61.kind ~= "SquadSize" then
                        return
                    end
                    local v1 = MatchmakingModel.findSquadSize(a1)
                    local v2 = u128 and u128.maxPlayers or 4
                    if v1 and u128 and not (v1.playerCount < u15) and not (v2 < v1.playerCount) then
                        u62({
                            kind = "SquadSize",
                            focusFirstCard = u61.focusFirstCard,
                            modeEntry = u61.modeEntry,
                            modeTab = u61.modeTab,
                            selectedSizeId = a1,
                        })
                        u208(u61.modeTab, u128, v1.playerCount, a1)
                        return
                    end
                end,
                selectedSizeId = v7.selectedSizeId,
            }),
        })
    end
    v20.SquadSize = v21
    v22 = {ZIndex = 230, layout = "vertical"}
    v22.AnchorPoint = Vector2.new(0.5, 1)
    v23 = if not v8 then UDim2.new(0, 56, 1, -24) else UDim2.new(0, 42, 1, -12)
    v22.Position = v23
    v22.clicked = a1.onPartyActivated
    v22.interactive = a1.onPartyActivated ~= nil
    v22.leader = a1.partyLeader
    v22.members = a1.partyMembers
    v22.showAddButton = if not a1.partyMembers then nil else #a1.partyMembers < (a1.partyCapacity or 4)
    v20.PartyBar = createElement(PartyBar, v22)
    v18.Window = createElement("Frame", v19, v20)
    return createElement("Frame", v17, v18)
end)