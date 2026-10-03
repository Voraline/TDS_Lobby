-- Script path: ReplicatedStorage.Packages.Sift.Util.equalObjects
-- Decompile time: 0.33 ms

require(script.Parent.Parent.Types)
return function(...) -- Line: 20
    local v1 = select(1, ...)
    for i = 2, (select("#", ...)) do
        if v1 ~= select(i, ...) then
            return false
        end
    end
    return true
end