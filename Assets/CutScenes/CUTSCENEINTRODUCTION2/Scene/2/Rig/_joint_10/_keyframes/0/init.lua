-- Script path: ReplicatedStorage.Assets.CutScenes.CUTSCENEINTRODUCTION2.Scene.2.Rig._joint._keyframes.0
-- Decompile time: 0.50 ms

local v1
local u0 = {}
for i, j in script:GetChildren() do
    v1 = tonumber(j.Name)
    u0[v1] = (require(j))
end

local function proxy(a1) -- Line: 7 -- upvalues: u0 (val) -- types: a1: string
    return (setmetatable({}, {
        __index = function(a1_2, a2) -- Line: 8 -- upvalues: u0 (upval), a1 (val) -- types: a2: number
            local v1 = math.floor(a2 / 1000)
            local v2 = u0[v1] or u0[0]
            return v2[a1][a2]
        end,
    }))
end

return {Count = 3220, Values = proxy("Values"), Eases = proxy("Eases")}