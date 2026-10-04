-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_pretty-format@3.10.0.pretty-format.plugins.RobloxInstance
-- Decompile time: 3.65 ms

local getType = require(script.Parent.Parent.Parent:WaitForChild("jest-get-type")).getType
local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Object = v1.Object
local Array = v1.Array
local instanceof = v1.instanceof
local RobloxInstance = require(script.Parent.Parent.Parent:WaitForChild("jest-roblox-shared")).RobloxInstance
local InstanceSubset = RobloxInstance.InstanceSubset
local printTableEntries = require(script.Parent.Parent:WaitForChild("Collections")).printTableEntries
require(script.Parent.Parent:WaitForChild("Types"))

local function printInstance(a1, a2, a3, a4, a5, a6) -- Line: 37
    -- upvalues: RobloxInstance (val), Object (val), Array (val), getType (val)
    local v1, v2, v3
    local v4 = ""
    local Children = a1:GetChildren()
    table.sort(Children, function(a1, a2) -- Line: 48
        return a1.Name < a2.Name
    end)
    local u244 = RobloxInstance.listProps(a1)
    local v5 = Object.keys(u244)
    if not a2.printInstanceDefaults then
        local u26 = RobloxInstance.listDefaultProps(a1.ClassName)
        v5 = Array.filter(v5, function(a1) -- Line: 56 -- upvalues: u244 (val), u26 (val)
            return u244[a1] ~= u26[a1]
        end)
    end
    table.sort(v5)
    local v6 = #v5 > 0
    local v7 = #Children > 0
    if v6 then
        v4 = v4 .. a2.spacingOuter
        v1 = a3 .. a2.indent
        for i, v in ipairs(v5) do
            v2 = u244[v]
            if v2 == Object.None then
                v2 = nil
            end
            v3 = if getType(v2) ~= "Instance" then v8 else (1 / 0)
            v4 = string.format("%s%s%s: %s", v4, v1, v9(v, v10, v1, v8, v11), (v9(v2, v10, v1, v3, v11)))
            if i ~= #v5 or v7 then
                v4 = v4 .. "," .. v10.spacingInner
            elseif not v10.min then
                v4 = v4 .. ","
            end
        end
        for i2, i3 in ipairs(Children) do
            v4 = string.format("%s%s%s: %s", v4, v1, v9(i3.Name, v10, v1, v8, v11), (v9(i3, v10, v1, v8, v11)))
            if i2 ~= #Children then
                v4 = v4 .. "," .. v10.spacingInner
            elseif not v10.min then
                v4 = v4 .. ","
            end
        end
        v4 = v4 .. v10.spacingOuter .. v12
    elseif v7 then
        v4 = v4 .. a2.spacingOuter
        v1 = a3 .. a2.indent
        for i4, j in ipairs(v5) do
            v2 = u244[j]
            if v2 == Object.None then
                v2 = nil
            end
            v3 = if getType(v2) ~= "Instance" then v8 else (1 / 0)
            v4 = string.format("%s%s%s: %s", v4, v1, v9(j, v10, v1, v8, v11), (v9(v2, v10, v1, v3, v11)))
            if i4 ~= #v5 or v7 then
                v4 = v4 .. "," .. v10.spacingInner
            elseif not v10.min then
                v4 = v4 .. ","
            end
        end
        for i5, k in ipairs(Children) do
            v4 = string.format("%s%s%s: %s", v4, v1, v9(k.Name, v10, v1, v8, v11), (v9(k, v10, v1, v8, v11)))
            if i5 ~= #Children then
                v4 = v4 .. "," .. v10.spacingInner
            elseif not v10.min then
                v4 = v4 .. ","
            end
        end
        v4 = v4 .. v10.spacingOuter .. v12
    end
    return v4
end

return {
    serialize = function(a1, a2, a3, a4, a5, a6) -- Line: 111
        -- upvalues: instanceof (val), InstanceSubset (val), printTableEntries (val), printInstance (val)
        local v1 = a4 + 1
        if a2.maxDepth <= v1 then
            return string.format("\"%s\" [%s]", a1.Name, a1.ClassName)
        end
        if instanceof(a1, InstanceSubset) then
            return a1.ClassName .. " {" .. (printTableEntries(a1.subset, a2, a3, v1, a5, a6)) .. "}"
        end
        return a1.ClassName .. " {" .. (printInstance(a1, a2, a3, v1, a5, a6)) .. "}"
    end,
    test = function(a1) -- Line: 132 -- upvalues: getType (val), instanceof (val), InstanceSubset (val)
        local v1 = true
        if getType(a1) ~= "Instance" then
            v1 = instanceof(a1, InstanceSubset)
        end
        return v1
    end,
}