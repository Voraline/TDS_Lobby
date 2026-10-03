-- Script path: ReplicatedStorage.Shared.Modules.TutorialTowerEventFilter
-- Decompile time: 0.57 ms

local u0 = {}

function u0.matches(a1, a2, a3, a4, a5) -- Line: 5 -- types: a2: userdata, a3: string, a4: vector?, a5: number?
    if a1 ~= nil and a1.Owner ~= nil and a1.Owner.PlayerInstance == a2 and a1.Name == a3 then
        if a4 ~= nil and (typeof(a1.Position) ~= "Vector3" or (a5 or 3) < (a1.Position - a4).Magnitude) then
            return false
        end
        return true
    end
    return false
end

function u0.findMatching(a1, a2, a3, a4, a5) -- Line: 34
    -- upvalues: u0 (val)
    for i, j in a1 do
        if u0.matches(j, a2, a3, a4, a5) then
            return j
        end
    end
    return nil
end

return u0