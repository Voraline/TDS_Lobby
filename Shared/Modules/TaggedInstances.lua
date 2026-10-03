-- Script path: ReplicatedStorage.Shared.Modules.TaggedInstances
-- Decompile time: 0.56 ms

return {
    getTaggedInstances = function(a1) -- Line: 1 -- types: a1: userdata
        local v1 = {}
        local Descendants = a1:GetDescendants()
        table.insert(Descendants, 1, a1)
        local v2 = nil
        local v3 = nil
        for i, j in Descendants, v2, v3 do
            for k, n in j:GetTags() do
                if not v1[n] then
                    v1[n] = {}
                end
                table.insert(v1[n], j)
            end
        end
        return v1
    end,
}