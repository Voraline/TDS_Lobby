-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.GamepassButton
-- Decompile time: 2.52 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local NewsButton = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local useProductInfo = require(Hooks.useProductInfo)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
return React.memo(function(a1) -- Line: 30
    -- upvalues: useProductInfo (val), useBinding (val), useEffect (val), createElement (val), NewsButton (val)
    -- upvalues: RunService (val), MarketplaceService (val), Players (val)
    local v1 = a1.Visible ~= false
    local u8, u9 = useProductInfo(Enum.InfoType.GamePass, a1.gamepassId)
    local v2, u13 = useBinding("Off Sale")
    local v3 = {u8}
    useEffect(function() -- Line: 37 -- upvalues: u8 (val), u9 (val), u13 (val)
        if u8 then
            return
        end
        if u9 and u9.PriceInRobux then
            u13((("%* %*"):format(utf8.char(57346), u9.PriceInRobux)))
            return
        end
    end, v3)
    return createElement(NewsButton, {
        LayoutOrder = a1.LayoutOrder,
        Size = a1.Size,
        AnchorPoint = a1.AnchorPoint,
        Position = a1.Position,
        Text = v2,
        Visible = v1,
        Clicked = function() -- Line: 56 -- upvalues: RunService (upval), MarketplaceService (upval), Players (upval), a1 (val)
            if not RunService:IsRunning() then
                return
            end
            MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, a1.gamepassId)
        end,
    })
end)