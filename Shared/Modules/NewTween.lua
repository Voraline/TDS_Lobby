-- Script path: ReplicatedStorage.Shared.Modules.NewTween
-- Decompile time: 1.01 ms

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local GameState = require(game.ReplicatedStorage.Shared.Modules.GameState)
local Heartbeat = RunService:IsServer() and RunService.Heartbeat or RunService.RenderStepped
local u23 = {}
Heartbeat:Connect(function(a1) -- Line: 15 -- upvalues: u23 (val), GameState (val), TweenService (val)
    local Value, v1
    local v2 = nil
    local v3 = nil
    for i, j in u23, v2, v3 do
        v1 = u23[i]
        v1.elasped = v1.elasped + a1 / j.tweeninfo.Time * GameState.TimeScale
        Value = TweenService:GetValue(u23[i].elasped, j.tweeninfo.EasingStyle, j.tweeninfo.EasingDirection)
        if Value >= 1 then
            Value = 1
            u23[i] = nil
            if j.onFinish then
                j.onFinish()
            end
        end
        if not i.Parent then
            u23[i] = nil
            return
        end
        j.callback(Value)
    end
end)
return function(a1, a2, a3, a4) -- Line: 41 -- upvalues: u23 (val) -- types: a2: userdata, a3: function, a4: function?
    if u23[a1] then
        u23[a1] = nil
    end
    u23[a1] = {elasped = 0, callback = a3, onFinish = a4, tweeninfo = a2}
end