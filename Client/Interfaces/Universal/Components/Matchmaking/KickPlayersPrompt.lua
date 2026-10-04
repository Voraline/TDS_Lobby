-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.KickPlayersPrompt
-- Decompile time: 1.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PromptModal = require(ReplicatedStorage.Client.Interfaces.Universal.Components.PromptModal)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 17 -- upvalues: createElement (val), PromptModal (val) -- types: a1: table
    local v1
    local v2 = {}
    local v3 = ipairs
    local players = a1.players or {}
    for i, v in v3(players) do
        v1 = {
            key = tostring(v.UserId),
            text = v.Name,
            color = Color3.new(0, 0.749019, 1),
            size = UDim2.fromOffset(240, 44),
            onClick = function() -- Line: 26 -- upvalues: a1 (val), v (val)
                if a1.onKick then
                    a1.onKick(v)
                end
            end,
        }
        v2[i] = v1
    end
    table.insert(v2, {
        key = "retry",
        text = "Retry",
        size = UDim2.fromOffset(240, 44),
        onClick = a1.onRetry,
    })
    table.insert(v2, {
        key = "cancel",
        text = "Cancel",
        size = UDim2.fromOffset(240, 44),
        onClick = a1.onCancel,
    })
    return createElement(PromptModal, {
        noBackground = true,
        icon = "rbxassetid://10777737541",
        subject = "Matchmaking Error",
        description = "The following players have not finished the prior acts and must be kicked from the party before matchmaking:",
        visible = a1.visible,
        position = UDim2.fromScale(0.5, 0.5),
        anchorPoint = Vector2.new(0.5, 0.5),
        actions = v2,
        playClick = a1.playClick,
    })
end