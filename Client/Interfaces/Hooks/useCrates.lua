-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useCrates
-- Decompile time: 4.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ContentAssets = require(ReplicatedStorage.Shared.Modules.ContentAssets)
local NewCrates = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewCrates)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Packages.Sift)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useChildren = require(script.Parent.useChildren)
local useFFlag = require(script.Parent.useFFlag)
local useState = React.useState
local useEffect = React.useEffect
local Crates = ContentAssets("Crates")
local Shop = Network.Channel("Shop")
local u60 = {}
local u62 = Signal.new()
Shop:On("Update", function(a1) -- Line: 24 -- upvalues: u60 (ref), u62 (val)
    u60 = a1 or {}
    u62:Fire()
end)
task.spawn(function() -- Line: 29 -- upvalues: u60 (ref), Shop (val), u62 (val)
    u60 = Shop:InvokeServer("GetCrates") or {}
    u62:Fire()
end)
return function(a1) -- Line: 34
    -- upvalues: useChildren (val), Crates (val), useState (val), u60 (ref), useFFlag (val), useEffect (val), u62 (val)
    -- upvalues: table (val), React (val), NewCrates (val)
    local u3 = useChildren(Crates)
    local u6, u7 = useState(u60)
    local u17 = useFFlag("disabled_crates", {}, if a1 ~= nil then {enabled = a1} else nil)
    useEffect(function() -- Line: 42 -- upvalues: u62 (upval), u7 (val), table (upval), u60 (upval)
        local u4 = u62:Connect(function() -- Line: 43 -- upvalues: u7 (upval), table (upval), u60 (upval)
            u7(table.clone(u60))
        end)
        return function() -- Line: 47 -- upvalues: u4 (val)
            u4:Disconnect()
        end
    end, {})
    return React.useMemo(function() -- Line: 52 -- upvalues: u17 (val), u3 (val), NewCrates (upval), u6 (val), table (upval)
        local Contents, Daily, DailyOnly, v1, v2
        local v3 = {}
        local v4 = {}
        for i, j in u17 do
            v4[j] = true
        end
        local v5 = nil
        local v6 = nil
        for k, n in u3, v5, v6 do
            if not v4[n.Name] then
                v1 = NewCrates(n.Name)
                if v1 then
                    v2 = u6[n.Name]
                    if not v1.Remote or v2 then
                        if v2 then
                            v1 = table.deepClone(v1)
                            Contents = v2.Contents or v1.Contents
                            v1.Contents = Contents
                            Daily = v2.Daily or v1.Daily
                            v1.Daily = Daily
                            DailyOnly = if v2.DailyOnly == nil then v1.DailyOnly else v2.DailyOnly
                            v1.DailyOnly = DailyOnly
                            v1.Price = if v2.Price ~= false then v2.Price or v1.Price else nil
                        end
                        v3[n.Name] = v1
                    end
                end
            end
        end
        return v3
    end, {u3, u6, u17})
end