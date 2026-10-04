-- Script path: ReplicatedStorage.Content.Maps.Blind Faith.Animator.Events.MapEffects
-- Decompile time: 4.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local CutSceneController = require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u36 = {}
local u38 = Maid.new()
local u40 = Maid.new()

local function getOrientation(a1) -- Line: 15 -- types: a1: userdata
    local v1, v2, v3 = a1:ToOrientation()
    return (Vector3.new(math.deg(v1), math.deg(v2), (math.deg(v3))))
end

local function toggleModel(a1, a2) -- Line: 20 -- types: a1: userdata, a2: boolean
    local v1
    local v2 = a2
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") or j:IsA("Decal") or j:IsA("Beam") or j:IsA("ParticleEmitter") then
            j.LocalTransparencyModifier = if not v2 then 1 else 0
        end
        if j:IsA("BasePart") then
            v1 = if not v2 then false else j.Transparency < 1
            j.CanCollide = v1
        end
    end
end

local function stopAllAnimations(a1) -- Line: 37 -- types: a1: userdata
    for i, j in a1:GetPlayingAnimationTracks() do
        j:Stop()
    end
end

local function getCharacters(a1) -- Line: 43 -- types: a1: userdata
    local Environment = a1.Environment
    return {
        riftWalker = Environment:FindFirstChild("RiftWalkerStruggle"),
        kronus = Environment:FindFirstChild("KronusHold"),
        narrator = Environment:FindFirstChild("Narrator"),
    }
end

local function kronusJumpOut(a1) -- Line: 57
    -- upvalues: Bezier (val), GameState (val), TimescaleUtilities (val), TweenService (val), u38 (val)
    local Animation = a1:WaitForChild("Animation")
    local JumpAnimation = a1:WaitForChild("JumpAnimation")
    local Pivot = a1:GetPivot()
    local v1 = Pivot + Vector3.new(50, 0, 100)
    local u26 = Bezier.new(Pivot.Position, ((v1:Lerp(v1, 0.5)) + Vector3.new(0, 100, 0)).Position, v1.Position)
    local Animator = a1.AnimationController.Animator
    for i, j in Animator:GetPlayingAnimationTracks() do
        j:Stop()
    end
    local u46 = Animator:LoadAnimation(JumpAnimation)
    u46.Looped = false
    u46:AdjustSpeed(GameState.TimeScale)
    repeat
        task.wait()
    until u46.Length
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = 0
    NumberValue.Changed:Connect(function(a1_2) -- Line: 80 -- upvalues: a1 (val), u26 (val), Pivot (val)
        a1:PivotTo((CFrame.new(u26:Get(a1_2))) * Pivot.Rotation)
    end)
    u46:Play()
    TimescaleUtilities.Delay(u46.Length * 0.95, function() -- Line: 85 -- upvalues: u46 (val)
        u46:AdjustSpeed(0)
    end)
    local v2 = TweenService
    local PrimaryPart = a1.PrimaryPart
    local v3 = TweenInfo.new(0.35, Enum.EasingStyle.Linear)
    local v4 = {}
    local v5, v6, v7 = CFrame.lookAt(Pivot.Position, v1.Position):ToOrientation()
    v4.Orientation = Vector3.new(math.deg(v5), math.deg(v6), (math.deg(v7)))
    v2:Create(PrimaryPart, v3, v4):Play()
    TimescaleUtilities.Delay(0.4, function() -- Line: 93 -- upvalues: TweenService (upval), NumberValue (ref), TimescaleUtilities (upval)
        TweenService:Create(NumberValue, TweenInfo.new(4), {Value = 1}):Play()
        TimescaleUtilities.Wait(2)
        if NumberValue then
            NumberValue:Destroy()
            NumberValue = nil
        end
    end)
    u38:Mark(function() -- Line: 106
        -- upvalues: NumberValue (ref), u46 (val), Animator (val), Animation (val), a1 (val), Pivot (val)
        if NumberValue then
            NumberValue:Destroy()
            NumberValue = nil
        end
        u46:Stop()
        for i, j in Animator:GetPlayingAnimationTracks() do
            j:Stop()
        end
        Animator:LoadAnimation(Animation):Play()
        a1:PivotTo(Pivot)
    end)
end

local function initEnvironment(a1) -- Line: 120
    -- upvalues: u38 (val), u40 (val), CutSceneController (val), u36 (val), getCharacters (val), toggleModel (val)
    u38:Sweep()
    u40:Sweep()
    u38:Mark((CutSceneController.CutSceneFinished:Connect(function(a1_2) -- Line: 124 -- upvalues: u36 (upval), a1 (val)
        if a1_2 == "NullNight3Cutscene2" then
            u36.onWave(a1, 30)
        end
    end)))
    for i, j in getCharacters(a1) do
        toggleModel(j, false)
        u40:Mark(function() -- Line: 133 -- upvalues: toggleModel (upval), j (val)
            toggleModel(j, true)
        end)
    end
end

function u36.init(a1) -- Line: 139 -- upvalues: initEnvironment (val) -- types: a1: userdata
    initEnvironment(a1)
end

function u36.cleanup(a1) -- Line: 143 -- upvalues: initEnvironment (val) -- types: a1: userdata
    initEnvironment(a1)
end

function u36.onWave(a1, a2) -- Line: 147
    -- upvalues: CutSceneController (val), u40 (val), getCharacters (val), toggleModel (val), u38 (val)
    -- upvalues: kronusJumpOut (val)
    if a2 < 1 then
        return
    end
    if a2 == 1 then
        CutSceneController.WaitForCutScene("NullNight3Cutscene1"):expect()
        u40:Sweep()
    end
    if not (a2 >= 20) then
        if a2 > 29 then
            for k, n in getCharacters(a1) do
                local Parent = n.Parent
                n.Parent = nil
                u38:Mark(function() -- Line: 177 -- upvalues: n (val), Parent (val)
                    n.Parent = Parent
                end)
            end
        end
        return
    end
    local u19 = getCharacters(a1)
    if u19.kronus and u19.riftWalker then
        toggleModel(u19.riftWalker.VFX, false)
        u38:Mark(function() -- Line: 165 -- upvalues: toggleModel (upval), u19 (val)
            toggleModel(u19.riftWalker.VFX, true)
        end)
        kronusJumpOut(u19.kronus)
        if a2 > 29 then
            for i, j in getCharacters(a1) do
                local Parent = j.Parent
                j.Parent = nil
                u38:Mark(function() -- Line: 177 -- upvalues: j (val), Parent (val)
                    j.Parent = Parent
                end)
            end
        end
        return
    end
end

return u36