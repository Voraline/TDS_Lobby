-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useShopData
-- Decompile time: 6.10 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.Types.ShopTypes)
local useNewNetworkCall = require(ReplicatedStorage.Client.Interfaces.Hooks.useNewNetworkCall)
local useNewNetworkEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useNewNetworkEvent)
return function() -- Line: 16 -- upvalues: useNewNetworkCall (val), React (val), useNewNetworkEvent (val)
    local u3 = useNewNetworkCall("NewShop", true)
    local v1, u8 = React.useState(true)
    local v2, u13 = React.useState({})
    local v3, u18 = React.useState({})
    local u22 = React.useRef(0)
    local u27 = React.useCallback(function(a1) -- Line: 23 -- upvalues: u22 (val), u13 (val), u18 (val), u8 (val)
        local version_2
        if type(a1) ~= "table" then
            warn("[SHOP]: Received invalid shop data", a1)
            return
        end
        if (if type(a1.version) ~= "number" then 0 else a1.version) < u22.current then
            return
        end
        u22.current = version_2
        u13(a1.template or {})
        u18(a1.data or {})
        u8(false)
    end, {})
    useNewNetworkEvent("NewShop", "shopDataUpdated", u27)
    local v4 = {u3, u27}
    React.useEffect(function() -- Line: 42 -- upvalues: u3 (val), u27 (val)
        local u0 = false
        task.spawn(function() -- Line: 45 -- upvalues: u3 (upval), u0 (ref), u27 (upval)
            local success, result = pcall(u3, "getShopData")
            task.wait(1)
            if u0 then
                return
            end
            if not success then
                warn("[SHOP]: Failed to load shop data", result)
                return
            end
            u27(result)
        end)
        return function() -- Line: 61 -- upvalues: u0 (ref)
            u0 = true
        end
    end, v4)
    return {loading = v1, template = v2, items = v3}
end