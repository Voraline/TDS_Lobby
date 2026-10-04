-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxComponent
-- Decompile time: 0.79 ms

local Object = (require((script.Parent.Parent.Parent:WaitForChild("luau-polyfill")))).Object
local RobloxComponentProps = require((script.Parent:WaitForChild("roblox")):WaitForChild("RobloxComponentProps"))
require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
return {
    setInitialProperties = RobloxComponentProps.setInitialProperties,
    diffProperties = function(a1, a2, a3, a4, a5) -- Line: 31 -- upvalues: Object (val) -- types: a2: string, a3: table, a4: table
        local v1
        local v2 = nil
        local v3 = nil
        local v4 = nil
        local v5, v6 = a4, a3
        for i, j in a3, v3, v4 do
            if v5[i] == nil then
                v2 = v2 or table.create(2)
                table.insert(v2, i)
                table.insert(v2, Object.None)
            end
        end
        v3 = nil
        v4 = nil
        for k, n in v5, v3, v4 do
            v1 = if v6 == nil then nil else v6[k]
            if n ~= v1 then
                v2 = v2 or table.create(2)
                table.insert(v2, k)
                table.insert(v2, n)
            end
        end
        return v2
    end,
    updateProperties = RobloxComponentProps.updateProperties,
    cleanupHostComponent = RobloxComponentProps.cleanupHostComponent,
}