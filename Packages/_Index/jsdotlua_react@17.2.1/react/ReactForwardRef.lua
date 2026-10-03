-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactForwardRef
-- Decompile time: 1.18 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
require(script.Parent.Parent:WaitForChild("shared"))
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
return {
    forwardRef = function(a1) -- Line: 27
        -- upvalues: REACT_MEMO_TYPE (val), console (val), REACT_FORWARD_REF_TYPE (val)
        local v1
        if _G.__DEV__ then
            if typeof(a1) ~= "table" then
                if typeof(a1) == "function" then
                    v1 = debug.info(a1, "a")
                    if v1 ~= 0 and v1 ~= 2 then
                        console.error(
                            "forwardRef render functions accept exactly two parameters: props and ref. %s",
                            if v1 ~= 1 then "Any additional parameter will be undefined." else "Did you forget to use the ref parameter?"
                        )
                    end
                else
                    console.error("forwardRef requires a render function but was given %s.", (typeof(a1)))
                end
            elseif a1["$$typeof"] == REACT_MEMO_TYPE then
                console.error("forwardRef requires a render function but received a `memo` component. Instead of forwardRef(memo(...)), use memo(forwardRef(...)).")
            elseif typeof(a1) == "function" then
                v1 = debug.info(a1, "a")
                if v1 ~= 0 and v1 ~= 2 then
                    console.error(
                        "forwardRef render functions accept exactly two parameters: props and ref. %s",
                        if v1 ~= 1 then "Any additional parameter will be undefined." else "Did you forget to use the ref parameter?"
                    )
                end
            else
                console.error("forwardRef requires a render function but was given %s.", (typeof(a1)))
            end
        end
        v1 = {["$$typeof"] = REACT_FORWARD_REF_TYPE, render = a1}
        if _G.__DEV__ then
            local u43 = nil
            local v2 = {
                __index = function(a1, a2) -- Line: 84 -- upvalues: u43 (ref)
                    if a2 == "displayName" then
                        return u43
                    end
                    return (rawget(a1, a2))
                end,
                __newindex = function(a1, a2, a3) -- Line: 90 -- upvalues: u43 (ref)
                    if a2 == "displayName" then
                        u43 = a3
                        return
                    end
                    rawset(a1, a2, a3)
                end,
            }
            setmetatable(v1, v2)
        end
        return v1
    end,
}