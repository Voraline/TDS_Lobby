-- Script path: ReplicatedStorage.Content.MapItems.SpotLight.Animator
-- Decompile time: 7.71 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u41 = Color3.fromRGB(251, 212, 151)
local u46 = Color3.fromRGB(60, 60, 60)
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function getEnemyInstance(a1) -- Line: 17 -- types: a1: string
    return workspace.NPCs:FindFirstChild((("%*Enemy"):format(a1)))
end

return {
    new = function(a1, a2, a3) -- Line: 21
        -- upvalues: Maid (val), Create (val), TweenService (val), LocalPlayer (val)
        -- upvalues: PathPlacementCursorController (val), Mouse (val), spr (val), u46 (val), u41 (val)
        local Brightness
        local u152 = {}
        local u163 = {d = 1, s = 2}
        u152.Stats = a2
        u152.turnOnMaid = Maid.new()
        u152.maid = Maid.new()
        u152.Prompt = nil
        u152.Replicator = a3
        u152.Owner = a3:Get("Owner")
        u152.Interactable = a3:Get("Interactable")
        u152.Target = a3:Get("Target")
        u152.LastTarget = nil
        u152.Position = Vector3.new(0, 0, 0)
        u152.vfxObjects = {}
        u152.pivot = a1:WaitForChild("Pivot")
        u152.main = a1:WaitForChild("Main")
        u152.frame = a1:WaitForChild("Frame")
        u152.light = a1:WaitForChild("Light")
        u152.spotLight = u152.light:WaitForChild("SurfaceLight")
        u152.startAttachment = u152.light:WaitForChild("StartAttachment")
        u152.endAttachment = u152.light:WaitForChild("EndAttachment")
        u152.raycastAttachment = u152.main:WaitForChild("RaycastAttachment")
        u152.promptAttachment = Create("Attachment", {
            Name = "PromptAttachment",
            Position = Vector3.new(0, -10, 0),
            Parent = u152.frame,
        })
        u152.highlight = Create("Highlight", {
            FillTransparency = 1,
            OutlineTransparency = 0.4,
            Enabled = false,
            Parent = a1,
            Adornee = a1,
            OutlineColor = Color3.new(1, 0.701961, 0),
        })
        u152.deltaTime = 0
        u152.pivotMotor = u152.main:WaitForChild("Pivot")
        u152.frameMotor = u152.pivot:WaitForChild("Frame")
        u152.brightness = Create("NumberValue", {Value = 0})
        u152.maid:Mark(u152.brightness)
        for i, j in a1:GetDescendants() do
            if j:IsA("Beam") or j:IsA("ParticleEmitter") or j:IsA("PointLight") then
                if j:IsA("PointLight") and not j:GetAttribute("OriginalBrightness") then
                    Brightness = j.Brightness
                    j:SetAttribute("OriginalBrightness", Brightness)
                end
                table.insert(u152.vfxObjects, j)
            end
        end

        local function flickerEffect() -- Line: 80 -- upvalues: u152 (val), TweenService (upval)
            local u0 = nil
            u0 = task.spawn(function() -- Line: 82 -- upvalues: u152 (upval), TweenService (upval), u0 (ref)
                u152.brightness.Value = 0
                for i = 1, 2 do
                    if not u152.Interactable then
                        return
                    end
                    TweenService:Create(u152.brightness, TweenInfo.new(0.01, Enum.EasingStyle.Exponential), {Value = i * 0.2 + 0.3}):Play()
                    task.wait(0.03 + math.random() * 0.04)
                    u152.brightness.Value = 0
                    task.wait(0.02)
                end
                if not u152.Interactable then
                    return
                end
                TweenService:Create(u152.brightness, TweenInfo.new(0.9, Enum.EasingStyle.Exponential), {Value = 1}):Play()
                u0 = nil
            end)
            return function() -- Line: 115 -- upvalues: u0 (ref)
                if u0 then
                    task.cancel(u0)
                end
            end
        end

        function u152:Destroy() -- Line: 122
            self.maid:Sweep()
        end

        function u152.Initialize(a1) -- Line: 126
            -- upvalues: Create (upval), a3 (val), LocalPlayer (upval), PathPlacementCursorController (upval), a2 (val)
            -- upvalues: u163 (ref)
            a1:UpdateState(false)
            a1.Replicator:Hook(a1)
            local u31 = Create("ProximityPrompt", {
                Name = "SpotLightPrompt",
                ObjectText = "Target SpotLight",
                MaxActivationDistance = 25,
                RequiresLineOfSight = false,
                Parent = a1.promptAttachment,
                Exclusivity = Enum.ProximityPromptExclusivity.OneGlobally,
                Enabled = not a3:Get("Owner") and a3:Get("Interactable"),
                Style = Enum.ProximityPromptStyle.Custom,
            })
            a1.Prompt = u31
            a1.maid:Mark(((a3:GetStateChangedSignal("Owner")):Connect(function(a1_2) -- Line: 143
                -- upvalues: LocalPlayer (upval), PathPlacementCursorController (upval), a2 (upval), a1 (val)
                if a1_2 == LocalPlayer.UserId then
                    PathPlacementCursorController:Start({
                        constrainToPath = false,
                        constrainToGround = false,
                        uiEnabled = true,
                        placementRadius = a2.Radius,
                    })
                    PathPlacementCursorController.Place:Connect(function() -- Line: 152 -- upvalues: a1 (upval)
                        a1.HasCursor = nil
                        a1:ReplicateAction("ReleaseOwner")
                    end)
                    a1.HasCursor = true
                    return
                end
                if a1.HasCursor then
                    PathPlacementCursorController:Stop()
                    a1.HasCursor = nil
                end
            end)))
            a1.maid:Mark(((a3:GetStateChangedSignal("Interactable")):Connect(function(a1_2) -- Line: 165 -- upvalues: u163 (upval), a1 (val)
                local v1
                u163 = if not (a1_2 == true) then {d = 2, s = 0.5} else {d = 1, s = 2}
                a1:UpdateState(v1)
            end)))
            a1.maid:Mark((a3.Changed:Connect(function(a1_2) -- Line: 172 -- upvalues: u31 (val), a3 (upval), a1 (val), PathPlacementCursorController (upval)
                u31.Enabled = not a3:Get("Owner") and a3:Get("Interactable")
                if not a3:Get("Interactable") and a1.HasCursor then
                    PathPlacementCursorController:Stop()
                    a1.HasCursor = nil
                end
            end)))
            a1.maid:Mark((u31.Triggered:Connect(function(a1_2) -- Line: 181 -- upvalues: LocalPlayer (upval), a1 (val) -- types: a1_2: userdata
                if a1_2 ~= LocalPlayer then
                    return
                end
                a1:Interact()
            end)))
            a1.maid:Mark(function() -- Line: 189 -- upvalues: u31 (val)
                u31:Destroy()
            end)
            a1.Executables = {
                UpdateTarget = function(a1_2) -- Line: 194 -- upvalues: a1 (val) -- types: a1_2: vector
                    a1.Target = a1_2
                end,
            }
            task.delay(2, function() -- Line: 199 -- upvalues: LocalPlayer (upval), a1 (val), a3 (upval)
                repeat
                    task.wait()
                until not LocalPlayer:GetAttribute("Loading") and not LocalPlayer:GetAttribute("Teleporting")
                task.wait(2)
                a1:UpdateState(a3:Get("Interactable") == true)
            end)
        end

        function u152:IsOwner() -- Line: 211 -- upvalues: LocalPlayer (upval)
            return self.Owner == LocalPlayer.UserId
        end

        function u152.GetHitParams(a1) -- Line: 215
            local Map = workspace:WaitForChild("Map")
            local v1 = {
                workspace:WaitForChild("Ground"),
                Map:WaitForChild("Ground"),
                (Map:WaitForChild("Environment")),
            }
            local v2 = RaycastParams.new()
            v2.FilterType = Enum.RaycastFilterType.Include
            v2.FilterDescendantsInstances = v1
            return v2
        end

        function u152:GetTargetPosition() -- Line: 230 -- upvalues: u152 (val)
            local HitParams = self:GetHitParams()
            local Position = self.main.Position
            local v1 = self.raycastAttachment.WorldCFrame.LookVector * u152.Stats.MaxLength
            local v2 = workspace:Raycast(Position, v1, HitParams)
            if v2 then
                return v2.Position
            end
            return Position + v1
        end

        function u152.GetSnappedDirection(a1) -- Line: 243 -- upvalues: a2 (val), Mouse (upval)
            local Target = a2.Target
            local v1 = workspace.NPCs:FindFirstChild((("%*Enemy"):format(Target)))
            if not v1 then
                return nil
            end
            local PrimaryPart = v1.PrimaryPart and v1.PrimaryPart:FindFirstChild("Node") and v1.PrimaryPart.Node.WorldPosition
            if not PrimaryPart then
                return nil
            end
            local Origin = Mouse.UnitRay.Origin
            if a2.SnapRange < (Mouse.Hit.Position - PrimaryPart).Magnitude then
                return nil
            end
            return (PrimaryPart - Origin).Unit
        end

        function u152:GetDirectionToCursor() -- Line: 269 -- upvalues: Mouse (upval), u152 (val)
            local SnappedDirection = self:GetSnappedDirection()
            local HitParams = self:GetHitParams()
            local UnitRay = Mouse.UnitRay
            local Origin = UnitRay.Origin
            local v1 = (SnappedDirection or UnitRay.Direction) * u152.Stats.MaxLength
            local v2 = workspace:Raycast(Origin, v1, HitParams)
            if not v2 then
                return CFrame.lookAt(self.main.Position, v1).LookVector
            end
            return CFrame.lookAt(self.main.Position, v2.Position).LookVector
        end

        function u152:UpdateState(a2) -- Line: 286
            -- upvalues: u152 (val), TweenService (upval)
            self.turnOnMaid:Sweep()
            self.highlight.Enabled = a2
            if not a2 then
                self.brightness.Value = 0
            else
                local turnOnMaid = self.turnOnMaid
                local u8 = nil
                u8 = task.spawn(function() -- Line: 82 -- upvalues: u152 (upval), TweenService (upval), u8 (ref)
                    u152.brightness.Value = 0
                    for i = 1, 2 do
                        if not u152.Interactable then
                            return
                        end
                        TweenService:Create(u152.brightness, TweenInfo.new(0.01, Enum.EasingStyle.Exponential), {Value = i * 0.2 + 0.3}):Play()
                        task.wait(0.03 + math.random() * 0.04)
                        u152.brightness.Value = 0
                        task.wait(0.02)
                    end
                    if not u152.Interactable then
                        return
                    end
                    TweenService:Create(u152.brightness, TweenInfo.new(0.9, Enum.EasingStyle.Exponential), {Value = 1}):Play()
                    u8 = nil
                end)
                turnOnMaid:Mark(function() -- Line: 115 -- upvalues: u8 (ref)
                    if u8 then
                        task.cancel(u8)
                    end
                end)
            end
            for i, j in self.vfxObjects do
                j.Enabled = true
            end
        end

        function u152:UpdateDirection(a2) -- Line: 301
            -- upvalues: spr (upval), u163 (ref)
            local CFrame_2 = self.frame.CFrame
            local LookVector = CFrame_2.LookVector
            local UpVector = CFrame_2.UpVector
            local v1 = CFrame.lookAt(Vector3.new(0, 0, 0), a2, UpVector)
            local LookVector_2 = (CFrame.lookAt(Vector3.new(0, 0, 0), LookVector, UpVector)):ToObjectSpace(v1).LookVector
            local v2 = math.atan2(-LookVector_2.X, -LookVector_2.Z)
            local v3 = math.asin(LookVector_2.Y)
            spr.target(self.frameMotor, u163.d, u163.s, {Transform = CFrame.Angles(0, v2, 0)})
            spr.target(self.pivotMotor, u163.d, u163.s, {Transform = CFrame.Angles(v3, 0, 0)})
        end

        function u152:Interact() -- Line: 324
            if not self.Owner and self.Interactable then
                self:ReplicateAction("RequestOwner")
                return
            end
        end

        function u152.Step(a1, a2) -- Line: 332 -- upvalues: u152 (val), u46 (upval), u41 (upval)
            local v1 = math.clamp(a1.brightness.Value - (math.abs((math.noise(u152.deltaTime * 4)) * 0.3)), 0, 1)
            local v2 = u41
            u152.light.Color = u46:Lerp(v2, v1)
            u152.spotLight.Brightness = v1 * 3.54
            for i, j in a1.vfxObjects do
                if j.Enabled then
                    if not j:IsA("PointLight") then
                        j.LocalTransparencyModifier = 1 - v1
                    else
                        j.Brightness = j:GetAttribute("OriginalBrightness") * v1
                    end
                end
            end
            if a1.Target.Magnitude ~= 0 and u152.LastTarget ~= a1.Target then
                a1:UpdateDirection(a1.Target)
                u152.LastTarget = a1.Target
            end
            a1.Position = a1:GetTargetPosition()
            a1.endAttachment.WorldPosition = a1.Position
            if a1:IsOwner() then
                a1.Target = a1:GetDirectionToCursor()
                a1:ReplicateUnreliableAction("Replicate", a1.Target, a1.Position)
            end
            local v3 = u152
            v3.deltaTime = v3.deltaTime + a2
        end

        return u152
    end,
}