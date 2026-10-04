-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Elements.Menus.Container.Modules.Achievements.Handlers.Rewards
-- Decompile time: 6.58 ms

local BadgeService = game:GetService("BadgeService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
require(ReplicatedStorage.Shared.Modules.Maid)
require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local Scroll = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Scroll)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local Rewards = require(ReplicatedStorage.Shared.Modules.Network).Channel("Rewards")
local LocalPlayer = Players.LocalPlayer
return function(a1) -- Line: 21
    -- upvalues: Cache (val), Asset (val), ReplicatedStorage (val), Scroll (val), BadgeService (val), Signal (val)
    -- upvalues: LocalPlayer (val), Rewards (val), Sound (val)
    local Rewards_2 = Cache("Rewards")
    local Rewards_3 = Asset("Rewards")
    local Reward = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Templates"):WaitForChild("Buttons"):WaitForChild("Reward")
    local u24 = {}
    local Holder = a1:WaitForChild("Holder")
    Scroll(Holder)

    local function _userHasBadge(a1, a2) -- Line: 36 -- upvalues: BadgeService (upval)
        local success, result = pcall(function() -- Line: 37 -- upvalues: BadgeService (upval), a1 (val), a2 (val)
            return BadgeService:UserHasBadgeAsync(a1, a2)
        end)
        return success and result
    end

    local function _createButton(a1, a2) -- Line: 44
        -- upvalues: Reward (val), Signal (upval), BadgeService (upval), LocalPlayer (upval), Rewards (upval)
        -- upvalues: Sound (upval), Holder (val)
        local u5 = Reward:Clone()
        local Rewards_2 = u5:WaitForChild("Rewards")
        local Button = Rewards_2:WaitForChild("Button")
        local Reward_2 = Rewards_2:WaitForChild("Reward")
        local Claim = Button:WaitForChild("Claim")
        local Claimed = Button:WaitForChild("Claimed")
        local Title = u5:WaitForChild("Title")
        local Description = u5:WaitForChild("Description")
        local Icon = u5:WaitForChild("Icon")
        Icon:WaitForChild("Check")
        local u44 = Signal.new()
        u44:Connect(function(a1) -- Line: 63 -- upvalues: Claim (val), Claimed (val)
            if a1 then
                Claim.Visible = false
                Claimed.Visible = true
            end
        end)
        task.spawn(function() -- Line: 74
            -- upvalues: a2 (val), BadgeService (upval), Title (val), u5 (val), Description (val), Icon (val)
            -- upvalues: LocalPlayer (upval), Button (val), Rewards (upval), a1 (val), u44 (val), Sound (upval)
            -- upvalues: Claim (val)
            local Badge = a2.Badge
            local success, result = pcall(function() -- Line: 77 -- upvalues: BadgeService (upval), Badge (val)
                return BadgeService:GetBadgeInfoAsync(Badge)
            end)
            if success and result then
                Title.Text = result.Name
                u5.Name = result.Name
                Description.Text = result.Description
                Icon.Image = "rbxassetid://" .. result.IconImageId
                u5.Visible = result.IsEnabled and true
            end
            local UserId = LocalPlayer.UserId
            local Badge_2 = a2.Badge
            local success_2, result_2 = pcall(function() -- Line: 37 -- upvalues: BadgeService (upval), UserId (val), Badge_2 (val)
                return BadgeService:UserHasBadgeAsync(UserId, Badge_2)
            end)
            if success_2 and result_2 then
                local Detector = Button:WaitForChild("Detector")
                local u33 = nil
                local v1 = Detector.MouseButton1Click:Connect(function() -- Line: 99 -- upvalues: Rewards (upval), a1 (upval), u33 (ref), u44 (upval), Sound (upval)
                    if Rewards:InvokeServer("Claim", a1) then
                        u33:Disconnect()
                        u44:Fire(true)
                        Sound("Obtain"):Play()
                    end
                end)
                if not Rewards:InvokeServer("Check", a1) then
                    u44:Fire(true)
                else
                    Claim.Visible = true
                end
                Button.Visible = true
            end
        end)
        Reward_2.Text = a2.Reward
        u5.Parent = Holder
        return u44
    end

    local function _updateButtons(a1) -- Line: 140 -- upvalues: u24 (val)
        local v1
        for k, v in pairs(a1) do
            v1 = u24[k]
            if v1 then
                v1:Fire(v)
            end
        end
    end

    for k, v in pairs(Rewards_3) do
        u24[k] = (_createButton(k, v))
    end
    Rewards_2.Updated:Connect(_updateButtons)
    Rewards_2:Get():andThen(_updateButtons)
end