-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.MerchShop
-- Decompile time: 3.35 ms

local CommerceService = game:GetService("CommerceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local useTagged = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagged)
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Lobby.Components
local useMerchStore = require(Hooks.useMerchStore)
local useViewEnabled = require(Hooks.useViewEnabled)
local MerchShop = require(Components.MerchShop)
local useMemo = React.useMemo
local useEffect = React.useEffect
local createElement = React.createElement
return function(a1) -- Line: 33
    -- upvalues: useMerchStore (val), useViewEnabled (val), useTagged (val), useEffect (val), spr (val), useMemo (val)
    -- upvalues: CommerceService (val), Players (val), ViewController (val), createElement (val), MerchShop (val)
    local u2, u3 = useMerchStore()
    local MerchStore, MerchStore_2 = useViewEnabled("MerchStore")
    local MerchShopDisplay = useTagged("MerchShopDisplay")
    local v1 = {MerchShopDisplay}
    useEffect(function() -- Line: 38 -- upvalues: MerchShopDisplay (val), spr (upval), MerchStore_2 (val)
        local Button, content, v1, v2, v3, v4
        local u0 = {}
        for i, j in MerchShopDisplay do
            Button = j:FindFirstChild("Button", true)
            if Button then
                content = Button.content
                local scale = content.scale
                v4 = content.MouseButton1Down:Connect(function() -- Line: 55 -- upvalues: spr (upval), scale (val)
                    spr.target(scale, 0.6, 4, {Scale = 0.7})
                end)
                v1 = content.MouseButton1Up:Connect(function() -- Line: 60 -- upvalues: MerchStore_2 (upval), spr (upval), scale (val)
                    MerchStore_2("MerchStore")
                    spr.target(scale, 0.6, 4, {Scale = 0.75})
                end)
                v2 = Button.MouseEnter:Connect(function() -- Line: 66 -- upvalues: spr (upval), scale (val)
                    spr.target(scale, 0.6, 4, {Scale = 0.75})
                end)
                v3 = Button.MouseLeave:Connect(function() -- Line: 71 -- upvalues: spr (upval), scale (val)
                    spr.target(scale, 0.6, 4, {Scale = 0.7})
                end)
                table.insert(u0, v4)
                table.insert(u0, v1)
                table.insert(u0, v2)
                table.insert(u0, v3)
            end
        end
        return function() -- Line: 83 -- upvalues: u0 (val)
            for i, j in u0 do
                j:Disconnect()
            end
        end
    end, v1)
    v1 = {u2, u3}
    local v2 = useMemo(function() -- Line: 90 -- upvalues: u2 (val), u3 (val), MerchStore_2 (val), CommerceService (upval), Players (upval)
        local v1, v2, v3, v4
        if not u2 then
            return {}
        end
        local v5 = {}
        local v6 = nil
        local v7 = nil
        for i, j in u3.products, v6, v7 do
            v2 = {}
            v3 = nil
            v4 = nil
            for k, n in j.items, v3, v4 do
                v1 = {icon = n.icon, text = n.text, banner = n.banner}
                if k == 1 then
                    v1.iconSize = UDim2.fromScale(1.5, 1.5)
                    v1.iconScaleType = Enum.ScaleType.Crop
                end
                table.insert(v2, v1)
            end
            table.insert(v5, {
                banner = if not j.featured then nil else "LIMITED",
                items = v2,
                clicked = function() -- Line: 118 -- upvalues: MerchStore_2 (upval), CommerceService (upval), Players (upval), j (val)
                    MerchStore_2("Hotbar")
                    CommerceService:PromptCommerceProductPurchase(Players.LocalPlayer, j.id)
                end,
            })
        end
        return v5
    end, v1)
    local v3 = {MerchStore, u2}
    useEffect(function() -- Line: 128 -- upvalues: MerchStore (val), u2 (val), ViewController (upval), MerchStore_2 (val), u3 (val)
        if MerchStore and not u2 then
            ViewController:notifyError("You do not meet the eligibility requirements to access the Merch Store.")
            MerchStore_2("Hotbar")
            return
        end
        if MerchStore then
            u3.fetch()
        end
    end, v3)
    if not u2 then
        return nil
    end
    return createElement(MerchShop, {
        visible = MerchStore,
        loading = u3.loading,
        items = v2,
        onClose = function() -- Line: 148 -- upvalues: MerchStore_2 (val)
            MerchStore_2("Hotbar")
        end,
    })
end