-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactMemo
-- Decompile time: 1.74 ms

local shared = require(script.Parent.Parent:WaitForChild("shared"))
local console = shared.console
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local inspect = v1.util.inspect
local ReactSymbols = shared.ReactSymbols
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local isValidElementType = shared.isValidElementType
local getComponentName = shared.getComponentName
return {
    memo = function(a1, a2) -- Line: 37
        -- upvalues: isValidElementType (val), Object (val), Array (val), REACT_ELEMENT_TYPE (val)
        -- upvalues: getComponentName (val), inspect (val), console (val), REACT_MEMO_TYPE (val)
        if _G.__DEV__ and not isValidElementType(a1) then
            local v1
            local v2 = ""
            if a1 == nil or typeof(a1) == "table" and #Object.keys(a1) == 0 then
                v2 = v2 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
            end
            if a1 == nil then
                v1 = "nil"
            elseif Array.isArray(a1) then
                v1 = "array"
            elseif a1 == nil or typeof(a1) ~= "table" or a1["$$typeof"] ~= REACT_ELEMENT_TYPE then
                v1 = typeof(a1)
                if a1 ~= nil then
                    v2 = "\n" .. inspect(a1)
                end
            else
                v1 = string.format("<%s />", getComponentName(a1.type) or "UNKNOWN")
                v2 = " Did you accidentally export a JSX literal or Element instead of a component?"
            end
            console.error("memo: The first argument must be a component. Instead received: `%s`.%s", v1, v2)
        end
        local v3 = {["$$typeof"] = REACT_MEMO_TYPE, type = a1, compare = a2 or nil}
        if _G.__DEV__ then
            local u75 = nil
            local v4 = {
                __index = function(a1, a2) -- Line: 103 -- upvalues: u75 (ref)
                    if a2 == "displayName" then
                        return u75
                    end
                    return (rawget(a1, a2))
                end,
                __newindex = function(a1_2, a2, a3) -- Line: 109 -- upvalues: u75 (ref), a1 (val)
                    if a2 ~= "displayName" then
                        rawset(a1_2, a2, a3)
                        return
                    end
                    if typeof(a1) == "table" and a1.displayName == nil then
                        a1.displayName = a3
                        return
                    end
                end,
            }
            setmetatable(v3, v4)
        end
        return v3
    end,
}