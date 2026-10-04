-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Utility.ReactUtil
-- Decompile time: 0.35 ms

return {
    updateReactChild = function(a1) -- Line: 6
        if type(a1) ~= "table" then
            return a1
        end
        local v1 = {}
        for i, j in a1 do
            v1[i] = j
        end
        return v1
    end,
}