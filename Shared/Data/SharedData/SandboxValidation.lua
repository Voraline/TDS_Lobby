-- Script path: ReplicatedStorage.Shared.Data.SharedData.SandboxValidation
-- Decompile time: 0.75 ms

return {
    assertUnlockedAndWhitelisted = function(a1) -- Line: 13 -- types: a1: table
        local category = a1.category
        local item = a1.item
        local whitelist = a1.whitelist
        local hasGamepass = a1.hasGamepass
        local unlocks = a1.unlocks or {}
        local v1 = item
        if string.sub(item, #item - 6) == " Legacy" then
            v1 = string.sub(item, 1, #item - 7)
        end
        if not hasGamepass then
            assert(unlocks[v1] == true, "Item is not unlocked")
        end
        if not whitelist then
            warn((("Category \"%*\" has no whitelist fflag, please add one!"):format(category)))
            error((("Category \"%*\" has been temporarily disabled."):format(category)))
        elseif not unlocks[v1] then
            assert(table.find(whitelist, v1), "Item is not whitelisted")
        end
        if category == "Enemies" then
            local v2
            if not v2 then
                return
            end
            assert(hasGamepass, "Legacy enemies require the sandbox gamepass")
            return
        end
        if category == "Maps" then
            assert(a1.mapData, "Map does not exist")
            if a1.mapData.MapType == a1.communityMapType then
                assert(hasGamepass, "Community maps require the sandbox gamepass")
            end
        end
    end,
}