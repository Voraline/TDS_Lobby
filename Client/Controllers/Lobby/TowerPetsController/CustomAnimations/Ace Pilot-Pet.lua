-- Script path: ReplicatedStorage.Client.Controllers.Lobby.TowerPetsController.CustomAnimations.Ace Pilot-Pet
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u16 = require(ReplicatedStorage.Shared.Modules.Maid).new()
return function(a1) -- Line: 7 -- upvalues: u16 (val), RunService (val)
    local u2 = CFrame.new()
    u16:Mark((RunService.Stepped:Connect(function(a1_2, a2) -- Line: 10 -- upvalues: a1 (val), u2 (ref)
        if not a1.Parent then
            return
        end
        u2 = u2 * CFrame.Angles(0, 0, (math.rad(1800 * a2)))
        a1.Weapon.Propeller.Motor.Transform = u2
    end)))
    return function() -- Line: 18 -- upvalues: u16 (upval)
        u16:Sweep()
    end
end