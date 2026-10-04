-- Script path: ReplicatedStorage.Content.Emote.Egg Launcher.Animator
-- Decompile time: 4.81 ms

local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local RobloxPhysics = require(ReplicatedStorage.Shared.Modules.RobloxPhysics)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local ToolTipKeybindStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ToolTipKeybindStore)
local v1 = {}
v1.__index = v1
local u60 = {}
u60.Shoot = {ActionText = "Shoot", Layout = 1, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonR2}
local u63 = {}
u63.Shoot = {
    ActionText = "Shoot",
    Layout = 1,
    ScaleMultiplier = 0.4,
    Icon = "LMB",
    IconSize = 1.35,
    Key = Enum.UserInputType.MouseButton1,
}

function v1:Initialize() -- Line: 48
    -- upvalues: Create (val), RunService (val), UserInputService (val), GuiService (val), ContextActionService (val)
    local Instance = self.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Humanoid = Instance:WaitForChild("Humanoid")
    local EggLauncher = Instance:WaitForChild("EggLauncher")
    EggLauncher:WaitForChild("LauncherMotor").Part0 = HumanoidRootPart
    EggLauncher.projectile.Transparency = 1
    local v1 = Create("Sound", {
        Name = "Shoot",
        Volume = 0.5,
        SoundId = ("rbxassetid://%*"):format(121722393014270),
        Parent = EggLauncher.gun,
    })
    v1.SoundGroup = game:GetService("SoundService").Emotes
    self.shootSound = v1
    if self.Preview then
        return
    end
    if self.Local then
        Humanoid.AutoRotate = false
    end
    local u44 = self:PreloadTrack("rbxassetid://126047333734059")
    local u48 = self:PreloadTrack("rbxassetid://83493986016638")
    local u49 = false
    self:OnTrackPlayed("rbxassetid://129529449582389", function(a1) -- Line: 75 -- upvalues: u48 (val), u49 (ref), self (val) -- types: a1: userdata
        task.wait(0.9)
        a1:Stop()
        u48:Play()
        u49 = true
        if self.Local then
            self:_enableShooting()
        end
    end)
    if not self.Local then
        self:OnTrackPlayed("rbxassetid://126047333734059", function() -- Line: 144 -- upvalues: self (val)
            self:_shoot()
        end)
    else
        self.Maid:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 87
            -- upvalues: u49 (ref), self (val), UserInputService (upval), GuiService (upval)
            if u49 then
                local Position = self.Character.Instance.HumanoidRootPart.Position
                local MouseLocation = UserInputService:GetMouseLocation()
                local X = MouseLocation.X
                local v1 = MouseLocation.Y - GuiService:GetGuiInset().Y
                local v2 = workspace.CurrentCamera:ViewportPointToRay(X, v1, 1)
                local v3 = workspace:Raycast(v2.Origin, v2.Direction * 200)
                local Position_2 = v2.Origin + v2.Direction * 200
                if v3 and v3.Position then
                    Position_2 = v3.Position
                end
                local v4 = Vector3.new(Position_2.X, Position.Y, Position_2.Z)
                self.Character.Root.CFrame = self.Character.Root.CFrame:Lerp(CFrame.new(Position, v4), a1 * 10)
            end
        end)))
        local v2 = ContextActionService
        local Value = Enum.ContextActionPriority.Low.Value
        local ButtonR2 = Enum.KeyCode.ButtonR2
        local MouseButton1 = Enum.UserInputType.MouseButton1
        local Touch = Enum.UserInputType.Touch
        v2:BindActionAtPriority("EggLauncherShoot", function(a1, a2) -- Line: 112 -- upvalues: u49 (ref), self (val), u44 (val)
            if not u49 or a2 ~= Enum.UserInputState.Begin then
                return
            end
            u49 = false
            self:_endShooting()
            u44:Play()
            self:_shoot()
            task.defer(function() -- Line: 126 -- upvalues: self (upval), u49 (upval)
                task.wait(2.5)
                if self._ended then
                    return
                end
                u49 = true
                self:_enableShooting()
            end)
            return Enum.ContextActionResult.Pass
        end, false, Value, ButtonR2, MouseButton1, Touch)
    end
end

local u71 = Create("Sound", {Name = "Bounce", Volume = 0.4, SoundId = "rbxassetid://103938850658937"})
local u80 = Create("Sound", {Name = "Explosion", Volume = 0.8, SoundId = ("rbxassetid://%*"):format(124874441949847)})

function v1._shoot(a1) -- Line: 162
    -- upvalues: EmitterManager (val), Create (val), RobloxPhysics (val), HttpService (val), u71 (val)
    -- upvalues: TimescaleUtilities (val), u80 (val)
    task.spawn(function() -- Line: 163
        -- upvalues: a1 (val), EmitterManager (upval), Create (upval), RobloxPhysics (upval), HttpService (upval)
        -- upvalues: u71 (upval), TimescaleUtilities (upval), u80 (upval)
        local Instance = a1.Character.Instance
        local EggLauncher = Instance:WaitForChild("EggLauncher")
        task.delay(0.1, function() -- Line: 167 -- upvalues: EmitterManager (upval), EggLauncher (val)
            EmitterManager.manualEmit(EggLauncher.gun.Attachment)
        end)
        task.wait(0.3)
        a1.shootSound:Play()
        local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
        local Attachment = EggLauncher:FindFirstChildWhichIsA("Attachment", true)
        local LookVector = HumanoidRootPart.CFrame.LookVector
        local u33 = EggLauncher.projectile:Clone()
        u33.Parent = workspace
        u33.Anchored = true
        u33.Transparency = 0
        u33.Size = u33.Size * 2.4
        for i, j in u33:GetDescendants() do
            if j:IsA("Trail") then
                j.Enabled = true
            end
        end
        local v1 = Create("Part", {
            Name = "Projectile",
            AudioCanCollide = false,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Size = Vector3.new(2, 2, 2),
            Transparency = 1,
            BottomSurface = Enum.SurfaceType.Smooth,
            CFrame = CFrame.identity,
            Shape = Enum.PartType.Ball,
            TopSurface = Enum.SurfaceType.Smooth,
        })
        local v2 = RobloxPhysics.new({
            gravity = Vector3.new(0, 25, 0),
            lifeTime = 4,
            noRotation = true,
            whiteList = {
                workspace:FindFirstChild("NewLobby"),
                workspace:FindFirstChild("Map"),
                workspace:FindFirstChild("Cliff"),
                (workspace:FindFirstChild("Ground")),
            },
            startPosition = Attachment.WorldPosition,
            velocity = LookVector * 30 + Vector3.new(0, 10, 0),
            object = v1,
            UID = HttpService:GenerateGUID(false),
            onHit = function(a1, a2) -- Line: 219 -- upvalues: u71 (upval), u33 (val), TimescaleUtilities (upval)
                local v1 = u71:Clone()
                v1.Parent = u33
                v1.SoundGroup = game:GetService("SoundService").Emotes
                v1.PlaybackSpeed = 1 + math.random() * 0.4
                v1:Play()
                TimescaleUtilities.CleanUp(v1, 3)
                a1:Bounce({bounceFactor = 0.9})
            end,
            onStep = function(a1, a2) -- Line: 228 -- upvalues: u33 (val)
                u33.CFrame = (CFrame.new(a1.object.Position)) * CFrame.Angles(-math.rad(a1.elapsed * 445), math.rad(a1.elapsed * 205), (math.rad(a1.elapsed * 45)))
            end,
        })
        local u101 = u80:Clone()
        u101.Parent = u33
        u101.SoundGroup = game:GetService("SoundService").Emotes
        task.delay(4, function() -- Line: 242 -- upvalues: EmitterManager (upval), u33 (val), u101 (val), TimescaleUtilities (upval)
            EmitterManager.manualEmit(u33)
            u33.Transparency = 1
            u101:Play()
            TimescaleUtilities.CleanUp(u33, 2)
        end)
        v2:Initialize()
    end)
end

function v1:_enableShooting() -- Line: 257
    -- upvalues: ToolTipKeybindStore (val), UserInputService (val), u60 (val), u63 (val)
    if self.Local then
        ToolTipKeybindStore.addBinds(if not UserInputService.GamepadEnabled then u63 else if (UserInputService:GetLastInputType()) ~= Enum.UserInputType.Gamepad1 then u63 else u60)
    end
end

function v1:_endShooting() -- Line: 268 -- upvalues: ToolTipKeybindStore (val)
    if self.Local then
        ToolTipKeybindStore.reset()
    end
end

function v1.Destroy(a1) -- Line: 274 -- upvalues: ContextActionService (val)
    a1._ended = true
    if a1.Local and not a1.Preview then
        a1.Character.Instance.Humanoid.AutoRotate = true
        a1:_endShooting()
        ContextActionService:UnbindAction("EggLauncherShoot")
    end
end

return v1