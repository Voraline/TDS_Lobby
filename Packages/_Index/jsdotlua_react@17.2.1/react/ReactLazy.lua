-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactLazy
-- Decompile time: 1.52 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local inspect = require(script.Parent.Parent:WaitForChild("luau-polyfill")).util.inspect
require(script.Parent.Parent:WaitForChild("shared"))
local REACT_LAZY_TYPE = (require((script.Parent.Parent:WaitForChild("shared")))).ReactSymbols.REACT_LAZY_TYPE

function lazyInitializer(a1) -- Line: 71 -- upvalues: console (val), inspect (val) -- types: a1: table
    if a1._status == -1 then
        local v1 = a1._result()
        a1._status = 0
        a1._result = v1
        v1:andThen(function(a1_2) -- Line: 79 -- upvalues: a1 (val), console (upval), inspect (upval)
            if a1._status == 0 then
                local default = a1_2.default
                if _G.__DEV__ and default == nil then
                    console.error(
                        "lazy: Expected the result of a dynamic import() call. Instead received: `%s`\n\nYour code should look like: \n  local MyComponent = lazy(function() return reqquire(script.Parent.MyComponent) end)",
                        inspect(a1_2)
                    )
                end
                local v1 = a1
                v1._status = 1
                v1._result = default
            end
        end, function(a1_2) -- Line: 100 -- upvalues: a1 (val)
            if a1._status == 0 then
                local v1 = a1
                v1._status = 2
                v1._result = a1_2
            end
        end)
    end
    if a1._status == 1 then
        return a1._result
    end
    error(a1._result)
end

return {
    lazy = function(a1) -- Line: 118 -- upvalues: REACT_LAZY_TYPE (val), console (val) -- types: a1: function
        local v1 = {
            ["$$typeof"] = REACT_LAZY_TYPE,
            _payload = {_status = -1, _result = a1},
            _init = lazyInitializer,
        }
        if _G.__DEV__ then
            local u7 = nil
            local u8 = nil
            local v2 = {
                __index = function(a1, a2) -- Line: 140 -- upvalues: u7 (ref), u8 (ref)
                    if a2 == "defaultProps" then
                        return u7
                    end
                    if a2 == "propTypes" then
                        return u8
                    end
                end,
                __newindex = function(a1, a2, a3) -- Line: 149 -- upvalues: console (upval), u7 (ref), u8 (ref)
                    local v1
                    if a2 == "defaultProps" then
                        console.error("React.lazy(...): It is not supported to assign `defaultProps` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
                        u7 = a3
                        v1 = {
                            __index = function() end,
                            __newindex = function() end,
                        }
                        setmetatable(a1, v1)
                    end
                    if a2 == "propTypes" then
                        console.error("React.lazy(...): It is not supported to assign `propTypes` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
                        u8 = a3
                        v1 = {
                            __index = function() end,
                            __newindex = function() end,
                        }
                        setmetatable(a1, v1)
                    end
                end,
            }
            setmetatable(v1, v2)
        end
        return v1
    end,
}