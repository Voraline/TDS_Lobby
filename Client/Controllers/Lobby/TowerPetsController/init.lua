-- Script path: ReplicatedStorage.Client.Controllers.Lobby.TowerPetsController
-- Decompile time: 6.17 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Game = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController).Game
local TowerPet = require(script.TowerPet)
local u38 = {}
local u39 = {}
local u40 = {}
local u41 = {}
local u45 = Game:Get("Show Tower Pets")
local u49 = FFlagController.get("tower_pets.enabled", false)
local u50 = true
local u51 = {
    Mortar = true,
    Sniper = true,
    Turret = true,
    Ranger = true,
    Farm = true,
}

local function removePets(a1) -- Line: 29 -- upvalues: u40 (val) -- types: a1: userdata?
    if a1 then
        local v1 = u40[a1]
        if not v1 then
            return
        end
        for m, i5 in v1 do
            i5:Destroy()
        end
        table.clear(v1)
        u40[a1] = nil
        return
    end
    local v2 = nil
    local v3 = nil
    for i, j in u40, v2, v3 do
        for k, n in j do
            n:Destroy()
        end
        table.clear(j)
    end
    table.clear(u40)
end

local u58 = {}

local function renderPets(a1, a2) -- Line: 58
    -- upvalues: u58 (val), u45 (ref), u41 (val), u50 (ref), removePets (val), Promise (val), u40 (val), u39 (val)
    -- upvalues: TowerPet (val)
    local v1 = u58[a1]
    if v1 then
        v1:cancel()
    end
    if u45 and u41[a1] and u50 then
        local u16 = Promise.new(function(a1_2, a2_2, a3) -- Line: 72 -- upvalues: u40 (upval), a2 (val), u39 (upval), a1 (val), TowerPet (upval)
            local v1, v2, v3, v4
            local u111 = false
            local v5 = u40[a2]
            v5 = if not v5 then {} else table.clone(v5)
            a3(function() -- Line: 82 -- upvalues: u111 (ref)
                u111 = true
            end)
            local v6 = u39[a1]
            if not v6 then
                a1_2()
                return
            end
            if not a2:WaitForChild("HumanoidRootPart", 3) then
                a2_2("Character does not have a HumanoidRootPart")
                return
            end
            if u111 then
                return
            end
            for i = #v5, 1, -1 do
                v4 = v5[i]
                v1 = v6[i]
                if not v1 or v1.Tower ~= v4.Tower or v1.Skin ~= v4.Skin then
                    v4:Destroy()
                    v5[i] = nil
                end
            end
            for j, k in v6 do
                if not v5[j] then
                    v2, v3 = TowerPet.fromAsset(a2, k.Tower, k.Skin):await()
                    if v2 then
                        v3.Angle = (j - 0.5) / #v6 * 3.141592653589793
                        v5[j] = v3
                        if u111 then
                            break
                        end
                    else
                        warn((("Error: %*"):format(v3)))
                    end
                else
                    v5[j].Angle = (j - 0.5) / #v6 * 3.141592653589793
                end
            end
            if not u111 then
                u40[a2] = v5
                a1_2()
                return
            end
            for n, m in v5 do
                if m.Model then
                    m:Destroy()
                end
            end
            table.clear(v5)
        end)
        u16:finally(function() -- Line: 150 -- upvalues: u58 (upval), a1 (val), u16 (val)
            if u58[a1] == u16 then
                u58[a1] = nil
            end
        end)
        return u16
    end
    if a2 then
        removePets(a2)
    end
    return Promise.resolve()
end

function u38.IsBlacklisted(a1) -- Line: 159 -- upvalues: u51 (val) -- types: a1: string
    return u51[a1] == true
end

function u38.AddPet(a1, a2, a3) -- Line: 163
    -- upvalues: u38 (val), u39 (val), renderPets (val)
    if u38.IsBlacklisted(a2) then
        return false
    end
    local v1 = u39[a1]
    if not v1 then
        u39[a1] = {}
    end
    local v2 = false
    for i, j in v1 do
        if j.Tower == a2 and j.Skin == a3 then
            v2 = true
            break
        end
    end
    if v2 then
        return false
    end
    table.insert(u39[a1], {Tower = a2, Skin = a3})
    if a1.Character then
        renderPets(a1, a1.Character)
    end
    return true
end

function u38.RemovePet(a1, a2, a3) -- Line: 198
    -- upvalues: u39 (val), renderPets (val)
    local v1
    if not u39[a1] then
        return
    end
    local v2 = false
    local v3, v4 = a2, a3
    for i = #u39[a1], 1, -1 do
        v1 = u39[a1][i]
        if v1.Tower == v3 and v1.Skin == v4 then
            v2 = true
            table.remove(u39[a1], i)
        end
    end
    if v2 and a1.Character then
        renderPets(a1, a1.Character)
    end
    return v2
end

function u38.SetEnabled(a1) -- Line: 222
    -- upvalues: u50 (ref), Players (val), renderPets (val), removePets (val)
    if not a1 then
        removePets()
        return
    end
    for i, j in Players:GetPlayers() do
        if j.Character then
            renderPets(j, j.Character)
        end
    end
end

function u38.ClearPets(a1) -- Line: 236 -- upvalues: u39 (val), renderPets (val) -- types: a1: userdata
    if not u39[a1] then
        return
    end
    u39[a1] = {}
    if a1.Character then
        renderPets(a1, a1.Character)
    end
end

function u38.init() -- Line: 248
    -- upvalues: u49 (val), PlayerReplicator (val), Game (val), u45 (ref), Players (val), renderPets (val)
    -- upvalues: removePets (val), u39 (val), u38 (val), u41 (val)
    if not u49() then
        return
    end
    local v1, v2 = PlayerReplicator.GetLocalPlayer():await()
    if not v1 then
        warn((("Error occured while initializing: failed to get local player\n%*"):format((tostring(v2)))))
        return
    end
    Game:On("Show Tower Pets", function(a1) -- Line: 261 -- upvalues: u45 (upval), Players (upval), renderPets (upval), removePets (upval)
        if u45 == a1 then
            return
        end
        u45 = a1
        if not a1 then
            removePets()
            return
        end
        for i, j in Players:GetPlayers() do
            if j.Character then
                renderPets(j, j.Character)
            end
        end
    end)

    local function onCharacterAdded(a1, a2) -- Line: 279
        -- upvalues: u39 (upval), renderPets (upval), removePets (upval)
        if u39[a1] then
            renderPets(a1, a2)
        end
        a2.Destroying:Once(function() -- Line: 284 -- upvalues: removePets (upval), a2 (val)
            removePets(a2)
        end)
    end

    local function onPlayerAdded(a1) -- Line: 289
        -- upvalues: u39 (upval), renderPets (upval), removePets (upval), u38 (upval), PlayerReplicator (upval)
        -- upvalues: u41 (upval)
        a1.CharacterAdded:Connect(function(a1_2) -- Line: 290 -- upvalues: a1 (val), u39 (upval), renderPets (upval), removePets (upval)
            local v1 = a1
            if u39[v1] then
                renderPets(v1, a1_2)
            end
            a1_2.Destroying:Once(function() -- Line: 284 -- upvalues: removePets (upval), a1_2 (val)
                removePets(a1_2)
            end)
        end)
        if a1.Character then
            local Character = a1.Character
            if u39[a1] then
                renderPets(a1, Character)
            end
            Character.Destroying:Once(function() -- Line: 284 -- upvalues: removePets (upval), Character (val)
                removePets(Character)
            end)
        end

        local function updatePets(a1_2) -- Line: 298
            -- upvalues: u38 (upval), u39 (upval), a1 (val), renderPets (upval)
            local v1
            if type(a1_2) ~= "table" then
                return
            end
            for i = #a1_2, 1, -1 do
                v1 = a1_2[i]
                if u38.IsBlacklisted(v1.Tower) then
                    table.remove(a1_2, i)
                end
            end
            u39[a1] = a1_2
            if a1.Character then
                renderPets(a1, a1.Character)
            end
        end

        ;((PlayerReplicator.WaitForPlayer(a1)):andThen(function(a1_2) -- Line: 318 -- upvalues: u41 (upval), a1 (val), renderPets (upval), updatePets (val)
            local v1 = a1
            u41[v1] = a1_2.Replicator:Get("EquipTowerPets") ~= false
            ;(a1_2.Replicator:GetStateChangedSignal("EquipTowerPets")):Connect(function(a1_2) -- Line: 321 -- upvalues: u41 (upval), a1 (upval), renderPets (upval)
                u41[a1] = a1_2
                if a1.Character then
                    renderPets(a1, a1.Character)
                end
            end)
            ;(a1_2.Replicator:GetStateChangedSignal("Pets")):Connect(updatePets)
            updatePets(a1_2.Replicator:Get("Pets") or {})
        end)):timeout(10)
    end

    for i, j in Players:GetPlayers() do
        task.spawn(onPlayerAdded, j)
    end
    Players.PlayerAdded:Connect(onPlayerAdded)
    Players.PlayerRemoving:Connect(function(a1) -- Line: 340 -- upvalues: u39 (upval), u41 (upval)
        u39[a1] = nil
        u41[a1] = nil
    end)
end

task.spawn(u38.init)
return u38