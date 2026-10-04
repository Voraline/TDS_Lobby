-- Script path: ReplicatedStorage.Shared.Modules.Experience
-- Decompile time: 0.53 ms

return function(a1) -- Line: 1
    local v1 = 10 + 35 * (1 + a1 / 10)
    if a1 > 40 then
        v1 = 245 + 15 * (1 + a1 / 10)
    elseif a1 > 10 then
        v1 = -80 + 80 * (1 + a1 / 10)
    end
    return (math.floor(v1 + 0.5))
end