-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useInGameTowers
-- Decompile time: 2.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local TowerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TowerStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local TowerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
local useEffect = React.useEffect
local useState = React.useState
local u30 = {
    DisplayName = true,
    GoldenPerks = true,
    Name = true,
    OwnerId = true,
    OwnerName = true,
    Skin = true,
    Team = true,
    Type = true,
    UID = true,
}

local function shouldUpdateForField(a1, a2) -- Line: 26 -- upvalues: u30 (val) -- types: a1: string, a2: table?
    local v1 = false
    if a2 ~= nil then
        v1 = true
        if u30[a1] ~= true then
            v1 = a2[a1] == true
        end
    end
    return v1
end

local function cloneTowers() -- Line: 31 -- upvalues: TowerReplicator (val)
    return table.clone(TowerReplicator.getTowers())
end

local function shouldUpdateForNestedField(a1, a2) -- Line: 35 -- types: a2: string
    local v1 = true
    if a1 ~= true then
        v1 = false
        if typeof(a1) == "table" then
            v1 = a1[a2] == true
        end
    end
    return v1
end

return function(a1) -- Line: 39
    -- upvalues: useState (val), cloneTowers (val), useEffect (val), Maid (val), u30 (val), TowerStore (val)
    -- upvalues: TowerReplicator (val)
    local v1, u4 = useState(cloneTowers)
    local v2 = {a1}
    useEffect(function() -- Line: 42
        -- upvalues: Maid (upval), u4 (val), cloneTowers (upval), a1 (val), u30 (upval), TowerStore (upval)
        -- upvalues: TowerReplicator (upval)
        local u2 = Maid.new()
        local u3 = {}

        local function updateTowers() -- Line: 46 -- upvalues: u4 (upval), cloneTowers (upval)
            u4(cloneTowers())
        end

        local function untrackTower(a1) -- Line: 50 -- upvalues: u3 (val)
            local v1 = u3[a1]
            if not v1 then
                return
            end
            v1:Sweep()
            u3[a1] = nil
        end

        local function trackTower(a1_2) -- Line: 60
            -- upvalues: u3 (val), Maid (upval), a1 (upval), u30 (upval), u4 (upval), cloneTowers (upval)
            if a1_2 and not u3[a1_2] then
                local v1 = Maid.new()
                u3[a1_2] = v1
                if a1 and a1_2.Replicator and a1_2.Replicator.Changed then
                    v1:Mark((a1_2.Replicator.Changed:Connect(function(a1_2) -- Line: 69 -- upvalues: a1 (upval), u30 (upval), u4 (upval), cloneTowers (upval)
                        local v1 = a1
                        local v2 = false
                        if v1 ~= nil then
                            v2 = true
                            if u30[a1_2] ~= true then
                                v2 = v1[a1_2] == true
                            end
                        end
                        if v2 then
                            u4(cloneTowers())
                        end
                    end)))
                end
                if a1 and a1.Attributes and a1_2.Attributes then
                    v1:Mark((a1_2.Attributes.Changed:Connect(function(a1_2) -- Line: 77 -- upvalues: a1 (upval), u4 (upval), cloneTowers (upval)
                        local Attributes = a1.Attributes
                        local v1 = true
                        if Attributes ~= true then
                            v1 = false
                            if typeof(Attributes) == "table" then
                                v1 = Attributes[a1_2] == true
                            end
                        end
                        if v1 then
                            u4(cloneTowers())
                        end
                    end)))
                end
                if a1 and a1.StatusEffects and a1_2.StatusEffectRenderer then
                    local u40 = {}
                    v1:Mark((a1_2.StatusEffectRenderer.Changed:Connect(function(a1_2, a2) -- Line: 92 -- upvalues: a1 (upval), u40 (val), u4 (upval), cloneTowers (upval)
                        local StatusEffects = a1.StatusEffects
                        local v1 = true
                        if StatusEffects ~= true then
                            v1 = false
                            if typeof(StatusEffects) == "table" then
                                v1 = StatusEffects[a1_2] == true
                            end
                        end
                        if not v1 or u40[a1_2] == a2 then
                            return
                        end
                        u40[a1_2] = a2
                        u4(cloneTowers())
                    end)))
                end
                return
            end
        end

        u2:Mark((TowerStore.TowerAdded:Connect(function(a1) -- Line: 113 -- upvalues: trackTower (val), u4 (upval), cloneTowers (upval)
            trackTower(a1)
            u4(cloneTowers())
        end)))
        u2:Mark((TowerStore.TowerRemoved:Connect(function(a1) -- Line: 118 -- upvalues: u3 (val), u4 (upval), cloneTowers (upval)
            local v1 = u3[a1]
            if v1 then
                v1:Sweep()
                u3[a1] = nil
            end
            u4(cloneTowers())
        end)))
        for i, j in TowerReplicator.getTowers() do
            trackTower(j)
        end
        u4(cloneTowers())
        return function() -- Line: 129 -- upvalues: u3 (val), u2 (val)
            local v1
            for i in u3 do
                v1 = u3[i]
                if v1 then
                    v1:Sweep()
                    u3[i] = nil
                end
            end
            u2:Sweep()
        end
    end, v2)
    return v1
end