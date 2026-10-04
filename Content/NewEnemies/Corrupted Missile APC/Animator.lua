-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Missile APC.Animator
-- Decompile time: 5.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Shared.Modules.Animation)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u47 = {}
local u48 = {}
local v1 = {}
v1.__index = v1

function v1._face(a1, a2, a3) -- Line: 21
    -- upvalues: u48 (val), u47 (val), spr (val), RunService (val), GameState (val)
    local lookVector = a3.Part1.CFrame.lookVector
    local Unit = (a2 - a3.Part1.Position).Unit
    local v1 = math.deg((math.atan2(lookVector.Z, lookVector.X)) - (math.atan2(Unit.Z, Unit.X))) * 0.017453292519943295
    local C0 = a3.C0
    if not u48[a3] then
        u48[a3] = a3.C0
    end
    if u47[a3] then
        spr.stop(a3)
        u47[a3]:Disconnect()
    end
    a3.C0 = C0 * CFrame.Angles(0, v1, 0)
    local u52 = tick()
    u47[a3] = (RunService.Heartbeat:Connect(function(a1) -- Line: 44 -- upvalues: u52 (val), GameState (upval), spr (upval), a3 (val), u48 (upval), u47 (upval)
        if 4 < (tick() - u52) * GameState.TimeScale then
            spr.target(a3, 1, 0.5 * GameState.TimeScale, {C0 = u48[a3]})
            u47[a3]:Disconnect()
        end
    end))
end

function v1:_aimVertical(a2) -- Line: 52
    -- upvalues: ItemDrop (val), u47 (val), spr (val), u48 (val), RunService (val), GameState (val)
    local v1 = CFrame.Angles(math.atan2((self.Model.Weapon.Head.Position - (ItemDrop.StepWithGV(
        a2.start,
        a2.goal,
        0.5,
        a2.gravity,
        a2.velocity,
        ItemDrop.GetTimeToDestinationWithGV(a2.start, a2.goal, a2.gravity, a2.velocity)
    ))).magnitude, (a2.start - a2.goal).magnitude) * 2, 0, 0)
    for i = 1, 2 do
        local u50 = self.Model.Weapon.Head["AimAt" .. i]
        if u47[u50] then
            spr.stop(u50)
            u47[u50]:Disconnect()
        end
        if not u48[u50] then
            u48[u50] = u50.C0
        end
        u50.C0 = u48[u50] * v1
        local u75 = tick()
        u47[u50] = (RunService.Heartbeat:Connect(function(a1) -- Line: 85 -- upvalues: u75 (val), GameState (upval), spr (upval), u50 (val), u48 (upval), u47 (upval)
            if 4 < (tick() - u75) * GameState.TimeScale then
                spr.target(u50, 1, 0.5 * GameState.TimeScale, {C0 = u48[u50]})
                u47[u50]:Disconnect()
            end
        end))
    end
end

function v1:_fireMissile(a2, a3) -- Line: 94
    -- upvalues: Create (val), ItemDrop (val), EmitterManager (val)
    local Attribute
    self:_face(a2.goal, self.Model.Chasis.HeadRotate)
    local u16 = Create("Sound", {SoundId = "rbxassetid://17363713462", Volume = 1, Parent = self.Model.PrimaryPart})
    u16.PlaybackSpeed = Random.new():NextNumber(0.9, 1.1)
    u16:Play()
    u16.Ended:Connect(function() -- Line: 105 -- upvalues: u16 (val)
        u16:Destroy()
    end)
    local v1 = self.Model.Weapon.Head["Start" .. a3]
    a2.start = v1.WorldPosition
    local v2 = self.Model.Weapon.Rockets["Rocket" .. a3]
    local u49 = v2:Clone()
    u49.Anchored = true
    u49.Trail.Enabled = true
    u49.Attachment.Flames.Enabled = true
    u49.Parent = workspace
    u49.CFrame = CFrame.new(a2.start)
    u49.CanCollide = false
    ;(ItemDrop.Drop(a2.start, a2.goal, u49, a2.dtMultiplier, a2.gravity, a2.velocity, function(a1, a2, a3) -- Line: 128
        CFrame.new()
        local v1 = CFrame.lookAt(a2, a3)
        return (v1 - v1.Position) * CFrame.Angles(0, 3.141592653589793, 0)
    end)):andThen(function() -- Line: 134 -- upvalues: a2 (val), u49 (val), EmitterManager (upval)
        local goal = a2.goal
        u49:Destroy()
        EmitterManager.Emit("PurpleExplosion", CFrame.new(goal), a2.radius / 2)
    end)
    self:_aimVertical(a2)
    for i, j in v1:GetChildren() do
        Attribute = j:GetAttribute("EmitAmount")
        j:Emit(Attribute or 10)
    end
    v2.Transparency = 1
    if a3 == 4 then
        self:Delay(0.4)
        for i2, v in ipairs(self.Model.Weapon.Rockets:GetChildren()) do
            v.Transparency = 0
        end
    end
end

local function LeftOrRight() -- Line: 157
    if Random.new():NextInteger(0, 1) then
        return 1
    end
    return -1
end

function v1.Initialize(a1) -- Line: 167
    -- upvalues: EffectsController (val), ReplicatedStorage (val), spr (val), RunService (val)
    a1.PathOffset = 0
    if a1.Model.Name == "Fallen" then
        for i, j in a1.Model:GetDescendants() do
            if j:IsA("BasePart") and j.CanCollide then
                j.CanCollide = false
            end
        end
    end
    a1.Executables = {
        Missile = function(a1_2, a2) -- Line: 180 -- upvalues: a1 (val) -- types: a2: number
            a1:_fireMissile(a1_2, a2)
        end,
        Death = function(a1_2) -- Line: 184
            -- upvalues: a1 (val), EffectsController (upval), ReplicatedStorage (upval), spr (upval), RunService (upval)
            local v1
            a1.Dead = true
            local v2 = Random.new():NextNumber(-40, 40)
            local CFrame_2 = a1.Model.HumanoidRootPart.CFrame
            local new = CFrame.new
            local v3 = CFrame_2 * new((if not Random.new():NextInteger(0, 1) then -1 else 1) * 2.5, -0.5, 0) * CFrame.Angles(0, math.rad(v2), 0)
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("SpecialMesh") then
                    v.TextureId = ""
                elseif v:IsA("BasePart") then
                    v.BrickColor = BrickColor.new("Black")
                    v.Material = Enum.Material.CorrodedMetal
                    if v:IsA("MeshPart") then
                        v.TextureID = ""
                    end
                end
            end
            EffectsController.Explosion({Radius = 4, Position = a1.Model.Hitbox.Position})
            for i, j in ReplicatedStorage.Assets.Effects.Client.VehicleFlames:GetChildren() do
                v1 = j:Clone()
                v1.Parent = a1.Model.Hitbox
            end
            local NumberValue = Instance.new("NumberValue")
            NumberValue.Value = 1
            spr.target(a1.Model.HumanoidRootPart, 0.36, 2, {CFrame = v3})
            spr.target(NumberValue, 1, 3, {Value = 0.8})
            local v4 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 226 -- upvalues: a1 (upval), NumberValue (val)
                a1.Model:ScaleTo(NumberValue.Value)
            end)
            a1:Delay(a1_2)
            spr.stop(NumberValue)
            NumberValue:Destroy()
            if a1.Model and a1.Model.Parent and a1.Model:FindFirstChild("HumanoidRootPart") then
                spr.stop(a1.Model.HumanoidRootPart)
            end
            v4:Disconnect()
        end,
    }
end

return v1