-- Script path: ReplicatedStorage.Packages._Index.littensy_react-charm@0.4.0-rc.4.react-charm
-- Decompile time: 0.58 ms

local u2 = require("./Charm")
local u5 = require("./React")

local function useSignalState(a1, a2) -- Line: 16 -- upvalues: u5 (val), u2 (val) -- types: a1: function, a2: table?
    local v1, u6 = u5.useState(a1)
    local v2 = a2 or {}
    u5.useLayoutEffect(function() -- Line: 19 -- upvalues: u2 (upval), a1 (val), u6 (val)
        return u2.listen(a1, u6)
    end, v2)
    return v1
end

return table.freeze({
    useSignalState = useSignalState,
    useSignalBinding = function(a1, a2) -- Line: 37 -- upvalues: u5 (val), u2 (val) -- types: a1: function, a2: table?
        local v1, u11 = u5.useBinding((u5.useMemo(a1, {})))
        local v2 = a2 or {}
        u5.useLayoutEffect(function() -- Line: 41 -- upvalues: u2 (upval), a1 (val), u11 (val)
            return u2.listen(a1, u11)
        end, v2)
        return v1
    end,
    useAtom = useSignalState,
})