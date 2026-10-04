-- Script path: ReplicatedStorage.Content.Tower.Elementalist.Animator
-- Decompile time: 7.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Children = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Client")):WaitForChild("ScrapMetal"):GetChildren()
local v1 = {}
v1.__index = v1
local u97 = {}
u97[true] = (Color3.fromRGB(12, 239, 255))
u97[false] = (Color3.fromRGB(255, 22, 138))
local u110 = {}
u110.Frost = Color3.fromRGB(0, 255, 255)
u110.Fire = Color3.fromRGB(255, 166, 0)
local u121 = {}
u121.Frost = Color3.fromRGB(93, 171, 159)
u121.Fire = Color3.fromRGB(146, 165, 82)
local u132 = {Frost = "Fire", Fire = "Frost"}
local u136 = RaycastParams.new()

function v1:_pathPlacement() -- Line: 52
    -- upvalues: TypedPromise (val), Maid (val), ReplicatedStorage (val), spr (val), RunService (val)
    -- upvalues: PathPlacementCursorController (val), u136 (val), u97 (val), SharedControllerFunctions (val)
    if self._currentPromise then
        self._currentPromise:cancel()
        self._currentPromise = nil
    end
    if self._placement then
        self._placement:cancel()
        self._placement = nil
    end
    self.Maid:Mark(function() -- Line: 63 -- upvalues: self (val)
        if self._currentPromise then
            self._currentPromise:cancel()
            self._currentPromise = nil
        end
    end)
    self._currentPromise = TypedPromise.new(function(a1, a2, a3) -- Line: 70
        -- upvalues: self (val), Maid (upval), ReplicatedStorage (upval), spr (upval), RunService (upval)
        -- upvalues: PathPlacementCursorController (upval), u136 (upval), u97 (upval), SharedControllerFunctions (upval)
        if self._maid then
            self._maid:Sweep()
        end
        local u12 = Maid.new()
        self._maid = u12

        local function finish(...) -- Line: 79 -- upvalues: u12 (val), self (upval), a1 (val)
            u12:Sweep()
            self._currentPromise = nil
            a1(...)
        end

        a3(function() -- Line: 86 -- upvalues: self (upval), u12 (val)
            self._currentPromise = nil
            u12:Sweep()
        end)
        local Range = self:GetRange()
        local v1 = ReplicatedStorage.Assets.Effects.Client.Circle:Clone()
        v1.Size = Vector3.new(0, 0, 0)
        spr.target(v1, 0.6, 4, {Size = Vector3.new(Range * 2, 0, Range * 2)})
        v1.Position = self.BottomPosition
        v1.Parent = workspace.Trash
        u12:Mark(v1)
        self.crossHair = ReplicatedStorage.Assets.Effects.Client.Reposition_Crosshair:Clone()
        self.crossHair.Parent = workspace.Terrain
        self.crossHair:ScaleTo(0.5)
        local OuterTarget = self.crossHair.OuterRing.OuterTarget
        self:ToggleReposition({enabled = true, range = Range})
        u12:Mark(function() -- Line: 113 -- upvalues: self (upval)
            self:ToggleReposition({enabled = false})
            self.crossHair:Destroy()
        end)
        local u85 = nil
        local u86 = nil
        u12:Mark((RunService.RenderStepped:Connect(function(a1) -- Line: 122
            -- upvalues: u85 (ref), PathPlacementCursorController (upval), self (upval), u136 (upval), OuterTarget (val)
            -- upvalues: Range (val), u97 (upval), u86 (ref)
            u85 = PathPlacementCursorController.CurrentPosition
            local Cross = self.crossHair.OuterRing.Cross
            Cross.CFrame = Cross.CFrame * CFrame.Angles(0, math.rad(90 * a1), 0)
            local v1 = workspace
            local v2 = u85 + Vector3.new(0, 100, 0)
            local v3 = u136
            v1 = v1:Raycast(v2, Vector3.new(0, -1000, 0), v3)
            v2 = if not v1 then CFrame.new(u85) else CFrame.new(v1.Position)
            OuterTarget.CFrame = v2
            self.crossHair:PivotTo((CFrame.new(u85)) * (CFrame.new(0, 0.025, 0)))
            if not (Range < (u85 - self.Model.HumanoidRootPart.Position).Magnitude) then
                self.crossHair.Highlight.FillColor = u97[not PathPlacementCursorController.CantPlace]
            else
                self.crossHair.Highlight.FillColor = u97[false]
            end
            u86 = v1 and v1.Position or u85
        end)))
        local u98 = SharedControllerFunctions.getPlacement()
        self._placement = u98
        u12:Mark(function() -- Line: 148 -- upvalues: u98 (val), self (upval)
            u98:cancel()
            if self._placement == u98 then
                self._placement = nil
            end
        end)
        local v2 = u98:awaitStatus()
        if Range < (u85 - self.Model.HumanoidRootPart.Position).Magnitude or v2 == "Rejected" then
            finish(false)
            return
        end
        finish(u86)
    end)
    return self._currentPromise
end

function v1:_playAnimation(a2, a3) -- Line: 173 -- types: self: table, a2: string
    return self:Animate(a2, nil, {a3 or 0.1})
end

function v1:_playSound(a2) -- Line: 177 -- upvalues: EasySound (val) -- types: self: table, a2: string
    local v1 = self.Model.HumanoidRootPart:FindFirstChild(a2)
    if v1 and v1:IsA("Sound") then
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = v1.SoundId,
            parent = self.Model.HumanoidRootPart,
            playbackSpeed = v1.PlaybackSpeed,
        })
    end
end

function v1:_fireTarget(a2) -- Line: 191
    -- upvalues: SharedControllerFunctions (val), Enum (val), EmitterManager (val), u110 (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    self:Face(Position)
    SharedControllerFunctions.AimArmsAt(self, Position)
    SharedControllerFunctions.AimHeadAt(self, Position_2)
    local v1 = Enum.Element.ToString(self.Options.Element)
    EmitterManager.manualEmit(self.Model.Weapon.Gun.Handle[v1])
    self:_playSound(v1)
    self:Bullet({
        Size = 0.05,
        Spread = 20,
        Start = self.Model.Weapon.Gun.Handle.Fire.WorldPosition,
        End = Position,
        Color = u110[(Enum.Element.ToString(self.Options.Element))] or nil,
    })
end

function v1.Initialize(a1) -- Line: 223
    -- upvalues: u136 (val), EffectsController (val), Children (val), TimescaleUtilities (val), Enum (val)
    -- upvalues: TweenService (val), u121 (val), u132 (val), Shaker (val), ReplicatedStorage (val), RunService (val)
    -- upvalues: GameState (val), SharedControllerFunctions (val)
    u136.FilterType = Enum.RaycastFilterType.Include
    u136.FilterDescendantsInstances = {workspace:WaitForChild("Ground")}
    local u10 = {}
    for i, j in a1.Model:GetDescendants() do
        if j:IsA("BasePart")
            and string.find(j.Name, "Neon")
            and not table.find({"FrostFire_FrostCanisterNeon", "FrostFire_FireCanisterNeon"}, j.Name) then
            table.insert(u10, j)
        end
    end
    a1:Thread(function() -- Line: 239 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 then
            a1:_fireTarget(v1)
            a1._currentFire = a1:_playAnimation("Fire", 0)
            a1:Delay((a1:GetCooldown()))
            a1._currentFire:Stop(1)
        end
    end)
    a1.Executables = {
        Build = function(a1_2) -- Line: 251 -- upvalues: a1 (val), EffectsController (upval), Children (upval)
            a1:_playSound("Build")
            a1.Maid:Mark((task.spawn(function() -- Line: 254 -- upvalues: a1 (upval), EffectsController (upval), a1_2 (val), Children (upval)
                for i = 1, 4 do
                    if not a1:IsAlive() then
                        return
                    end
                    EffectsController.Cash(a1.Model.HumanoidRootPart.Position, a1_2, Children[(Random.new()):NextInteger(1, #Children)])
                    task.wait(i / 10)
                end
            end)))
            local Position = a1.Model.HumanoidRootPart.Position
            a1.Model.HumanoidRootPart.CFrame = CFrame.new(Position, (Vector3.new(a1_2.X, Position.Y, a1_2.Z)))
            a1.Model.Weapon.Hammer.Hammer.Transparency = 0
            a1:_playAnimation("Build", 0)
            a1:Delay(2, function() -- Line: 278 -- upvalues: a1 (upval)
                local Weapon = a1.Model:FindFirstChild("Weapon")
                local Hammer = Weapon and Weapon:FindFirstChild("Hammer")
                local v1 = Hammer and Hammer:FindFirstChild("Hammer")
                if v1 then
                    v1.Transparency = 1
                end
            end)
        end,
        Stomp = function() -- Line: 290 -- upvalues: a1 (val)
            a1:_playSound("HeatBlast")
            if a1._currentFire then
                a1._currentFire:Stop(0)
            end
            if a1._currentReload then
                a1._currentReload:Stop(0)
            end
            a1:_playAnimation("Stomp", 0)
        end,
        ChangeOption = function() -- Line: 302
            -- upvalues: a1 (val), TimescaleUtilities (upval), Enum (upval), u10 (val), TweenService (upval)
            -- upvalues: u121 (upval), u132 (upval)
            a1.Maid:Mark((TimescaleUtilities.Delay(0.8, function() -- Line: 303
                -- upvalues: a1 (upval), Enum (upval), u10 (upval), TweenService (upval), u121 (upval), u132 (upval)
                local v1, v2, v3
                if not a1:IsAlive() then
                    return
                end
                local v4 = Enum.Element.ToString(a1.Options.Element)
                for i, j in u10 do
                    v2 = TweenService
                    v3 = TweenInfo.new(0.5)
                    v1 = {Color = u121[v4]}
                    v2:Create(j, v3, v1):Play()
                end
                for k, n in a1.Model.Weapon.Gun[v4]:GetChildren() do
                    n.Transparency = 0
                end
                for m, i5 in a1.Model.Weapon.Gun[u132[v4]]:GetChildren() do
                    i5.Transparency = 1
                end
            end)))
            if a1._currentFire then
                a1._currentFire:Stop()
            end
            a1:_playSound("Reload")
            a1._currentReload = a1:_playAnimation("Reload")
        end,
        Heatwave = function(a1_2, a2) -- Line: 333
            -- upvalues: Shaker (upval), ReplicatedStorage (upval), a1 (val), TweenService (upval), RunService (upval)
            -- upvalues: GameState (upval)
            local u2 = 0
            Shaker:Shake({1, 40, 0, 1.5}, 0.1, 1.1)
            local u21 = ReplicatedStorage.Assets.Effects.Client.HeatWave:Clone()
            u21.CFrame = a1.Model.HumanoidRootPart.CFrame
            u21.Parent = workspace
            u21.Size = Vector3.new(0, 1.5, 0)
            local v1 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
            for i, j in u21:GetDescendants() do
                if j:IsA("ImageLabel") then
                    TweenService:Create(j, v1, {ImageTransparency = 1}):Play()
                end
            end
            TweenService:Create(u21, v1, {Transparency = 1}):Play()
            local u57 = nil
            u57 = RunService.Heartbeat:Connect(function(a1_3) -- Line: 355
                -- upvalues: a1 (upval), u57 (ref), u21 (val), u2 (ref), GameState (upval), a2 (val), a1_2 (val)
                if not a1:IsAlive() then
                    u57:Disconnect()
                    u57 = nil
                    u21:Destroy()
                    return
                end
                u2 = u2 + a1_3 * GameState.TimeScale * a2
                if u2 >= 1 then
                    u57:Disconnect()
                    u57 = nil
                end
                local v1 = a1_2 * u2
                u21.Size = Vector3.new(v1 * 2, 1.5, v1 * 2)
            end)
            local v2 = u57
            a1.Maid:Mark(v2)
        end,
    }
    a1.AbilityCallbacks = {
        ["Ice Turret"] = function() -- Line: 378 -- upvalues: a1 (val)
            local v1, v2 = a1:_pathPlacement():await()
            if not v1 or v2 == false then
                return false
            end
            return {position = v2}
        end,
    }
    SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Right Shoulder"], a1.Model.Torso["Left Shoulder"]})
end

return v1