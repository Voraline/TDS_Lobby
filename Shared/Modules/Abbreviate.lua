-- Script path: ReplicatedStorage.Shared.Modules.Abbreviate
-- Decompile time: 0.49 ms

local u0 = {"K", "M", "B", "T", "Qd", "Qn", "Sx", "Sp", "O", "N"}
return function(a1, a2) -- Line: 6 -- upvalues: u0 (val) -- types: a1: number, a2: number?
    local v1 = math.floor((math.log(a1, 1000)))
    local v2 = u0[v1]
    if not v2 then
        return (tostring(a1))
    end
    local v3 = 10 ^ (a2 or 2)
    return (("%*%*"):format(math.round(a1 / 1000 ^ v1 * v3) / v3, v2))
end