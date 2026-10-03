-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StarterPack
-- Decompile time: 1.73 ms

local React = require(game:GetService("ReplicatedStorage").Shared.UI.React)
local ReactRoblox = require(game:GetService("ReplicatedStorage").Shared.UI.ReactRoblox)
local RuntimeLib = require(((game:GetService("ReplicatedStorage")):WaitForChild("rbxts")):WaitForChild("RuntimeLib"))
local u46 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Hooks", "useServerTick")
local Banner = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Lobby", "Components", "StarterPack", "Banner").Banner
local u73 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Components", "LargeUpsell")
local Modal = (RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Lobby", "Components", "StarterPack", "Modal")).Modal
return {
    StarterPack = function(a1) -- Line: 42 -- upvalues: u46 (val), React (val), u73 (val), Banner (val), ReactRoblox (val), Modal (val)
        local v1 = React.joinBindings({currentTime = u46(), endTime = a1.EndTime}):map(function(a1) -- Line: 48
            local v1 = math.max(0, a1.endTime - a1.currentTime)
            return string.format("%02d:%02d:%02d", math.floor(v1 / 3600), math.floor(v1 / 60 % 60), (math.floor(v1 % 60)))
        end)
        return React.createElement(React.Fragment, {}, {
            Banner = React.createElement(Banner, {
                Clicked = function() -- Line: 71 -- upvalues: a1 (val)
                    return a1.ToggleModal(true)
                end,
                Visible = a1.BannerVisible,
                Duration = v1,
            }),
            PortalBanner = if not a1.BannerPortal then nil else ReactRoblox.createPortal({
                Banner = if not a1.BannerPortal then nil else React.createElement(u73, {
                    Artwork = "rbxassetid://16455010681",
                    ForegroundArtwork = "rbxassetid://16455010332",
                    OriginalPrice = 740,
                    ProductId = 1759399952,
                    Title = "Starter Bundle!",
                    Duration = v1,
                    OnActivated = function() -- Line: 60 -- upvalues: a1 (val)
                        return a1.ToggleModal(true)
                    end,
                    Visible = a1.BannerVisible,
                }),
            }, a1.BannerPortal),
            Modal = React.createElement(Modal, {
                Visible = a1.ModalVisible,
                LeaveModal = function() -- Line: 85 -- upvalues: a1 (val)
                    return a1.ToggleModal(false)
                end,
                Purchase = a1.Purchase,
                Duration = v1,
            }),
        })
    end,
}