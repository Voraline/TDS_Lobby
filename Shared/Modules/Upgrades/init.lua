-- Script path: ReplicatedStorage.Shared.Modules.Upgrades
-- Decompile time: 5.16 ms

local resolveInstances
local v1 = {}
local u9 = {
    tower = require(script.TowerUpgradeMiddleware),
    unit = require(script.UnitUpgradeMiddleware),
}

function resolveInstances(a1, a2, a3) -- Line: 39
    -- upvalues: resolveInstances (val)
    local v1 = a3 or {}
    local v2 = string.split(a2, ".")
    local v3 = table.remove(v2, 1)
    local v4 = table.concat(v2, ".")
    for i, j in a1:GetChildren() do
        if j.Name == v3 then
            if not (#v2 > 0) then
                table.insert(v1, j)
            else
                resolveInstances(j, v4, v1)
            end
        end
    end
    return v1
end

function v1.upgrade(a1, a2, a3) -- Line: 62
    -- upvalues: u9 (val), resolveInstances (val)
    local v1, v2, v3, v4, v5
    local Model = a1.Model
    local UpgradesModule = Model:FindFirstChild("UpgradesModule")
    assert(UpgradesModule, "Could not find \"UpgradesModule\" for " .. (tostring(a1)))
    local v6 = u9[a3]
    if v6 then
        v6:RunHooks(a1, a1.Name, v6.Boundedness.Inbound, a2)
    end
    local Path = a1.Path
    local v7 = if not Path or not (Path > 0) then nil else ("%*%*"):format(a2, (string.char(96 + Path)))
    local Upgrades = Model.Upgrades
    local v8 = v7 and Upgrades:FindFirstChild((tostring(v7))) or Upgrades:FindFirstChild((tostring(a2)))
    local v9 = require(UpgradesModule)
    local Deletions = v9.Deletions or {}
    local Transparency = v9.Transparency or {}
    local Weapons = v9.Weapons or {}
    local v10 = v7 and Transparency[v7] or Transparency[a2]
    local v11 = v7 and Deletions[v7] or Deletions[a2]
    local v12 = v7 and Weapons[v7] or Weapons[a2]
    if not v10 then
        v1, v2 = a1, a2
    else
        v3 = {}
        v4 = nil
        v5 = nil
        v1, v2 = a1, a2
        for i, j in v10, v4, v5 do
            for k, n in resolveInstances(Model, i) do
                if n:IsA("BasePart") or n:IsA("Decal") then
                    n.Transparency = j
                    v3[n] = true
                end
                for m, i5 in n:GetDescendants() do
                    if i5:IsA("BasePart") then
                        if not v3[i5] and not i5:GetAttribute("IgnoreTransparency") then
                            i5.Transparency = j
                            v3[i5] = true
                        end
                    elseif n:IsA("Decal") and not v3[i5] and not i5:GetAttribute("IgnoreTransparency") then
                        i5.Transparency = j
                        v3[i5] = true
                    end
                end
            end
        end
        if v8 then
            for i6, i7 in v8:GetDescendants() do
                if i7:IsA("BasePart") then
                    if not (i7.Transparency < 1) and not v3[i7] and not i7:GetAttribute("IgnoreTransparency") then
                        i7.Transparency = 0
                        v3[i7] = true
                    end
                elseif i7:IsA("Decal")
                    and not (i7.Transparency < 1)
                    and not v3[i7]
                    and not i7:GetAttribute("IgnoreTransparency") then
                    i7.Transparency = 0
                    v3[i7] = true
                end
            end
        end
    end
    if v11 then
        local v13 = nil
        v4 = nil
        for i8 in v11, v13, v4 do
            for i9, i10 in resolveInstances(Model, i8) do
                i10:Destroy()
            end
        end
    end
    if v12 then
        local v14, v15
        v3 = v12
        if type(v3) ~= "table" then
            v3 = {v3}
        end
        local Weapon = Model:FindFirstChild("Weapon")
        v5 = nil
        local v16 = nil
        for i11, i12 in v3, v5, v16 do
            v14 = resolveInstances(Model, i12)[1]
            v15 = v14 and v14.Name:lower() or ""
            if not v14 then
                warn((("Could not find weapon \"%*\" for tower \"%*\""):format(v12, Model.Name)))
            elseif Weapon then
                for i13, i14 in Weapon:GetChildren() do
                    if i14.Name:lower() == v15 then
                        i14:Destroy()
                    end
                end
                v14.Parent = Weapon
            end
        end
    end
    if v8 then
        for i15, i16 in v8:GetDescendants() do
            if i16:IsA("ParticleEmitter") or i16:IsA("Beam") or i16:IsA("Light") or i16:IsA("Trail") then
                i16.Enabled = true
            end
        end
    end
    if v6 then
        v6:RunHooks(v1, v1.Name, v6.Boundedness.Outbound, v2)
    end
end

return v1