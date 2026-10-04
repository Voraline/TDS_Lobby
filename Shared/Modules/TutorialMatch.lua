-- Script path: ReplicatedStorage.Shared.Modules.TutorialMatch
-- Decompile time: 0.15 ms

return function(a1, a2, a3) -- Line: 3 -- types: a1: boolean?, a2: number?, a3: string?
    local v1 = true
    if a1 ~= true then
        v1 = true
        if a2 ~= 0 then
            v1 = a3 == "Tutorial"
        end
    end
    return v1
end