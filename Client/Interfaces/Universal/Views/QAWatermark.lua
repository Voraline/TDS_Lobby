-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.QAWatermark
-- Decompile time: 1.97 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Interfaces = ReplicatedStorage.Client.Interfaces
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local LocalPlayer = Players.LocalPlayer
local u35 = FFlagController.get("qa_watermark.active", false)
local Watermark = require(Interfaces.Universal.Components.Watermark)
local u41 = {230717039}
return function() -- Line: 25
    -- upvalues: useState (val), useEffect (val), u41 (val), LocalPlayer (val), u35 (val), RunService (val)
    -- upvalues: createElement (val), Watermark (val)
    local u2, u3 = useState(false)
    local v1 = {u2}
    useEffect(function() -- Line: 28 -- upvalues: u2 (val), u41 (upval), LocalPlayer (upval), u3 (val)
        if u2 then
            return
        end
        if table.find(u41, LocalPlayer.UserId) then
            u3(true)
            return
        end
        u3(251 <= (LocalPlayer:GetRankInGroup(4914494)))
    end, v1)
    if u35() and not RunService:IsStudio() and not u2 then
        return createElement(Watermark, {Text = ("%* (%*)"):format(LocalPlayer.Name, LocalPlayer.UserId)})
    end
    return nil
end