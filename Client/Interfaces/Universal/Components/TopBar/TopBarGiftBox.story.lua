-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TopBar.TopBarGiftBox.story
-- Decompile time: 1.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Giftbox = require(ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Elements.Menus.Container.Modules.Giftbox)
local Giftbox_2 = ReplicatedStorage.Assets.Templates.UI.Giftbox
local u20 = {}
u20[1] = {
    Cover = 9361085943,
    Sender = "Daily Gift",
    Reward = "500 Coins",
    RewardIcon = 6031068426,
    Clicked = function() -- Line: 14
        return true
    end,
}
local u23 = {}
u23[1] = {
    Cover = 9361085943,
    Sender = "Duck Hunting",
    Reward = "Ducky Commander",
    RewardIcon = 9378098303,
    Clicked = function() -- Line: 26
        return true
    end,
}
return function(a1) -- Line: 32 -- upvalues: Giftbox_2 (val), Giftbox (val), u20 (val), u23 (val)
    local u4 = Giftbox_2:Clone()
    u4.Name = "TopBarGiftBoxStory"
    u4.Position = UDim2.fromOffset(0, 0)
    u4.Size = UDim2.fromOffset(380, 360)
    u4.Parent = a1
    Giftbox.Container = u4.Content
    Giftbox:Initialize({
        ListenForUpdates = false,
        Load = false,
        Open = true,
        Gifts = u20,
        Seasons = u23,
    })
    return function() -- Line: 48 -- upvalues: Giftbox (upval), u4 (val)
        Giftbox:Destroy()
        u4:Destroy()
    end
end