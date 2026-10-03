-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.StarterPack
-- Decompile time: 2.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useServerTick = require(ReplicatedStorage.Client.Interfaces.Hooks.useServerTick)
local useTagged = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagged)
local useView = require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local StarterPackStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.StarterPackStore)
local Shop = Network.Channel("Shop")
local Monetization = Network.Channel("Monetization")
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local createElement = React.createElement
local joinBindings = React.joinBindings
local StarterPack = (require(ReplicatedStorage.Client.Interfaces.Lobby.Components.StarterPack)).StarterPack
return function() -- Line: 28
    -- upvalues: useServerTick (val), ReactCharm (val), StarterPackStore (val), useTagged (val), useFFlag (val)
    -- upvalues: RunService (val), useView (val), joinBindings (val), useEffect (val), Monetization (val)
    -- upvalues: createElement (val), StarterPack (val), Shop (val), Notification (val)
    local v1 = useServerTick()
    local v2 = ReactCharm.useSignalBinding(StarterPackStore.getEndTime)
    local v3 = nil
    for i, j in (useTagged("StarterPackBundlePortal")) do
        if j:IsA("SurfaceGui") then
            v3 = j
            break
        end
    end
    local v4 = (useFFlag("shop.starter-pack", RunService:IsStudio(), {isBinding = true})):map(function(a1) -- Line: 41
        return not a1
    end)
    local u40, u41 = useView(true)
    local v5 = joinBindings({v1, v2, v4}):map(function(a1) -- Line: 47
        local v1, v2, v3 = unpack(a1)
        if v3 or v2 < v1 then
            return true
        end
        return false
    end)
    useEffect(function() -- Line: 60 -- upvalues: Monetization (upval), u40 (val), u41 (val)
        return Monetization:On("Completed", function() -- Line: 61 -- upvalues: u40 (upval), u41 (upval)
            if u40:getValue() ~= "StarterPack" then
                return
            end
            u41("Hotbar")
        end)
    end, {})
    return createElement(StarterPack, {
        BannerPortal = v3,
        EndTime = v2,
        Purchase = function() -- Line: 74 -- upvalues: Shop (upval), Notification (upval)
            local v1, v2 = Shop:InvokeServer("StarterPackPurchase")
            if not v1 then
                Notification.Create({
                    Color = Color3.fromRGB(255, 0, 0),
                    Text = v2 or "Error occured while trying to start purchase. Please try again later.",
                })
            end
        end,
        ToggleModal = function(a1) -- Line: 85 -- upvalues: u41 (val) -- types: a1: boolean
            u41(if not a1 then "Hotbar" else "StarterPack")
        end,
        ModalVisible = joinBindings({u40, v5}):map(function(a1) -- Line: 89
            local v1, v2 = unpack(a1)
            local v3 = false
            if v1 == "StarterPack" then
                v3 = not v2
            end
            return v3
        end),
        BannerVisible = joinBindings({u40, v5}):map(function(a1) -- Line: 94
            local v1, v2 = unpack(a1)
            local v3 = false
            if v1 == "Hotbar" then
                v3 = not v2
            end
            return v3
        end),
    })
end