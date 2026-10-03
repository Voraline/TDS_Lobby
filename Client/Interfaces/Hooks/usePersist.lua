-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePersist
-- Decompile time: 0.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PersistController = require(ReplicatedStorage.Client.Controllers.Shared.PersistController)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCallback = React.useCallback
local useState = React.useState
local useEffect = React.useEffect
return function(a1, a2) -- Line: 11
    -- upvalues: useState (val), useCallback (val), PersistController (val), useEffect (val)
    local v1, u5 = useState(a2)
    local u8, u9 = useState(false)
    local v2 = useCallback(function() -- Line: 15 -- upvalues: PersistController (upval), a1 (val), u9 (val)
        if not PersistController.update(a1) then
            warn((("failed to update value for query: $%*"):format((unpack(a1)))))
        end
        u9(true)
    end, a1)
    useEffect(function() -- Line: 24 -- upvalues: u5 (val), a2 (val), u9 (val), PersistController (upval), a1 (val)
        u5(a2)
        u9(false)
        local v1, v2 = PersistController.get(a1)
        if v1 then
            u5(if v2 == nil then a2 else v2)
            return
        end
        warn((("failed to get value for query: %*"):format((unpack(a1)))))
    end, a1)
    local v3 = {u8, a2}
    useEffect(function() -- Line: 36 -- upvalues: u8 (val), u5 (val), a2 (val), PersistController (upval), a1 (val)
        if u8 then
            u5(a2)
            PersistController.update(a1)
        end
    end, v3)
    return v1, v2
end