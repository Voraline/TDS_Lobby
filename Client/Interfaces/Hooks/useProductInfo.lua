-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useProductInfo
-- Decompile time: 0.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProductInfoCache = require(ReplicatedStorage.Shared.Modules.ProductInfoCache)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useState = React.useState
return function(a1, a2) -- Line: 13 -- upvalues: useState (val), useEffect (val), ProductInfoCache (val) -- types: a2: number
    local v1, u5 = useState(nil)
    local v2, u9 = useState(true)
    local v3 = {a2, a1}
    useEffect(function() -- Line: 20 -- upvalues: u9 (val), ProductInfoCache (upval), a2 (val), a1 (val), u5 (val)
        u9(true)
        local u11 = (ProductInfoCache.getProductInfo(a2, a1)):andThen(function(a1) -- Line: 24 -- upvalues: u5 (upval), u9 (upval)
            u5(a1)
            u9(false)
        end)
        return function() -- Line: 29 -- upvalues: u11 (val)
            u11:cancel()
        end
    end, v3)
    return v2, v1
end