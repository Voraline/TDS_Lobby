-- Script path: ReplicatedStorage.Client.Controllers.Lobby.StatuesController.Types.Animated
-- Decompile time: 7.16 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
require(ReplicatedStorage.Shared.Modules.Scheduler)
local LocalPlayer = Players.LocalPlayer
local u27 = nil
local u28 = {}
local u29 = {}
u29.__index = u29
local u40 = Create("Part", {
    Name = "Hitbox",
    Size = Vector3.new(50, 50, 50),
    CastShadow = false,
    CanCollide = false,
    Anchored = true,
    Transparency = 1,
    Color = Color3.fromRGB(255, 89, 89),
    Material = Enum.Material.SmoothPlastic,
    Shape = Enum.PartType.Ball,
})

local function getConfig(a1) -- Line: 28 -- types: a1: userdata
    local Head = a1:FindFirstChild("Head")
    local LowerTorso = a1:FindFirstChild("LowerTorso") or a1:FindFirstChild("Torso")
    local HumanoidRootPart = a1:FindFirstChild("HumanoidRootPart")
    if Head and LowerTorso and HumanoidRootPart then
        local Config = a1:FindFirstChild("Config")
        local Neck = Config and Config:FindFirstChild("Neck")
        local Waist = Config and Config:FindFirstChild("Waist")
        if Neck and Waist then
            local Value = Neck.Value
            local Value_2 = Waist.Value
            if Value and not Value:IsA("Motor6D") then
                Value = nil
            end
            if Value_2 and not Value_2:IsA("Motor6D") then
                Value_2 = nil
            end
            if Value and Value_2 then
                return {
                    Head = Head,
                    Torso = LowerTorso,
                    RootPart = HumanoidRootPart,
                    Joints = {Neck = Value, Waist = Value_2},
                    Origins = {
                        Neck = if Value == nil then nil else Value.C0,
                        Waist = if Value_2 == nil then nil else Value_2.C0,
                    },
                }
            end
            return nil
        end
        return
    end
end

function u29.new(a1) -- Line: 77 -- upvalues: u29 (val) -- types: a1: userdata
    local v1 = {_model = a1, _config = {}}
    local v2 = setmetatable(v1, u29)
    v2:init()
    return v2
end

function u29:init() -- Line: 88 -- upvalues: getConfig (val), u40 (val), Players (val), u28 (ref)
    local _model = self._model
    local Character = _model:FindFirstChild("Character")
    if Character and Character:IsA("Model") then
        _model = Character
    end
    local Animation = _model:WaitForChild("Animation")
    local AnimationController = _model:FindFirstChild("Humanoid")
    if not AnimationController then
        AnimationController = _model:WaitForChild("AnimationController")
    end
    local Breakers = _model:FindFirstChild("Breakers")
    local Children = Breakers and Breakers:GetChildren()
    local u36 = if not Breakers then nil else {}

    local function playTrack() -- Line: 104 -- upvalues: AnimationController (ref), Animation (val), _model (ref)
        local u4 = AnimationController:LoadAnimation(Animation)
        u4.Looped = true
        if not _model:GetAttribute("Disabled") then
            u4:Play()
        end
        u4:AdjustSpeed(_model:GetAttribute("AnimationSpeed") or 1)
        ;(_model:GetAttributeChangedSignal("Disabled")):Connect(function() -- Line: 115 -- upvalues: _model (upval), u4 (val)
            if _model:GetAttribute("Disabled") then
                u4:Stop()
                return
            end
            u4:Play()
        end)
    end

    _model.ChildAdded:Connect(function(a1) -- Line: 124 -- upvalues: AnimationController (ref), playTrack (val) -- types: a1: userdata
        if a1.Name == "Humanoid" then
            AnimationController = a1
            playTrack()
        end
    end)
    if Children then
        for i, j in Children do
            table.insert(u36, (AnimationController:LoadAnimation(j)))
        end
        self._thread = task.spawn(function() -- Line: 138 -- upvalues: _model (ref), u36 (val)
            local v1
            while task.wait(math.random(5, 10)) do
                if not _model:GetAttribute("Disabled") then
                    v1 = u36[(math.random(1, #u36))]
                    v1:Play()
                    v1.Ended:Wait()
                end
            end
        end)
    end
    playTrack()
    self._config = getConfig(_model)
    local v1 = u40:Clone()
    local HumanoidRootPart = _model:FindFirstChild("HumanoidRootPart") or _model:FindFirstChild("RootPart")
    v1.CFrame = HumanoidRootPart.CFrame
    v1.Parent = _model
    self._hitBox = v1
    v1.Touched:Connect(function(a1) -- Line: 164 -- upvalues: Players (upval), u28 (upval), self (val)
        if a1.Name ~= "HumanoidRootPart" or a1.Parent ~= Players.LocalPlayer.Character then
            return
        end
        u28[self] = true
    end)
    v1.TouchEnded:Connect(function(a1) -- Line: 176 -- upvalues: Players (upval), u28 (upval), self (val)
        if a1.Name ~= "HumanoidRootPart" or a1.Parent ~= Players.LocalPlayer.Character then
            return
        end
        u28[self] = nil
    end)
end

function u29:Destroy() -- Line: 189 -- upvalues: u28 (ref)
    if self._thread then
        pcall(task.cancel, self._thread)
    end
    if self._hitBox then
        self._hitBox:Destroy()
    end
    if self._model then
        u28[self] = nil
    end
end

function u29:Step(a2, a3) -- Line: 204 -- types: self: table, a2: userdata, a3: vector
    local _config = self._config
    if not _config and not self._model:GetAttribute("Disabled") then
        return
    end
    local Joints = _config.Joints
    local Origins = _config.Origins
    local Magnitude = (a2.Position - _config.RootPart.Position).Magnitude
    if Magnitude > 30 then
        return
    end
    if Magnitude > 15 then
        if Joints.Neck then
            Joints.Neck.C0 = Joints.Neck.C0:lerp(Origins.Neck, 0.1)
        end
        if Joints.Waist then
            Joints.Waist.C0 = Joints.Waist.C0:lerp(Origins.Waist, 0.1)
        end
        return
    end
    local LookVector = _config.Torso.CFrame.LookVector
    local Magnitude_2 = (_config.Head.Position - a3).Magnitude
    local v1 = _config.Head.CFrame.Y - a3.Y
    if Joints.Neck then
        Joints.Neck.C0 = Joints.Neck.C0:lerp(
            Origins.Neck * CFrame.Angles(-(math.atan(v1 / Magnitude_2) * 0.5), (_config.Head.Position - a3).Unit:Cross(LookVector).Y * 1, 0),
            0.1
        )
    end
    if Joints.Waist then
        Joints.Waist.C0 = Joints.Waist.C0:lerp(
            Origins.Waist * CFrame.Angles(-(math.atan(v1 / Magnitude_2) * 0.5), (_config.Head.Position - a3).Unit:Cross(LookVector).Y * 0.5, 0),
            0.1
        )
    end
end

RunService.Stepped:Connect(function() -- Line: 259 -- upvalues: u27 (ref), LocalPlayer (val), u28 (ref)
    local v1 = u27
    u27 = LocalPlayer.Character
    if not u27 then
        return
    end
    if v1 ~= u27 then
        u28 = {}
    end
    local HumanoidRootPart = u27:FindFirstChild("HumanoidRootPart")
    local Head = u27:FindFirstChild("Head")
    if HumanoidRootPart and Head then
        for i in u28 do
            i:Step(HumanoidRootPart, Head.Position)
        end
        return
    end
end)
return u29