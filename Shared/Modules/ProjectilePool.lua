-- Script path: ReplicatedStorage.Shared.Modules.ProjectilePool
-- Decompile time: 3.12 ms

local function getStorageParent() -- Line: 15
    return workspace.CurrentCamera or workspace
end

local u1 = {}
u1.__index = u1
local u2 = {}

local function applyProjectilePartDefaults(a1) -- Line: 48 -- types: a1: userdata
    a1.Anchored = true
    a1.CanCollide = false
    a1.CanQuery = false
    a1.CanTouch = false
    a1.CastShadow = false
end

local function prepareClone(a1) -- Line: 57 -- types: a1: userdata
    local v1 = a1:Clone()
    v1.Anchored = true
    v1.CanCollide = false
    v1.CanQuery = false
    v1.CanTouch = false
    v1.CastShadow = false
    local v2 = {parts = {{part = v1, transparency = v1.Transparency}}}
    v2.trails = {}
    v2.effects = {}
    for i, j in v1:GetDescendants() do
        if j:IsA("Weld") or j:IsA("WeldConstraint") then
            j:Destroy()
        elseif j:IsA("BasePart") then
            j.Anchored = true
            j.CanCollide = false
            j.CanQuery = false
            j.CanTouch = false
            j.CastShadow = false
            table.insert(v2.parts, {part = j, transparency = j.Transparency})
        elseif j:IsA("Trail") then
            j.Enabled = false
            table.insert(v2.trails, j)
            table.insert(v2.effects, j)
        elseif j:IsA("ParticleEmitter") or j:IsA("Beam") then
            j.Enabled = false
            table.insert(v2.effects, j)
        end
    end
    return v1, v2
end

local function setEffectsEnabled(a1, a2) -- Line: 87 -- types: a1: table, a2: boolean
    for i, j in a1.effects do
        j.Enabled = a2
    end
end

local function showPart(a1) -- Line: 93 -- types: a1: table
    for i, j in a1.parts do
        j.part.Transparency = j.transparency
    end
end

local function hidePart(a1) -- Line: 99 -- types: a1: table
    for i, j in a1.effects do
        j.Enabled = false
    end
    for k, n in a1.parts do
        n.part.Transparency = 1
    end
end

function u1.take(a1) -- Line: 106 -- upvalues: prepareClone (val)
    local v1
    if not (#a1._available > 0) then
        local v2, v3 = prepareClone(a1._template)
        a1._data[v2] = v3
    else
        v1 = table.remove(a1._available)
    end
    local v4 = a1._data[v1]
    for i, j in v4.parts do
        j.part.Transparency = j.transparency
    end
    local CurrentCamera = workspace.CurrentCamera or workspace
    v1.Parent = CurrentCamera
    for k, n in v4.trails do
        n.Enabled = true
    end
    return v1
end

function u1.enableEffects(a1, a2) -- Line: 128 -- types: a1: table, a2: userdata
    local v1 = a1._data[a2]
    if not v1 then
        return
    end
    for i, j in v1.effects do
        j.Enabled = true
    end
end

function u1:hide(a2) -- Line: 137 -- types: self: table, a2: userdata
    local v1 = self._data[a2]
    if not v1 then
        a2.Transparency = 1
        return
    end
    for i, j in v1.effects do
        j.Enabled = false
    end
    for k, n in v1.parts do
        n.part.Transparency = 1
    end
end

function u1.release(a1, a2) -- Line: 147 -- types: a1: table, a2: userdata
    a1:hide(a2)
    a2.Parent = nil
    table.insert(a1._available, a2)
end

return {
    get = function(a1, a2) -- Line: 157 -- upvalues: u2 (val), u1 (val), prepareClone (val) -- types: a1: userdata, a2: number?
        local v1, v2
        if u2[a1] then
            return u2[a1]
        end
        local v3 = {_size = 0, _template = a1, _available = {}, _data = {}}
        local v4 = setmetatable(v3, u1)
        v3 = a2 or 4
        for i = 1, v3 do
            v1, v2 = prepareClone(a1)
            v4._data[v1] = v2
            for j, k in v2.effects do
                k.Enabled = false
            end
            for n, m in v2.parts do
                m.part.Transparency = 1
            end
            v1.Parent = nil
            table.insert(v4._available, v1)
        end
        v4._size = v3
        u2[a1] = v4
        return v4
    end,
}