-- Script path: ReplicatedStorage.Content.Emote.Bumper Cart.Animator
-- Decompile time: 12.38 ms

local CollectionService = game:GetService("CollectionService")
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local DebugController = require(ReplicatedStorage.Client.Controllers.Shared.DebugController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local ToolTipKeybindStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ToolTipKeybindStore)
local BumperCart = NewNetwork.Channel("BumperCart")
local u56 = {}
u56.BumperCartHorn = {ActionText = "Honk", Layout = 1, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonR2}
local u59 = {}
u59.BumperCartHorn = {
    ActionText = "Honk",
    Layout = 1,
    ScaleMultiplier = 0.4,
    Icon = "LMB",
    IconSize = 1.35,
    Key = Enum.UserInputType.MouseButton1,
}
local LocalPlayer = Players.LocalPlayer
local u71 = workspace:WaitForChild("Type").Value == "Lobby"

local function getMap() -- Line: 55 -- upvalues: u71 (val)
    if u71 then
        return (workspace:FindFirstChild("NewLobby"))
    end
    return (workspace:FindFirstChild("Map"))
end

local u75 = RaycastParams.new()
u75.FilterType = Enum.RaycastFilterType.Include
u75.FilterDescendantsInstances = {CollectionService:GetTagged("BumperCarHitbox")}
local v1 = {}
v1.__index = v1
local u84 = {}
local Gizmo = DebugController.Gizmo
DebugController.createGizmo("BumperCartRays", function() -- Line: 70 -- upvalues: u84 (val), Gizmo (val)
    local v1 = nil
    local v2 = nil
    for i, j in u84, v1, v2 do
        for k, n in j do
            Gizmo.PushProperty(Gizmo.Styles.Color, Color3.fromRGB(255, 53, 144))
            Gizmo.PushProperty(Gizmo.Styles.AlwaysOnTop, true)
            Gizmo.Ray:Draw(n.position, n.position + n.direction)
        end
    end
end)

function v1.Initialize(a1) -- Line: 80
    -- upvalues: BumperCart (val), ToolTipKeybindStore (val), UserInputService (val), u56 (val), u59 (val)
    -- upvalues: ContextActionService (val), RunService (val), CollectionService (val), u71 (val), u75 (val)
    -- upvalues: LocalPlayer (val), Players (val), EmitterManager (val), u84 (val)
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Humanoid = Instance:WaitForChild("Humanoid")
    if a1.Preview then
        Humanoid.HipHeight = 2
        return
    end
    local BumperCart_2 = Instance:WaitForChild("BumperCart")
    a1._character = Instance
    a1._root = HumanoidRootPart
    a1._humanoid = Humanoid
    a1._running = true
    a1._lastBump = nil
    a1._hits = {}
    local u287 = a1:PlayTrack("rbxassetid://113681220936052")
    local u288 = a1:PlayTrack("rbxassetid://131073943836248")
    local u289 = a1:PlayTrack("rbxassetid://122344308383242")
    local u290 = a1:PlayTrack("rbxassetid://124336256419438")
    local Idle = BumperCart_2.Chassis.Idle
    local Volume = Idle.Volume
    Idle:Play()
    local Drive = BumperCart_2.Chassis.Drive
    local Volume_2 = Drive.Volume
    Drive:Play()
    local Bump = BumperCart_2.Chassis.Bump
    local u296 = 1
    local u297 = 0
    local u298 = Vector3.new()

    local function getTotalSpeed() -- Line: 115 -- upvalues: HumanoidRootPart (val), u298 (ref), u297 (ref)
        local v1 = if not ((HumanoidRootPart.CFrame.LookVector:Dot(u298)) <= 0) then -1 else 1
        return u297 + v1 * u298.Magnitude
    end

    local u277 = {}
    for k, v in pairs(BumperCart_2.Chassis.DriveParticles1:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
            table.insert(u277, v)
        end
    end
    for k2, i in pairs(BumperCart_2.Chassis.DriveParticles2:GetDescendants()) do
        if i:IsA("ParticleEmitter") or i:IsA("Trail") or i:IsA("Beam") then
            table.insert(u277, i)
        end
    end

    local function toggleParticles(a1) -- Line: 132 -- upvalues: u277 (val) -- types: a1: boolean
        for k, v in pairs(u277) do
            v.Enabled = a1
        end
    end

    if a1.Local then
        BumperCart:onEvent("HitBy", function(a1_2, a2) -- Line: 139 -- upvalues: a1 (val), u298 (ref) -- types: a1_2: vector, a2: number
            if not (15 < (math.abs(a2))) then
                a1:PlayTrack("rbxassetid://84454996571964")
            else
                a1:PlayTrack("rbxassetid://121461784486149")
            end
            u298 = a1_2 * a2
        end)
        ToolTipKeybindStore.addBinds(if not UserInputService.GamepadEnabled then u59 else if (UserInputService:GetLastInputType()) ~= Enum.UserInputType.Gamepad1 then u59 else u56)
        local v1 = ContextActionService
        local Value = Enum.ContextActionPriority.Low.Value
        local ButtonR2 = Enum.KeyCode.ButtonR2
        local MouseButton1 = Enum.UserInputType.MouseButton1
        local Touch = Enum.UserInputType.Touch
        v1:BindActionAtPriority("BumperCartHorn", function(a1, a2) -- Line: 157 -- upvalues: BumperCart (upval)
            if a2 ~= Enum.UserInputState.Begin then
                return
            end
            BumperCart:fireServer("Honk")
            return Enum.ContextActionResult.Pass
        end, false, Value, ButtonR2, MouseButton1, Touch)
        BumperCart:onEvent("Honk", function(a1) -- Line: 172
            local BumperCart = a1:FindFirstChild("BumperCart")
            if BumperCart then
                BumperCart.Chassis.Horn:Play()
            end
        end)
    end
    a1:PlayTrack("rbxassetid://86864440868562").Stopped:Wait()
    a1.conn = RunService.PostSimulation:Connect(function(a1_2) -- Line: 183
        -- upvalues: a1 (val), Humanoid (val), HumanoidRootPart (val), u297 (ref), u298 (ref), CollectionService (upval)
        -- upvalues: u71 (upval), u75 (upval), LocalPlayer (upval), Players (upval), BumperCart (upval)
        -- upvalues: BumperCart_2 (val), EmitterManager (upval), Bump (val), u84 (upval), u288 (val), u289 (val)
        -- upvalues: u287 (val), u290 (val), u296 (ref), Idle (val), Volume (val), Drive (val), Volume_2 (val)
        -- upvalues: u277 (val)
        local v1, v2
        if not a1._running then
            return
        end
        local MoveDirection = Humanoid.MoveDirection
        local v3 = HumanoidRootPart.CFrame:VectorToObjectSpace(MoveDirection)
        local v4 = -v3.Z * 30
        u297 = math.lerp(u297, v4, a1_2)
        u298 = u298:Lerp(Vector3.new(0, 0, 0), a1_2)
        if a1.Local then
            v1 = {}
            v2 = {CollectionService:GetTagged("BumperCartHitbox")}
            local NewLobby = if not u71 then workspace:FindFirstChild("Map") else workspace:FindFirstChild("NewLobby")
            if NewLobby then
                table.insert(v2, NewLobby)
            end
            u75.FilterDescendantsInstances = v2
            local v5 = if not ((HumanoidRootPart.CFrame.LookVector:Dot(u298)) <= 0) then -1 else 1
            local v6 = u297 + v5 * u298.Magnitude
            if 2 < (math.abs(v6)) then
                local CriticalHit, PlayerFromCharacter, Unit, Unit_2, Unit_3, v7, v8, v9, v10, v11, v12, v13
                for i = 0, 7 do
                    v7 = if not (v6 >= 0) then 1 else 0
                    v8 = i * 14.285714285714286 + -50
                    v9 = (math.cos((math.rad(v8))) * 0.25 + 0.75) * 4
                    Unit = ((HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(v7 * 180 + v8), 0) * CFrame.new(0, 0, -v9)).Position - HumanoidRootPart.Position).Unit
                    v10 = workspace:Raycast(HumanoidRootPart.Position, Unit * v9, u75)
                    v11 = i + 1
                    v1[v11] = {position = HumanoidRootPart.Position, direction = Unit * v9}
                    if v10 then
                        v11 = v1[i + 1]
                        v11.direction = Unit * v10.Distance
                        if a1.Player == LocalPlayer then
                            v11 = 1
                            if v10.Instance:HasTag("BumperCartHitbox") then
                                PlayerFromCharacter = Players:GetPlayerFromCharacter(v10.Instance.Parent)
                                if PlayerFromCharacter then
                                    if not a1._hits[PlayerFromCharacter]
                                        or 0.1 <= tick() - a1._hits[PlayerFromCharacter] then
                                        a1._hits[PlayerFromCharacter] = (tick())
                                        Unit_2 = (v10.Instance.Position - HumanoidRootPart.Position).Unit
                                        v11 = 2
                                        CriticalHit = BumperCart:invokeServer("Hit", PlayerFromCharacter, Unit_2, v6) and BumperCart_2.Chassis.CriticalHit or BumperCart_2.Chassis.Hit
                                        CriticalHit.WorldPosition = v10.Position
                                        EmitterManager.manualEmit(CriticalHit)
                                    end
                                end
                            end
                            Unit_3 = (HumanoidRootPart.Position - v10.Position).Unit
                            v12 = HumanoidRootPart.Position + (Vector3.new(Unit_3.X, 0, Unit_3.Z)) * (v9 - v10.Distance)
                            HumanoidRootPart.CFrame = CFrame.new(v12, v12 + HumanoidRootPart.CFrame.LookVector)
                            u297 = u297 * (-1 / v11)
                            u298 = u298 * (-1 / v11)
                            if not a1._lastBump or 0.5 < tick() - a1._lastBump then
                                v13 = if not ((HumanoidRootPart.CFrame.LookVector:Dot(u298)) <= 0) then -1 else 1
                                if not (15 < (math.abs(u297 + v13 * u298.Magnitude))) then
                                    a1:PlayTrack("rbxassetid://84454996571964")
                                else
                                    a1:PlayTrack("rbxassetid://121461784486149")
                                end
                                Bump.Pitch = Random.new():NextNumber(0.9, 1.1)
                                Bump:Play()
                                a1._lastBump = tick()
                            end
                        end
                    end
                    u84[HumanoidRootPart] = v1
                end
            end
            local v14 = HumanoidRootPart
            v14.CFrame = v14.CFrame * ((CFrame.new(0, 0, -u297 * a1_2)) * CFrame.new(u298 * a1_2))
            if 0 < (math.abs(MoveDirection.X)) then
                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + MoveDirection), a1_2 * 2)
            end
            u288:AdjustWeight((math.pow(math.clamp(v3.X, 0.01, 1), 2)))
            u289:AdjustWeight((math.pow(math.clamp(-v3.X, 0.01, 1), 2)))
            u287:AdjustWeight((math.clamp(-v3.Z, 0.01, 1)))
            u290:AdjustWeight((math.clamp(v3.Z, 0.01, 1)))
        end
        v1 = math.abs(v3.Z)
        u296 = math.lerp(u296, v1, a1_2)
        Idle.Volume = Volume * (1 - u296)
        Drive.Volume = Volume_2 * u296
        v2 = u297 > 2
        for k, v in pairs(u277) do
            v.Enabled = v2
        end
    end)
end

function v1.update(a1, a2) end

function v1.Destroy(a1) -- Line: 308 -- upvalues: u84 (val), ToolTipKeybindStore (val), ContextActionService (val)
    if a1.Preview then
        return
    end
    a1._running = false
    u84[a1._root] = nil
    if a1.conn then
        a1.conn:Disconnect()
    end
    if a1.Local then
        ToolTipKeybindStore.reset()
        ContextActionService:UnbindAction("BumperCartHorn")
    end
end

return v1