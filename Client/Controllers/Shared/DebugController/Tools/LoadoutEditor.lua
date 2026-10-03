-- Script path: ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.LoadoutEditor
-- Decompile time: 3.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage.Client.Modules
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local PlayerReplicator = require(Modules.Replicators.PlayerReplicator)
require(script.Parent.Types)
local u21 = nil
local u22 = nil
local u23 = {Name = "Loadout Editor"}

local function runCommand(a1) -- Line: 16 -- upvalues: u23 (val), ReplicatedStorage (val) -- types: a1: string
    task.spawn(function() -- Line: 17 -- upvalues: u23 (upval), ReplicatedStorage (upval), a1 (val)
        if not u23._cmdrFunction then
            u23._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
        end
        u23._cmdrFunction:InvokeServer(a1)
    end)
end

function u23.canRun() -- Line: 27
    return workspace:FindFirstChild("Type").Value == "Game"
end

function u23.createWindows() -- Line: 31 -- upvalues: u22 (ref), u23 (val), ReplicatedStorage (val)
    u22.Window({
        [u22.Args.Window.Title] = "Loadout Editor",
        [u22.Args.Window.NoClose] = true,
    }, {
        size = u22.State(Vector2.new(400, 200)),
        position = u22.State(Vector2.new(600, 450)),
    })
    local v1 = u23._type:get()
    local v2 = if v1 ~= "Towers" then "consumable" else "tower"
    local _searchTowers = if v1 ~= "Towers" then u23._searchConsumables or u23._consumables else u23._searchTowers or u23._towers or u23._searchConsumables or u23._consumables
    local v3 = (not (v1 ~= "Towers") and u23._equippedTowers or u23._equippedConsumables):get()
    u22.ComboArray({"Loadout"}, {index = u23._type}, {"Towers", "Consumables"})
    u22.Text("Equipped Loadout")
    u22.SameLine()
    for i, j in v3 do
        if u22.Button({j}).clicked() then
            local u151 = ("unequip_%* %*"):format(v2, j)
            task.spawn(function() -- Line: 17 -- upvalues: u23 (upval), ReplicatedStorage (upval), u151 (val)
                if not u23._cmdrFunction then
                    u23._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
                end
                u23._cmdrFunction:InvokeServer(u151)
            end)
        end
    end
    u22.End()
    u22.Text((("All %*"):format(v1)))
    u22.InputText({"Search"}, {text = u23._search})
    for k, n in _searchTowers do
        if u22.Button({n, UDim2.fromScale(1, 0)}).clicked() then
            local u134 = ("equip_%* %*"):format(v2, n)
            task.spawn(function() -- Line: 17 -- upvalues: u23 (upval), ReplicatedStorage (upval), u134 (val)
                if not u23._cmdrFunction then
                    u23._cmdrFunction = (ReplicatedStorage:WaitForChild("CmdrClient")):WaitForChild("CmdrFunction")
                end
                u23._cmdrFunction:InvokeServer(u134)
            end)
        end
    end
    u22.End()
end

function u23.init() -- Line: 78 -- upvalues: u22 (ref), u23 (val), u21 (ref), PlayerReplicator (val), Content (val)
    local v1
    u22 = u23.Iris
    u21 = PlayerReplicator.GetLocalPlayer():expect()
    local Replicator = u21.Replicator
    u23._type = u22.State("Towers")
    u23._search = u22.State("")
    u23._towers = {}
    u23._consumables = {}
    u23._searchTowers = nil
    u23._searchConsumables = nil
    u23._equippedTowers = u22.State(u21.EquippedTowers or {})
    u23._equippedConsumables = u22.State(u21.EquippedConsumables or {})
    ;(Replicator:GetStateChangedSignal("EquippedTowers")):Connect(function(a1) -- Line: 96 -- upvalues: u23 (upval)
        u23._equippedTowers:set(a1)
    end)
    ;(Replicator:GetStateChangedSignal("EquippedConsumables")):Connect(function(a1) -- Line: 100 -- upvalues: u23 (upval)
        u23._equippedConsumables:set(a1)
    end)

    local function applySearch(a1) -- Line: 104 -- upvalues: u23 (upval) -- types: a1: string
        if not a1 then
            a1 = u23._search:get()
        end
        if a1 == "" then
            u23._searchTowers = nil
            u23._searchConsumables = nil
            return
        end
        local v1 = {}
        local v2 = {}
        for i, j in u23._towers do
            if (j:lower()):find((a1:lower())) then
                table.insert(v1, j)
            end
        end
        for k, n in u23._consumables do
            if (n:lower()):find((a1:lower())) then
                table.insert(v2, n)
            end
        end
        table.sort(v1, function(a1, a2) -- Line: 131
            return a1 < a2
        end)
        table.sort(v2, function(a1, a2) -- Line: 135
            return a1 < a2
        end)
        u23._searchTowers = v1
        u23._searchConsumables = v2
    end

    u23._search:onChange(applySearch)
    local v2 = {Tower = "_towers", Consumables = "_consumables"}
    local v3 = nil
    local v4 = nil
    for i, j in v2, v3, v4 do
        v1 = Content(i)
        local u86 = {}
        u23[j] = u86
        for k, n in v1:GetChildren() do
            if not table.find(u86, n.Name) then
                table.insert(u86, n.Name)
            end
        end
        v1.ChildAdded:Connect(function(a1) -- Line: 162 -- upvalues: u86 (val), applySearch (val)
            if not table.find(u86, a1.Name) then
                table.insert(u86, a1.Name)
                applySearch()
            end
        end)
    end
end

return u23