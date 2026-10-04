-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles
-- Decompile time: 2.69 ms

local v1
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local UIParticle = require(ReplicatedStorage.Shared.UI.Components.UIParticle)
local u22 = {}
for i, v in ipairs(script:WaitForChild("Effects"):GetDescendants()) do
    if v:IsA("ModuleScript") then
        v1 = v.Name:lower()
        u22[v1] = (require(v))
    end
end
local u42 = {}
u42.__index = u42

function u42.new(a1, a2, a3, a4) -- Line: 18
    -- upvalues: u42 (val)
    local PrimaryPart
    local v1 = false
    if not a1:IsA("Model") then
        if a1:IsA("GuiObject") then
            v1 = true
        elseif not a1:IsA("BasePart") then
            assert(false, "Adornee must be a BasePart or Model!")
        end
        PrimaryPart = a1
    elseif a1.PrimaryPart then
        PrimaryPart = a1.PrimaryPart
    else
        if a1:IsA("GuiObject") then
            v1 = true
        elseif not a1:IsA("BasePart") then
            assert(false, "Adornee must be a BasePart or Model!")
        end
        PrimaryPart = a1
    end
    local v2 = {
        enabled = true,
        _is2D = v1,
        _emitters = {},
        _animate2D = a3 == true,
        _scale = a4 or 1,
        effect = a2,
        adornee = PrimaryPart,
    }
    local v3 = setmetatable(v2, u42)
    v3:init()
    return v3
end

function u42:Destroy() -- Line: 45
    self:Disable()
    for i in self._emitters do
        i:Destroy()
    end
    table.clear(self._emitters)
    setmetatable(self, nil)
end

function u42:init() -- Line: 56 -- upvalues: u22 (val), UIParticle (val), CollectionService (val)
    local v1
    local effect = self.effect
    local v2 = assert(u22[effect:lower()], "Particle effect " .. effect .. " does not exist!")
    if not self._is2D then
        local v3
        for i, v in ipairs(self.adornee:GetChildren()) do
            if CollectionService:HasTag(v, "RICHTEXT_PARTICLE") then
                v:Destroy()
            end
        end
        for i2, i3 in ipairs(v2) do
            v3 = i3:Clone()
            CollectionService:AddTag(v3, "RICHTEXT_PARTICLE")
            v3.Parent = self.adornee
        end
        return
    end
    local _animate2D = self._animate2D
    local v4 = nil
    local v5 = nil
    local v6 = self
    for j, k in v2, v4, v5 do
        if k:IsA("ParticleEmitter") then
            v1 = UIParticle.fromEmitter3D(v6.adornee, k, v6._scale, _animate2D)
            v1.Enabled = _animate2D
            if not _animate2D then
                v1.Enabled = false
                v1:Step(2)
            end
            v6._emitters[v1] = true
        end
    end
end

function u42.Update(a1, a2) -- Line: 95 -- types: a1: table, a2: number
    if not a1._is2D then
        return
    end
    for i in a1._emitters do
        if i.Enabled then
            i:Step(a2)
        else
            i:Clear()
            i:Step(2)
        end
    end
end

function u42.Enable(a1) -- Line: 110 -- upvalues: CollectionService (val)
    if a1.enabled then
        return
    end
    a1.enabled = true
    if a1._is2D then
        if not a1._animate2D then
            return
        end
        for i2 in a1._emitters do
            i2.Enabled = true
        end
        return
    end
    for i, v in ipairs(a1.adornee:GetChildren()) do
        if CollectionService:HasTag(v, "RICHTEXT_PARTICLE") and v:IsA("ParticleEmitter") then
            v.Enabled = true
        end
    end
end

function u42:Disable() -- Line: 137 -- upvalues: CollectionService (val)
    if not self.enabled then
        return
    end
    self.enabled = false
    if self._is2D then
        if not self._animate2D then
            return
        end
        for i2 in self._emitters do
            i2.Enabled = false
        end
        return
    end
    for i, v in ipairs(self.adornee:GetChildren()) do
        if CollectionService:HasTag(v, "RICHTEXT_PARTICLE") and v:IsA("ParticleEmitter") then
            v.Enabled = false
        end
    end
end

function u42:Clear() -- Line: 164
    for i in self._emitters do
        i:Clear()
    end
end

return (setmetatable({}, {
    __call = function(a1, ...) -- Line: 171 -- upvalues: u42 (val)
        return u42.new(...)
    end,
}))