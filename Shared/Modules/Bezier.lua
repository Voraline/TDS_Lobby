-- Script path: ReplicatedStorage.Shared.Modules.Bezier
-- Decompile time: 4.32 ms

local u0 = {}
u0.__index = u0

function u0.new(...) -- Line: 111 -- upvalues: u0 (val)
    local u129 = {}
    u129[1] = ...
    assert(#u129 >= 3, "Must have at least 3 points")
    local v1 = #u129 == 3
    local v2 = #u129 == 4
    local v3 = {}
    local new = Vector3.new
    local lerp = (new()).lerp
    local u165 = nil
    local u110 = {}
    local u116 = 0
    local u114 = nil

    local function CreatePoint(a1) -- Line: 134 -- upvalues: new (val), lerp (val)
        return {
            a1.X,
            a1.Y,
            a1.Z,
            ToVector3 = function(self) -- Line: 137 -- upvalues: new (upval)
                return (new(self[1], self[2], self[3]))
            end,
            lerp = function(self, a2, a3) -- Line: 140 -- upvalues: lerp (upval)
                return lerp(self:ToVector3(), a2:ToVector3(), a3)
            end,
        }
    end

    if not v1 and not v2 then
        local v4, v5, v6, v7, v8, v9
        local v10 = #u129 - 1
        for i = 1, v10 do
            v4 = CreatePoint(u129[i])
            v6 = {v4, CreatePoint(u129[i + 1]), (CreatePoint(v4))}
            u110[#u110 + 1] = v6
        end
        v10 = u110
        for j = #u110, 2, -1 do
            v5 = {}
            v6 = j - 1
            for k = 1, v6 do
                v7 = v10[k]
                v8 = v10[k + 1]
                v9 = {v7[3], v8[3], (CreatePoint(v7[3]))}
                v5[k] = v9
                u110[#u110 + 1] = v9
            end
            v10 = v5
        end
        u114 = v10[1]
        u116 = #u110
    end
    if v1 then
        local u130 = u129[1]
        local u131 = u129[2]
        local u132 = u129[3]

        function v3.Get(a1, a2, a3) -- Line: 180 -- upvalues: u130 (val), u131 (val), u132 (val)
            if a3 then
                a2 = if not (a2 < 0) then if not (a2 > 1) then a2 else 1 else 0
            end
            return (1 - a2) * (1 - a2) * u130 + 2 * (1 - a2) * a2 * u131 + a2 * a2 * u132
        end
    elseif not v2 then
        function v3.Get(a1, a2, a3) -- Line: 200 -- upvalues: u116 (ref), u110 (val), u114 (ref)
            local X, Y, Z, v1, v2, v3
            if a3 then
                a2 = if not (a2 < 0) then if not (a2 > 1) then a2 else 1 else 0
            end
            local v4 = u116
            for i = 1, v4 do
                v1 = u110[i]
                v2 = v1[1]:lerp(v1[2], a2)
                v3 = v1[3]
                X = v2.X
                Y = v2.Y
                Z = v2.Z
                v3[1] = X
                v3[2] = Y
                v3[3] = Z
            end
            return u114[3]:ToVector3()
        end
    else
        local u148 = u129[1]
        local u149 = u129[2]
        local u150 = u129[3]
        local u151 = u129[4]

        function v3.Get(a1, a2, a3) -- Line: 190 -- upvalues: u148 (val), u149 (val), u150 (val), u151 (val)
            if a3 then
                a2 = if not (a2 < 0) then if not (a2 > 1) then a2 else 1 else 0
            end
            return (1 - a2) * (1 - a2) * (1 - a2) * u148 + 3 * (1 - a2) * (1 - a2) * a2 * u149 + 3 * (1 - a2) * a2 * a2 * u150 + a2 * a2 * a2 * u151
        end
    end

    function v3:GetLength(a2) -- Line: 216 -- upvalues: u165 (ref)
        if not u165 then
            local Path = self:GetPath(a2 or 0.1)
            local v1 = 0
            local v2 = #Path
            for i = 2, v2 do
                v1 = v1 + (Path[i - 1] - Path[i]).Magnitude
            end
            u165 = v1
        end
        return u165
    end

    function v3:GetPath(a2) -- Line: 231
        assert(type(a2) == "number", "Must provide a step increment")
        local v1 = false
        if a2 > 0 then
            v1 = a2 < 1
        end
        assert(v1, "Step out of domain; should be between 0 and 1 (exclusive)")
        local v2 = {}
        v1 = 0
        local v3 = a2
        for i = 0, 1, v3 do
            v1 = i
            v2[#v2 + 1] = (self:Get(i))
        end
        if v1 < 1 then
            local v4 = 1 - v1 < a2 * 0.5
            local v5 = #v2
            v3 = v5 + (if not v4 then 1 else 0)
            v2[v3] = (self:Get(1))
        end
        return v2
    end

    function v3:GetPathByNumberSegments(a2) -- Line: 249
        assert(type(a2) == "number", "Must provide number of segments")
        assert(a2 > 0, "Number of segments must be greater than 0")
        return self:GetPath(1 / a2)
    end

    function v3.GetPathBySegmentLength(a1, a2) -- Line: 255
        assert(type(a2) == "number", "Must provide a segment length")
        assert(a2 > 0, "Segment length must be greater than 0")
        return a1:GetPathByNumberSegments((math.floor((a1:GetLength()) / a2 + 0.5)))
    end

    function v3.GetPoints(a1) -- Line: 264 -- upvalues: u129 (val)
        return u129
    end

    return (setmetatable(v3, u0))
end

return u0