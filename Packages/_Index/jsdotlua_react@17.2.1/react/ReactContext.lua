-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactContext
-- Decompile time: 1.05 ms

local console = (require((script.Parent.Parent:WaitForChild("shared")))).console
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
return {
    createContext = function(a1, a2) -- Line: 23
        -- upvalues: REACT_CONTEXT_TYPE (val), REACT_PROVIDER_TYPE (val), console (val)
        local u2 = {
            ["$$typeof"] = REACT_CONTEXT_TYPE,
            _calculateChangedBits = a2,
            _currentValue = a1,
            _currentValue2 = a1,
            _threadCount = 0,
            Provider = nil,
            Consumer = nil,
            displayName = nil,
            _currentRenderer = nil,
            _currentRenderer2 = nil,
        }
        u2.Provider = {["$$typeof"] = REACT_PROVIDER_TYPE, _context = u2}
        local u12 = false
        if not _G.__DEV__ then
            u2.Consumer = u2
        else
            local v1 = {
                ["$$typeof"] = REACT_CONTEXT_TYPE,
                _context = u2,
                _calculateChangedBits = u2._calculateChangedBits,
            }
            local v2 = {
                __index = function(a1, a2) -- Line: 68 -- upvalues: u2 (val)
                    if a2 == "_currentValue" then
                        return u2._currentValue
                    end
                    if a2 == "_currentValue2" then
                        return u2._currentValue2
                    end
                    if a2 == "_threadCount" then
                        return u2._threadCount
                    end
                    if a2 == "displayName" then
                        return u2.displayName
                    end
                    return nil
                end,
                __newindex = function(a1, a2, a3) -- Line: 81 -- upvalues: u2 (val), u12 (ref), console (upval)
                    if a2 == "_currentValue" then
                        u2._currentValue = a3
                        return
                    end
                    if a2 == "_currentValue2" then
                        u2._currentValue2 = a3
                        return
                    end
                    if a2 == "_threadCount" then
                        u2._threadCount = a3
                        return
                    end
                    if a2 == "displayName" and not u12 then
                        console.warn("Setting `displayName` on Context.Consumer has no effect. " .. "You should set it directly on the context with Context.displayName = " .. a3 .. ".")
                        u12 = true
                    end
                end,
            }
            setmetatable(v1, v2)
            u2.Consumer = v1
        end
        if _G.__DEV__ then
            u2._currentRenderer = nil
            u2._currentRenderer2 = nil
        end
        return u2
    end,
}