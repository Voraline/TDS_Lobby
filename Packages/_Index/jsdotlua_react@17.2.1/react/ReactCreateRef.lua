-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactCreateRef
-- Decompile time: 0.61 ms

require(script.Parent.Parent:WaitForChild("shared"))
local u16 = require(script.Parent:WaitForChild("ReactBinding.roblox"))
return {
    createRef = function() -- Line: 24 -- upvalues: u16 (val)
        local u3 = u16.create(nil)
        local v1 = {}
        if _G.__DEV__ then
            u3._source = debug.traceback("Ref created at:", 1)
        end
        local v2 = {
            __index = function(a1, a2) -- Line: 42 -- upvalues: u3 (val)
                if a2 == "current" then
                    return u3:getValue()
                end
                return u3[a2]
            end,
            __newindex = function(a1, a2, a3) -- Line: 49 -- upvalues: u16 (upval), u3 (val)
                if a2 == "current" then
                    u16.update(u3, a3)
                end
                u3[a2] = a3
            end,
            __tostring = function(a1) -- Line: 60 -- upvalues: u3 (val)
                return string.format("Ref(%s)", (tostring((u3:getValue()))))
            end,
        }
        setmetatable(v1, v2)
        return v1
    end,
}