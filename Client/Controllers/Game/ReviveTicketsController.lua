-- Script path: ReplicatedStorage.Client.Controllers.Game.ReviveTicketsController
-- Decompile time: 3.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local PlayerController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.PlayerController)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local TicketsManager = Network.Channel("TicketsManager")
local u47 = FFlagController.get("revive.ticket_spend_disabled", false)
local v1 = {}
local u49 = false
local u50 = false

local function useTicket() -- Line: 20
    -- upvalues: u47 (val), u50 (ref), TicketsManager (val), u49 (ref), ViewController (val)
    if not u47() and not u50 then
        u50 = true
        local v1, v2 = TicketsManager:InvokeServer("UseReviveTicket")
        u50 = false
        if v1 then
            u49 = false
            ViewController:closePrompt()
            return
        end
        u49 = false
        ViewController:closePrompt()
        ViewController:notifyError(v2 or "Unknown error occured while using revive ticket")
        return
    end
end

function v1.showPrompt() -- Line: 40
    -- upvalues: u50 (ref), GameState (val), u47 (val), ViewController (val), u49 (ref), Icons (val)
    -- upvalues: PlayerController (val), useTicket (val), TicketsManager (val)
    if u50 then
        return
    end
    if not GameState.RevivesDisabled and GameState.Replicator:Get("ReviveAllowed") ~= false and not u47() then
        u49 = true
        ViewController:prompt({
            Override = true,
            Subject = "Use Revive Ticket",
            Description = "Would you like to use 1 revive ticket to restart the wave?",
            Icon = Icons.Revive,
            Buttons = {
                {
                    Text = "Confirm",
                    Color = Color3.fromRGB(10, 220, 80),
                    Clicked = function() -- Line: 65
                        -- upvalues: PlayerController (upval), useTicket (upval), TicketsManager (upval)
                        -- upvalues: ViewController (upval)
                        if 0 < (PlayerController:getReviveTickets()) then
                            useTicket()
                            return
                        end
                        if not TicketsManager:InvokeServer("PromptRevivePurchase") then
                            ViewController:notifyError("Unknown error occured while purchasing revive ticket")
                        end
                    end,
                },
                {
                    Text = "Cancel",
                    Color = Color3.fromRGB(220, 10, 10),
                    Clicked = function() -- Line: 81 -- upvalues: u49 (upval), ViewController (upval)
                        u49 = false
                        ViewController:closePrompt()
                    end,
                },
            },
        })
        return
    end
    ViewController:notifyError("Revive tickets are disabled")
end

;(GameState.Replicator:GetStateChangedSignal("GameStarted")):Connect(function(a1) -- Line: 90 -- upvalues: u49 (ref), ViewController (val)
    if a1 and u49 then
        u49 = false
        ViewController:closePrompt()
    end
end)
return v1