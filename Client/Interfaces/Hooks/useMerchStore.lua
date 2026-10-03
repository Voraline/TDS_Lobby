-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useMerchStore
-- Decompile time: 2.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local StateReplicators = ReplicatedStorage.StateReplicators
local CommerceProductInfo = require(ReplicatedStorage.Shared.Modules.CommerceProductInfo)
local React = require(ReplicatedStorage.Shared.UI.React)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local useMerchStoreEnabled = require(Hooks.useMerchStoreEnabled)
local useMemo = React.useMemo
local useState = React.useState
local useEffect = React.useEffect
local useCallback = React.useCallback
return function() -- Line: 33
    -- upvalues: useState (val), useMerchStoreEnabled (val), useMemo (val), useEffect (val), CommerceProductInfo (val)
    -- upvalues: StateReplicators (val), TagReplicator (val), useCallback (val)
    local u2, u3 = useState(false)
    local v1, u7 = useState(true)
    local v2, u11 = useState(true)
    local u14, u15 = useState({})
    local u18, u19 = useState({})
    local u22, u23 = useState({})
    local u25 = useMerchStoreEnabled()
    local v3, u29 = useState(false)
    local v4 = {u18, u22}
    local v5 = useMemo(function() -- Line: 46 -- upvalues: u22 (val), u18 (val)
        local v1 = table.clone(u22)
        table.sort(v1, function(a1, a2) -- Line: 49 -- upvalues: u18 (upval)
            local v1 = table.find(u18, a1.id)
            local v2 = table.find(u18, a2.id)
            if v1 and not v2 then
                return true
            end
            if v2 and not v1 then
                return false
            end
            if v1 and v2 then
                return v1 < v2
            end
            local v3 = if not a1.items then 0 else #a1.items
            local v4 = if not a2.items then 0 else #a2.items
            if v3 ~= v4 then
                return v4 < v3
            end
            return a1.items[1].text < a2.items[1].text
        end)
        return v1
    end, v4)
    local v6 = {u14, u2}
    useEffect(function() -- Line: 74 -- upvalues: u14 (val), u2 (val), u23 (val), u11 (val), CommerceProductInfo (upval)
        if next(u14) ~= nil and u2 then
            u11(true)
            local u18 = ((CommerceProductInfo.fetchProductsInfo(u14)):andThen(function(a1) -- Line: 83 -- upvalues: u23 (upval)
                u23(a1)
            end)):finally(function() -- Line: 86 -- upvalues: u11 (upval)
                u11(false)
            end)
            return function() -- Line: 90 -- upvalues: u18 (val)
                u18:cancel()
            end
        end
        u23({})
    end, v6)
    v6 = {u25}
    useEffect(function() -- Line: 95
        -- upvalues: u25 (val), u15 (val), StateReplicators (upval), TagReplicator (upval), u7 (val), u29 (val)
        -- upvalues: u19 (val)
        if not u25 then
            u15({})
            return
        end
        local u4 = nil
        local u5 = nil
        local u8 = task.spawn(function() -- Line: 104
            -- upvalues: StateReplicators (upval), u5 (ref), TagReplicator (upval), u4 (ref), u7 (upval), u29 (upval)
            -- upvalues: u15 (upval), u19 (upval)
            local MerchStoreReplicator = StateReplicators:WaitForChild("MerchStoreReplicator")
            u5 = TagReplicator.getReplicatorEntityFromFolder(MerchStoreReplicator)
            u4 = u5.Changed:Connect(function() -- Line: 108 -- upvalues: u5 (upval), u7 (upval), u29 (upval), u15 (upval), u19 (upval)
                local v1 = u5:Get("loading") or false
                u7(v1)
                u29(u5:Get("enabled") or false)
                u15(not v1 and u5:Get("items") or {})
                u19(not v1 and u5:Get("featured") or {})
            end)
            local v1 = u5:Get("loading") or false
            u7(v1)
            u29(u5:Get("enabled") or false)
            u15(not v1 and u5:Get("items") or {})
            u19(not v1 and u5:Get("featured") or {})
        end)
        return function() -- Line: 127 -- upvalues: u8 (val), u4 (ref), u5 (ref)
            task.cancel(u8)
            if u4 then
                u4:Disconnect()
            end
            if u5 then
                u5:Destroy()
            end
        end
    end, v6)
    v4 = {loading = v1 or v2, products = v5}
    local v7 = {u2}
    v4.fetch = useCallback(function() -- Line: 142 -- upvalues: u2 (val), u3 (val)
        if u2 then
            return
        end
        u3(true)
    end, v7)
    return u25 and v3, v4
end