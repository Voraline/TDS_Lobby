-- Script path: ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.SkillTree.HexTree.HexTile.HexCoordinate
-- Decompile time: 3.15 ms

local u0 = {}
u0.__index = u0
u0.__class = "HexCoordinate"

function u0.new(a1, a2) -- Line: 22 -- upvalues: u0 (val) -- types: a1: number, a2: number
    return (setmetatable({
        q = a1,
        r = a2,
        GetS = function(self) -- Line: 27
            return -self.q - self.r
        end,
    }, u0))
end

function u0:Add(a2) -- Line: 35 -- upvalues: u0 (val)
    return u0.new(self.q + a2.q, self.r + a2.r)
end

function u0.Subtract(a1, a2) -- Line: 44 -- upvalues: u0 (val)
    return u0.new(a1.q - a2.q, a1.r - a2.r)
end

function u0.DistanceTo(a1, a2) -- Line: 53
    return (math.max(math.abs(a1.q - a2.q), math.abs(a1.r - a2.r), (math.abs((a1:GetS()) - (a2:GetS())))))
end

local u6 = {}
local v1 = u0.new(1, 0)
local v2 = u0.new(1, -1)
local v3 = u0.new(0, -1)
local v4 = u0.new(-1, 0)
local v5 = u0.new(-1, 1)
u6[1] = v1
u6[2] = v2
u6[3] = v3
u6[4] = v4
u6[5] = v5
u6[6] = u0.new(0, 1)

function u0.Neighbor(a1, a2) -- Line: 73 -- upvalues: u6 (val) -- types: a1: table, a2: number
    local v1 = false
    if a2 >= 0 then
        v1 = a2 <= 5
    end
    assert(v1, "Direction must be between 0 and 5.")
    return a1:Add(u6[a2 + 1])
end

function u0.ToString(a1) -- Line: 79
    return "(" .. a1.q .. ", " .. a1.r .. ")"
end

function u0.ToWorldPosition_FlatTopped(a1) -- Line: 84
    return (Vector3.new(2.2 * (1.5 * a1.q), -1000, 2.2 * (1.7320508075688772 * (a1.r + a1.q / 2))))
end

function u0.ToWorldPosition_PointyTopped(a1) -- Line: 91
    return (Vector3.new(2.2 * (1.7320508075688772 * (a1.q + a1.r / 2)), -1000, 2.2 * (1.5 * a1.r)))
end

return u0