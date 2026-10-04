-- Script path: ReplicatedStorage.Content.Consumables.Supply Drop.Controller
-- Decompile time: 3.35 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local Player = require(ServerStorage.Server.Modules.Player)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
return {
    CreateContext = function(a1) -- Line: 17
        local v1 = CFrame.new(a1.position, a1.position - a1.direction * Vector3.new(1, 0, 1))
        a1.startPosition = v1 * CFrame.new(0, 60, -300)
        a1.endPosition = v1 * CFrame.new(0, 60, 300)
        a1.cashGiven = 1000
        a1.tweenTime = 9
    end,
    OnUse = function(a1) -- Line: 28
        -- upvalues: TypedPromise (val), TimescaleUtilities (val), Create (val), ReplicatedStorage (val), Players (val)
        -- upvalues: Comma (val), spr (val), Network (val), Player (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 29
            -- upvalues: TimescaleUtilities (upval), a1 (val), Create (upval), ReplicatedStorage (upval)
            -- upvalues: Players (upval), Comma (upval), spr (upval), Network (upval), Player (upval)
            TimescaleUtilities.Delay(a1.Context.tweenTime / 2 + 5.499, function() -- Line: 30
                -- upvalues: Create (upval), ReplicatedStorage (upval), a1 (upval), Players (upval), Comma (upval)
                -- upvalues: spr (upval), Network (upval), Player (upval), a1_2 (val), a3 (val)
                local v1 = Create("Sound", {SoundId = "rbxassetid://17431361510", Volume = 1})
                local u11 = ReplicatedStorage.Assets.Effects.Client["Supply Drop"]:Clone()
                v1.Parent = u11.PrimaryPart
                v1:Play()
                u11.Parachute.Transparency = 1
                u11:PivotTo((CFrame.new(a1.Context.position)))
                u11.Parent = workspace.Terrain
                u11.PrimaryPart.Pickup.ProximityPrompt.Enabled = true
                u11.PrimaryPart.UI.BillboardGui.Frame.Owner.Text = ("%*'s"):format((Players:GetNameFromUserIdAsync(a1.Context.playerId)))
                u11.PrimaryPart.UI.BillboardGui.Frame.Value.Text = ("$%*"):format((Comma(a1.Context.cashGiven)))
                spr.target(u11.PrimaryPart.UI.BillboardGui.Frame.UIScale, 0.6, 3, {Scale = 1})
                u11.PrimaryPart.Pickup.ProximityPrompt.Triggered:Connect(function(a1_2) -- Line: 55 -- upvalues: a1 (upval), u11 (val), Network (upval), Comma (upval), Player (upval)
                    if a1_2.UserId ~= a1.Context.playerId then
                        (Network.Channel("Notification")):FireClient(a1_2, "Create", {
                            Text = "Error: This supply drop belongs to another player",
                            Color = Color3.fromRGB(255, 0, 0),
                        })
                        return
                    end
                    u11:Destroy()
                    ;(Network.Channel("ConsumableEvent")):FireAllClients("SupplyDropEffect", a1.Context.position + Vector3.new(0, 1, 0))
                    ;(Network.Channel("Notification")):FireClient(a1_2, "Create", {
                        Text = ("Claimed %* cash!"):format((Comma(a1.Context.cashGiven))),
                        Color = Color3.fromRGB(0, 255, 106),
                    })
                    ;(Player.GetEntityFromPlayer(a1_2)):AddCash(a1.Context.cashGiven)
                end)
                task.delay(60, function() -- Line: 78 -- upvalues: u11 (val), a1_2 (upval)
                    if u11 and u11.Parent then
                        u11:Destroy()
                    end
                    a1_2()
                end)
                a3(function() -- Line: 86 -- upvalues: u11 (val)
                    if u11 and u11.Parent then
                        u11:Destroy()
                    end
                end)
            end)
        end)
    end,
}