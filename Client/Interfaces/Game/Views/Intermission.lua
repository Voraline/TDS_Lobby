-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.Intermission
-- Decompile time: 4.80 ms

local Name, v1
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useBinding = React.useBinding
local useCharmBinding = require(Hooks.useCharmBinding)
local useCharmSelector = require(Hooks.useCharmSelector)
local useEvent = require(Hooks.useEvent)
local useGameStateValue = require(Hooks.useGameStateValue)
local useMediaQuery = require(Hooks.useMediaQuery)
local useViewEnabled = require(Hooks.useViewEnabled)
local IntermissionButtons = require(ReplicatedStorage.Client.Interfaces.Game.Components.IntermissionButtons)
local IntermissionTopBar = require(ReplicatedStorage.Client.Interfaces.Game.Components.IntermissionTopBar)
local MapOverride = require(ReplicatedStorage.Client.Interfaces.Game.Components.MapOverride)
local Content = ReplicatedStorage:WaitForChild("Content")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local IntermissionData = require(ReplicatedStorage.Shared.Modules.IntermissionData)
local IntermissionStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.IntermissionStore)
local u207 = {
    [Enum.Difficulty.Easy] = "Easy",
    [Enum.Difficulty.Normal] = "Normal",
    [Enum.Difficulty.Hard] = "Hard",
    [Enum.Difficulty.Insane] = "Insane",
}
local u169 = {}
for i, j in Content.Maps:GetChildren() do
    Name = j.Name
    if j:IsA("Folder") then
        j = j:FindFirstChild("Data")
    end
    v1 = require(j)
    if v1.MapType == Enum.MapType.Community
        or v1.Gamemodes[Enum.Gamemode[workspace:GetAttribute("GameMode") or "Survival"]] and IntermissionData.MAPS[Name] then
        u169[Name] = v1
    end
end

local function convertTime(a1) -- Line: 59
    local v1 = (a1 - a1 % 60) / 60
    local v2 = a1 - v1 * 60
    if v1 > 99 then
        return "Vote for a map to start the timer!"
    end
    return (string.format("%02i", v1)) .. ":" .. string.format("%02i", v2)
end

return function() -- Line: 70
    -- upvalues: useViewEnabled (val), useMediaQuery (val), useGameStateValue (val), useCharmSelector (val)
    -- upvalues: IntermissionStore (val), useState (val), useCharmBinding (val), GuiService (val), useEffect (val)
    -- upvalues: GameState (val), useEvent (val), createElement (val), React (val), MapOverride (val), u207 (val)
    -- upvalues: u169 (val), IntermissionButtons (val), IntermissionTopBar (val), convertTime (val)
    local v1, v2
    local Hotbar = useViewEnabled("Hotbar")
    local Empty = useViewEnabled("Empty")
    local v3 = not useMediaQuery("large")
    local CanVeto = useGameStateValue("CanVeto")
    local v4 = useCharmSelector(IntermissionStore.getState, function(a1) -- Line: 76
        return a1.mapOverrideVisible
    end)
    local v5 = useCharmSelector(IntermissionStore.getState, function(a1) -- Line: 80
        return a1.visible
    end)
    local v6 = useCharmSelector(IntermissionStore.getState, function(a1) -- Line: 84
        return a1.readyPlayers
    end)
    local v7 = useCharmSelector(IntermissionStore.getState, function(a1) -- Line: 87
        return a1.totalPlayers
    end)
    local u35, u36 = useState(true)
    local v8 = {u35}
    local u43 = useCharmSelector(IntermissionStore.getState, function(a1) -- Line: 93
        return a1.vetoPlayers
    end, v8)
    local v9 = useCharmSelector(IntermissionStore.getState, function(a1) -- Line: 96
        return a1.totalVetoPlayers
    end)
    local v10 = useCharmBinding(IntermissionStore.getState, function(a1) -- Line: 100
        return a1.voteTimeLeft
    end)
    local u58 = useCharmSelector(IntermissionStore.getState, function(a1) -- Line: 103
        return a1.isReady
    end)
    local u63 = useGameStateValue("GameMode") == "PVP"
    local PVPArena = useGameStateValue("PVPArena")
    local u71 = useGameStateValue("Ranked") == true
    local VotingForMap = useGameStateValue("VotingForMap")
    local u77, u78 = useState(false)
    local GuiInset = GuiService:GetGuiInset()
    local v11 = {CanVeto}
    useEffect(function() -- Line: 115 -- upvalues: u36 (val), CanVeto (val)
        u36(not CanVeto)
    end, v11)
    v11 = {u43, u35, CanVeto}
    useEffect(function() -- Line: 119 -- upvalues: u43 (val), u35 (val), CanVeto (val), u36 (val)
        if u43 == 0 and u35 ~= false and CanVeto then
            u36(false)
        end
    end, v11)
    v11 = {u77, u58}
    useEffect(function() -- Line: 125 -- upvalues: u77 (val), u58 (val), u78 (val)
        if u77 ~= u58 then
            u78(u58)
        end
    end, v11)
    local v12, u119 = useState(GameState.GetState():expect())
    local v13 = {v12}
    useEvent(GameState.Updated, function(a1) -- Line: 133 -- upvalues: u119 (val)
        u119(a1)
    end, v13)
    local v14 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = v5 and (Hotbar or Empty),
    }
    v13 = {}
    if not v4 then
        v1 = nil
    else
        v1 = createElement
        v2 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Active = true,
            Modal = true,
        }

        v2[React.Event.Activated] = function() -- Line: 150 -- upvalues: IntermissionStore (upval)
            IntermissionStore.setMapOverrideVisible(false)
        end

        v1 = v1("ImageButton", v2)
    end
    v13.inputSink = v1
    v13.mapOverride = createElement(MapOverride, {
        OnClick = function(a1) -- Line: 156 -- upvalues: u63 (val), u71 (val), IntermissionStore (upval) -- types: a1: string
            if u63 and u71 then
                return
            end
            IntermissionStore.OverrideMap:Fire(a1)
        end,
        Categories = u207,
        Maps = u169,
        IsPrivateServer = v12.IsPrivateServer,
        Visible = v4,
    })
    v13.buttons = createElement(IntermissionButtons, {
        IsPvp = u63,
        IsRanked = u71,
        ReadyPlayers = v6,
        TotalPlayers = v7,
        VetoPlayers = u43,
        TotalVetoPlayers = v9,
        Size = UDim2.fromOffset(600, 100),
        Position = (useMediaQuery("large", true)):map(function(a1) -- Line: 176
            return not a1 and UDim2.new(0.5, 0, 1, -60) or UDim2.new(0.5, 0, 1, -120)
        end),
        AnchorPoint = Vector2.new(0.5, 1),
        ReadyDisabled = u77,
        VetoDisabled = u35,
        OnInventoryClick = function() -- Line: 183 -- upvalues: IntermissionStore (upval)
            IntermissionStore.LoadInventory:Fire()
        end,
        OnReadyClick = function() -- Line: 186 -- upvalues: IntermissionStore (upval)
            IntermissionStore.setIsReady(true)
            IntermissionStore.Ready:Fire()
        end,
        OnVetoClick = function() -- Line: 190 -- upvalues: u36 (val), IntermissionStore (upval)
            u36(true)
            IntermissionStore.Veto:Fire()
        end,
    })
    v2 = {
        TimeLeft = v10,
        TimeLeftConverted = v10:map(convertTime),
        StatusText = if not u63 then "Vote For A Map" else if not VotingForMap then "Equip Your Towers" else "Vote For A Map",
        ArenaText = PVPArena,
        IsPVP = u63,
        IsRanked = u71,
    }
    local v15 = if not v3 then UDim2.fromScale(0.5, 0) else UDim2.new(0.5, 0, 0, -GuiInset.Y + 8)
    v2.Position = v15
    v13.top = createElement(IntermissionTopBar, v2)
    return createElement("Frame", v14, v13)
end