-- Script path: ReplicatedStorage.Shared.Modules.CatRom.Spline
-- Decompile time: 4.80 ms

local GaussLegendre = require(script.Parent.GaussLegendre)
local Squad = require(script.Parent.Squad)
local u10 = {}
u10.__index = u10

function u10.new(a1, a2, a3, a4, a5, a6) -- Line: 11 -- upvalues: u10 (val)
    local v1 = a1[1]
    local v2 = a2[1]
    local v3 = a3[1]
    local v4 = a4[1]
    local v5 = v2 - v1
    local v6 = v3 - v2
    local v7 = v4 - v3
    local v8 = v5.Magnitude ^ a5 + 0
    local v9 = v6.Magnitude ^ a5 + v8
    local v10 = v7.Magnitude ^ a5 + v9
    local v11 = (1 - a6) * (v9 - v8)
    local v12 = v11 * (v5 / (v8 - 0) - (v3 - v1) / (v9 - 0) + v6 / (v9 - v8))
    local v13 = v11 * (v6 / (v9 - v8) - (v4 - v2) / (v10 - v8) + v7 / (v10 - v9))
    local v14 = 2 * -v6 + v12 + v13
    local v15 = 3 * v6 - 2 * v12 - v13
    local v16 = {
        rot0 = a1[2],
        rot1 = a2[2],
        rot2 = a3[2],
        rot3 = a4[2],
        a = v14,
        b = v15,
        c = v12,
        d = v2,
    }
    local v17 = setmetatable(v16, u10)
    v17.length = v17:SolveLength()
    return v17
end

function u10.fromPoint(a1) -- Line: 60 -- upvalues: u10 (val)
    local v1 = a1[1] * 0
    return (setmetatable({
        length = 0,
        rot0 = a1[2],
        a = v1,
        b = v1,
        c = v1,
        d = a1[1],
    }, u10))
end

function u10.fromLine(a1, a2, a3, a4) -- Line: 78 -- upvalues: u10 (val)
    local v1 = a2[1]
    local v2 = v1 * 0
    local v3 = a3[1] - v1
    return (setmetatable({
        rot0 = a1[2],
        rot1 = a2[2],
        rot2 = a3[2],
        rot3 = a4[2],
        length = v3.Magnitude,
        a = v2,
        b = v2,
        c = v3,
        d = v1,
    }, u10))
end

function u10:SolvePosition(a2) -- Line: 101 -- types: self: table, a2: number
    return self.d + a2 * (self.c + a2 * (self.b + a2 * self.a))
end

function u10:SolveVelocity(a2) -- Line: 106 -- types: self: table, a2: number
    return self.c + a2 * (2 * self.b + a2 * 3 * self.a)
end

function u10:SolveAcceleration(a2) -- Line: 111 -- types: self: table, a2: number
    return 6 * self.a * a2 + 2 * self.b
end

function u10:SolveTangent(a2) -- Line: 116 -- types: self: table, a2: number
    return self:SolveVelocity(a2).Unit
end

function u10:SolveNormal(a2) -- Line: 121 -- types: self: table, a2: number
    local v1 = self:SolveVelocity(a2)
    local v2 = self:SolveAcceleration(a2)
    return (v2 * v1.Magnitude ^ 2 - v1 * v2:Dot(v1)).Unit
end

function u10:SolveBinormal(a2) -- Line: 132 -- types: self: table, a2: number
    return (self:SolveTangent(a2)):Cross((self:SolveNormal(a2)))
end

function u10:SolveCurvature(a2) -- Line: 137 -- types: self: table, a2: number
    local v1 = self:SolveVelocity(a2)
    local v2 = self:SolveAcceleration(a2)
    local Magnitude = v1.Magnitude
    local v3 = v2 / Magnitude - v1 * v1:Dot(v2) / Magnitude ^ 3
    return v3.Magnitude / Magnitude, v3.Unit
end

function u10:SolveCFrame(a2) -- Line: 150 -- types: self: table, a2: number
    local v1 = self:SolvePosition(a2)
    local v2 = self:SolveVelocity(a2)
    if v2.Magnitude ~= 0 then
        return CFrame.lookAt(v1, v1 + v2)
    end
    local rot0 = self.rot0
    if rot0 then
        return CFrame.new(v1.X, v1.Y, v1.Z, rot0[2], rot0[3], rot0[4], rot0[1])
    end
    return CFrame.new(v1)
end

function u10:SolveRotCFrame(a2) -- Line: 166 -- upvalues: Squad (val) -- types: self: table, a2: number
    local rot0 = self.rot0
    if not rot0 then
        return self:SolveCFrame(a2)
    end
    local rot1 = self.rot1
    if not rot1 then
        return self:SolveCFrame(a2)
    end
    local v1 = self:SolvePosition(a2)
    local v2, v3, v4, v5 = Squad(rot0, rot1, self.rot2, self.rot3, a2)
    return CFrame.new(v1.X, v1.Y, v1.Z, v3, v4, v5, v2)
end

function u10:SolveLength(a2, a3) -- Line: 182
    -- upvalues: GaussLegendre (val)
    local v1 = a2 or 0
    local v2 = a3 or 1
    if v1 == 0 and v2 == 1 and self.length then
        return self.length
    end
    return GaussLegendre.Ten(function(a1) -- Line: 190 -- upvalues: self (val)
        return self:SolveVelocity(a1).Magnitude
    end, v1, v2)
end

function u10:Reparameterize(a2) -- Line: 197 -- types: self: table, a2: number
    if a2 ~= 0 and a2 ~= 1 then
        if self.length == 0 then
            return 0
        end
        local arcLengthParams = self.arcLengthParams
        if not arcLengthParams then
            return self:_ReparameterizeHybrid(a2)
        end
        local v1 = #self.arcLengthParams - 1
        local v2 = math.floor(a2 * v1) + 1
        local v3 = a2 * v1 - v2 + 1
        return arcLengthParams[v2] * (1 - v3) + arcLengthParams[v2 + 1] * v3
    end
    return a2
end

function u10:_ReparameterizeHybrid(a2) -- Line: 218 -- upvalues: GaussLegendre (val) -- types: self: table, a2: number
    if a2 ~= 0 and a2 ~= 1 then
        local v1, v2
        if self.length == 0 then
            return 0
        end

        local function v3(a1) -- Line: 227 -- upvalues: self (val)
            return self:SolveVelocity(a1).Magnitude
        end

        local v4 = a2
        local v5 = 0
        local v6 = 1
        for i = 1, 16 do
            v2 = (GaussLegendre.Ten(v3, 0, v4)) / self.length - a2
            if (math.abs(v2)) < 0.0001 then
                return v4
            end
            v1 = v4 - v2 / (self:SolveVelocity(v4).Magnitude / self.length)
            v4 = if not (v2 > 0) then v6 <= v1 and (v6 + v4) / 2 or v1 else v1 <= v5 and (v4 + v5) / 2 or v1
        end
        warn("Failed to reparameterize; falling back to input")
        return a2
    end
    return a2
end

function u10._PrecomputeArcLengthParams(a1, a2) -- Line: 262 -- types: a1: table, a2: number
    local v1
    if a1.length == 0 then
        return
    end
    local v2 = table.create(a2 + 1)
    v2[1] = 0
    v2[a2 + 1] = 1
    for i = 2, a2 do
        v1 = (i - 1) / a2
        v2[i] = (a1:_ReparameterizeHybrid(v1))
    end
    a1.arcLengthParamsLUT = v2
end

function u10.SolveUniformPosition(a1, a2) -- Line: 277 -- types: a1: table, a2: number
    return a1:SolvePosition((a1:Reparameterize(a2)))
end

function u10.SolveUniformVelocity(a1, a2) -- Line: 280 -- types: a1: table, a2: number
    return a1:SolveVelocity((a1:Reparameterize(a2)))
end

function u10.SolveUniformAcceleration(a1, a2) -- Line: 283 -- types: a1: table, a2: number
    return a1:SolveAcceleration((a1:Reparameterize(a2)))
end

function u10.SolveUniformTangent(a1, a2) -- Line: 286 -- types: a1: table, a2: number
    return a1:SolveTangent((a1:Reparameterize(a2)))
end

function u10.SolveUniformNormal(a1, a2) -- Line: 289 -- types: a1: table, a2: number
    return a1:SolveNormal((a1:Reparameterize(a2)))
end

function u10.SolveUniformBinormal(a1, a2) -- Line: 292 -- types: a1: table, a2: number
    return a1:SolveBinormal((a1:Reparameterize(a2)))
end

function u10.SolveUniformCurvature(a1, a2) -- Line: 295 -- types: a1: table, a2: number
    return a1:SolveCurvature((a1:Reparameterize(a2)))
end

function u10.SolveUniformCFrame(a1, a2) -- Line: 298 -- types: a1: table, a2: number
    return a1:SolveCFrame((a1:Reparameterize(a2)))
end

function u10.SolveUniformRotCFrame(a1, a2) -- Line: 301 -- types: a1: table, a2: number
    return a1:SolveRotCFrame((a1:Reparameterize(a2)))
end

function u10.SolveUniformLength(a1, a2, a3) -- Line: 304 -- types: a1: table, a2: number?, a3: number?
    return a1:SolveLength(a1:Reparameterize(a2), (a1:Reparameterize(a3)))
end

return u10