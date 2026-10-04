-- Script path: ReplicatedStorage.Content.Emote.Snowball.Animator
-- Decompile time: 4.91 ms

local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local ToolTipKeybindStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ToolTipKeybindStore)
local v1 = {}
v1.__index = v1
local u39 = {}
u39.Throw = {ActionText = "Throw", Layout = 1, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonR2}
local u42 = {}
u42.Throw = {
    ActionText = "Throw",
    Layout = 1,
    ScaleMultiplier = 0.4,
    Icon = "LMB",
    IconSize = 1.35,
    Key = Enum.UserInputType.MouseButton1,
}

function v1.Initialize(a1) -- Line: 49
    -- upvalues: ReplicatedStorage (val), Projectile (val), ToolTipKeybindStore (val), UserInputService (val), u39 (val)
    -- upvalues: u42 (val), ContextActionService (val), GuiService (val), RunService (val)
    if a1.Preview then
        return
    end
    a1.Executables = {
        Throw = function(a1_2) -- Line: 55 -- upvalues: a1 (val), ReplicatedStorage (upval), Projectile (upval)
            if a1.Local then
                return
            end
            local u12 = ReplicatedStorage.Assets.Emotes.Snowball.Accessories.Snowball.Handle:Clone()
            u12.Size = Vector3.new(1.1019999980926514, 1.1019999980926514, 1.1019999980926514) + Vector3.new(a1._size, a1._size, a1._size)
            u12.Parent = workspace
            ;(Projectile:throwWithPhysics({
                gravity = Vector3.new(0, -30, 0),
                duration = 4,
                start = a1_2.start,
                target = a1_2.target,
                velocity = a1_2.direction * 180,
                asset = u12,
                include = {workspace},
                onHit = function(a1) -- Line: 77
                    if (game.Players:GetPlayerFromCharacter(a1.Parent)) ~= game.Players.LocalPlayer then
                        return
                    end
                end,
            })):andThen(function(...) -- Line: 93 -- upvalues: u12 (val)
                u12:Destroy()
            end)
        end,
    }
    local u7 = a1:PreloadTrack("rbxassetid://135442035625469")
    local u11 = a1:PreloadTrack("rbxassetid://138703553968470")
    local u15 = a1:PreloadTrack("rbxassetid://108751444564624")
    local u19 = a1:PreloadTrack("rbxassetid://91238533488886")
    if a1.Local then
        a1.Character.Instance.Humanoid.AutoRotate = false
        a1.Maid:Mark(((a1:PlayTrack("rbxassetid://89626371958346", 0)).Stopped:Connect(function() -- Line: 108 -- upvalues: u7 (val), a1 (val), u11 (val)
            u7:Play(0)
            a1.Maid:Mark((u7.Stopped:Connect(function() -- Line: 111 -- upvalues: a1 (upval), u11 (upval)
                a1.Character.Instance.Humanoid.WalkSpeed = 4
                if 1.1 <= a1._size then
                    u11:Play(0)
                end
            end)))
        end)))
        ToolTipKeybindStore.addBinds(if not UserInputService.GamepadEnabled then u42 else if (UserInputService:GetLastInputType()) ~= Enum.UserInputType.Gamepad1 then u42 else u39)
        local u54 = false
        local v1 = ContextActionService
        local Value = Enum.ContextActionPriority.Low.Value
        local ButtonR2 = Enum.KeyCode.ButtonR2
        local MouseButton1 = Enum.UserInputType.MouseButton1
        local Touch = Enum.UserInputType.Touch
        v1:BindActionAtPriority("ThrowSnowBall", function(a1_2, a2) -- Line: 131
            -- upvalues: u54 (ref), a1 (val), u7 (val), u15 (val), u19 (val), UserInputService (upval)
            -- upvalues: GuiService (upval), ReplicatedStorage (upval), Projectile (upval)
            if u54 or a2 ~= Enum.UserInputState.Begin or not a1._size then
                return
            end
            u54 = true
            a1:ReplicateAction("StopBuilding")
            u7:Stop()
            local v1 = 1.1 <= a1._size and u15 or u19
            v1:Play(0)
            v1:GetMarkerReachedSignal("Throw"):Wait()
            task.defer(function() -- Line: 155 -- upvalues: a1 (upval)
                task.wait(0.2)
                a1:Stop()
            end)
            local MouseLocation = UserInputService:GetMouseLocation()
            local X = MouseLocation.X
            local v2 = MouseLocation.Y - GuiService:GetGuiInset().Y
            local v3 = workspace.CurrentCamera:ViewportPointToRay(X, v2, 1)
            local v4 = workspace:Raycast(v3.Origin, v3.Direction * 200) or {Position = v3.Origin + v3.Direction * 200}
            local u78 = ReplicatedStorage.Assets.Emotes.Snowball.Accessories.Snowball.Handle:Clone()
            local Position = a1.Character.Instance.HumanoidRootPart.Position
            u78.Size = Vector3.new(1.1019999980926514, 1.1019999980926514, 1.1019999980926514) + Vector3.new(a1._size, a1._size, a1._size)
            u78.Parent = workspace
            ;(Projectile:throwWithPhysics({
                gravity = Vector3.new(0, -30, 0),
                duration = 4,
                start = Position,
                target = v4.Position,
                velocity = v3.Direction * 180,
                asset = u78,
                include = {workspace},
                onHit = function(a1) -- Line: 192
                    if (game.Players:GetPlayerFromCharacter(a1.Parent)) ~= game.Players.LocalPlayer then
                        return
                    end
                end,
            })):andThen(function(...) -- Line: 208 -- upvalues: u78 (val)
                u78:Destroy()
            end)
            a1:ReplicateAction("Throw", {start = Position, target = v4.Position, direction = v3.Direction})
            return Enum.ContextActionResult.Pass
        end, false, Value, ButtonR2, MouseButton1, Touch)
    end
    a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 228 -- upvalues: a1 (val)
        a1:update(a1_2)
    end)))
end

function v1:update(a2) -- Line: 233
    -- upvalues: UserInputService (val), GuiService (val)
    if self.Local then
        local Position = self.Character.Instance.HumanoidRootPart.Position
        local MouseLocation = UserInputService:GetMouseLocation()
        local X = MouseLocation.X
        local v1 = MouseLocation.Y - GuiService:GetGuiInset().Y
        local v2 = workspace.CurrentCamera:ViewportPointToRay(X, v1, 1)
        local v3 = workspace:Raycast(v2.Origin, v2.Direction * 200)
        local Position_2 = v2.Origin + v2.Direction * 200
        if v3.Position then
            Position_2 = v3.Position
        end
        local v4 = Vector3.new(Position_2.X, Position.Y, Position_2.Z)
        self.Character.Root.CFrame = self.Character.Root.CFrame:Lerp(CFrame.new(Position, v4), a2 * 10)
    end
    local v5 = (workspace:GetServerTimeNow()) - self.Started
    if v5 > 1 then
        v5 = (workspace:GetServerTimeNow()) - self.Started - 1
        local Snowball = self.Character.Instance:FindFirstChild("Snowball")
        if Snowball and self.Player:GetAttribute("BuildingSnowball") then
            local v6 = math.min(1.6, v5 / 6 * 1.6)
            Snowball.Handle.Size = Vector3.new(1.1019999980926514, 1.1019999980926514, 1.1019999980926514) + Vector3.new(v6, v6, v6)
            self._size = v6
        end
    end
end

function v1:Destroy() -- Line: 269 -- upvalues: ToolTipKeybindStore (val), ContextActionService (val)
    if self.Local and not self.Preview then
        self.Character.Instance.Humanoid.AutoRotate = true
        ToolTipKeybindStore.reset()
        ContextActionService:UnbindAction("ThrowSnowBall")
    end
end

return v1