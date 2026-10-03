-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Hud
-- Decompile time: 3.00 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local Controllers = ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers
local Components = ReplicatedStorage.Client.Interfaces.Lobby.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local Experience = require(ReplicatedStorage.Shared.Modules.Experience)
local PartyStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.PartyStore)
local atoms = require(ReplicatedStorage.Packages.Quill).atoms
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewController = require(Controllers.ViewController)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useCache = require(Hooks.useCache)
local Hud = require(Components.Hud)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useState = React.useState
local useMemo = React.useMemo

local function showCurrencies() -- Line: 33 -- upvalues: ViewController (val)
    return ViewController:getCurrentView() == "Skills"
end

local function isViewEnabled() -- Line: 38 -- upvalues: ViewController (val)
    local v1 = ViewController:getCurrentView()
    local v2 = true
    if v1 ~= "" then
        v2 = v1 == "Hotbar"
    end
    return v2
end

local function useParty() -- Line: 43 -- upvalues: useCharmSelector (val), PartyStore (val), useMemo (val)
    local u4 = useCharmSelector(PartyStore.getState, function(a1) -- Line: 44
        return a1.party
    end)
    local v1 = {u4}
    local v2 = useMemo(function() -- Line: 48 -- upvalues: u4 (val)
        return u4 and u4.players or {}
    end, v1)
    return {members = v2, leader = v2[1]}
end

return function() -- Line: 58
    -- upvalues: useAtom (val), ClientAtoms (val), atoms (val), useState (val), ViewController (val), useFFlag (val)
    -- upvalues: useCache (val), Experience (val), useParty (val), useEffect (val), createElement (val), Hud (val)
    -- upvalues: useCallback (val)
    local v1 = useAtom(ClientAtoms.elevatorAtom) == nil
    local v2 = useAtom(atoms.inDialogMode)
    local v3, u13 = useState(function() -- Line: 62 -- upvalues: ViewController (upval)
        return ViewController:getCurrentView() == "Skills"
    end)
    local v4, u17 = useState(function() -- Line: 66 -- upvalues: ViewController (upval)
        local v1 = ViewController:getCurrentView()
        local v2 = true
        if v1 ~= "" then
            v2 = v1 == "Hotbar"
        end
        return v2
    end)
    local v5 = useFFlag("pvp.ranked-enabled", false, {enabled = v4})
    local v6 = useCache("Achievements", {})
    local v7 = useCache("Values.Coins", nil)
    local v8 = useCache("Values.Gems", nil)
    local v9 = useCache("Values.SkillCredits", 0)
    local v10 = useCache("Values.Level", 0)
    local v11 = useCache("Values.Experience", 0)
    local v12 = Experience(v10 + 1)
    local v13 = useParty()
    useEffect(function() -- Line: 81 -- upvalues: ViewController (upval), u17 (val), u13 (val)
        return (ViewController:onViewChange(function(a1) -- Line: 82 -- upvalues: u17 (upval), ViewController (upval), u13 (upval)
            local v1 = u17
            local v2 = ViewController:getCurrentView()
            local v3 = true
            if v2 ~= "" then
                v3 = v2 == "Hotbar"
            end
            v1(v3)
            u13(ViewController:getCurrentView() == "Skills")
        end))
    end, {})
    local v14 = {Visible = if v3 then not v2 else v4 and not v2}
    v14.buttonClicked = useCallback(function(a1) -- Line: 93 -- upvalues: ViewController (upval)
        ViewController:setView(a1)
    end, {})
    v14.achievements = v6
    v14.level = v10
    v14.exp = v11
    v14.maxExp = v12
    v14.pvpEnabled = v5
    v14.coins = v7
    v14.gems = v8
    v14.skillCredits = v9
    v14.onlyShowCurrencies = v3
    v14.partyLeader = v13.leader
    v14.partyMembers = v13.members
    v14.partyClicked = useCallback(function() -- Line: 110 -- upvalues: ViewController (upval)
        ViewController:setView("Party")
    end, {})
    v14.showPlayButton = v1 and not v2
    return createElement(Hud, v14, {})
end