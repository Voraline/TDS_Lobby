-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.LoadoutSelection
-- Decompile time: 2.25 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LoadOutPicker = require(ReplicatedStorage.Client.Interfaces.Game.Components.LoadOutPicker)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local usePlayerReplicatorValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicatorValue)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useCallback = React.useCallback
local useMemo = React.useMemo
local memo = React.memo
local PlayerManager = NewNetwork.Channel("PlayerManager")
local u62 = memo(function(a1) -- Line: 22
    -- upvalues: useState (val), useMemo (val), useCache (val), usePlayerReplicatorValue (val), Players (val)
    -- upvalues: useGameStateValue (val), table (val), useCallback (val), PlayerManager (val), useEffect (val)
    -- upvalues: createElement (val), LoadOutPicker (val)
    local v1, u4 = useState(true)
    local v2 = {v1}
    local v3 = useMemo(function() -- Line: 24
        return workspace:GetServerTimeNow()
    end, v2)
    local u13 = useCache("Inventory.Skins", {})
    local u17 = useCache("Equipped.Troops", {})
    local u23 = usePlayerReplicatorValue(Players.LocalPlayer, "EquippedTowers", {})
    local Loadouts = useGameStateValue("Loadouts")
    local DisableCustomLoadout = useGameStateValue("DisableCustomLoadout")
    local v4 = {u13, u17}
    local v5 = useMemo(function() -- Line: 35 -- upvalues: table (upval), u17 (val), u13 (val)
        return table.reduce(u17, function(a1, a2) -- Line: 36 -- upvalues: u13 (upval), table (upval)
            local v1 = u13[a2]
            v1 = v1 and v1.Name or "Default"
            table.insert(a1, {tower = a2, skin = v1})
            return a1
        end, {})
    end, v4)
    local v6 = useCallback(function() -- Line: 49 -- upvalues: PlayerManager (upval), u4 (val)
        PlayerManager:fireServer("UserLoadout")
        u4(false)
    end, {})
    local v7 = {Loadouts}
    v4 = useCallback(function() -- Line: 53 -- upvalues: Loadouts (val), PlayerManager (upval), u4 (val)
        local v1 = math.random(1, #Loadouts)
        PlayerManager:fireServer("SelectLoadout", Loadouts[v1].name)
        u4(false)
    end, v7)
    local v8 = useCallback(function(a1) -- Line: 58 -- upvalues: PlayerManager (upval), u4 (val)
        PlayerManager:fireServer("SelectLoadout", a1)
        u4(false)
    end, {})
    local v9 = {u23}
    useEffect(function() -- Line: 63 -- upvalues: u4 (val), u23 (val)
        u4(next(u23) == nil)
    end, v9)
    if not Loadouts then
        return nil
    end
    return createElement(LoadOutPicker, {
        Visible = v1,
        startsAt = v3,
        endsAt = v3 + 60,
        loadOuts = Loadouts,
        userLoadout = v5,
        userLoadoutPicked = v6,
        timerFinished = v4,
        loadOutPicked = v8,
        allowUserLoadout = not DisableCustomLoadout,
    })
end)
return function(a1) -- Line: 84 -- upvalues: createElement (val), u62 (val)
    if workspace.Type.Value ~= "Game" then
        return nil
    end
    return createElement(u62)
end