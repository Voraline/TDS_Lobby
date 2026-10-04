-- Script path: ReplicatedStorage.Content.Emote.Ascended.Animator
-- Decompile time: 1.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 7 -- upvalues: ReplicatedStorage (val), EffectsController (val)
    local v1
    local UpperTorso = a1.Character.Instance:WaitForChild("UpperTorso")
    local PVP_Wings = a1.Character.Instance:WaitForChild("PVP_Wings")
    local GroundSmash = PVP_Wings:WaitForChild("GroundSmash")
    GroundSmash.Parent = nil
    for i, j in {"L_Wing_Base", "R_Wing_Base"} do
        v1 = PVP_Wings:FindFirstChild(j)
        if v1 and v1:IsA("Motor6D") and v1.Part0 == nil then
            v1.Part0 = UpperTorso
        end
    end
    if not a1.preview then
        if not a1.groundSmash then
            a1.groundSmash = ReplicatedStorage.Assets.Effects.Particles:FindFirstChild("GroundSmash")
            if not a1.groundSmash then
                a1.groundSmash = GroundSmash:Clone()
                a1.groundSmash.Parent = ReplicatedStorage.Assets.Effects.Particles
            end
        end
        local u53 = RaycastParams.new()
        u53.FilterType = Enum.RaycastFilterType.Exclude
        u53.FilterDescendantsInstances = {a1.Character.Instance}
        a1:OnTrackPlayed("rbxassetid://71859085992356", function(a1_2) -- Line: 35 -- upvalues: a1 (val), u53 (val), EffectsController (upval) -- types: a1_2: userdata
            local u11 = workspace:Raycast(a1.Character.Instance.PrimaryPart.Position, Vector3.new(0, -10, 0), u53)
            if u11 and u11.Position then
                a1._connection = (a1_2:GetMarkerReachedSignal("Smash")):Connect(function() -- Line: 42 -- upvalues: EffectsController (upval), u11 (val)
                    EffectsController.GroundSmash(CFrame.new(u11.Position), 5)
                end)
            end
        end)
    end
    GroundSmash:Destroy()
end

function v1:Destroy() -- Line: 51
    if self._connection then
        self._connection:Disconnect()
        self._connection = nil
    end
end

return v1