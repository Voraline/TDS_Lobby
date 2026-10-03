-- Script path: ReplicatedStorage.Content.Emote.Canister Throw.Animator
-- Decompile time: 2.74 ms

local Debris = game:GetService("Debris")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1
local u43 = workspace:WaitForChild("Type").Value == "Lobby"

local function getMap() -- Line: 17 -- upvalues: u43 (val)
    if u43 then
        return {workspace:FindFirstChild("NewLobby"), (workspace:FindFirstChild("EventArea"))}
    end
    return {workspace:FindFirstChild("Ground"), (workspace:FindFirstChild("Cliff"))}
end

function v1.Initialize(a1) -- Line: 23
    -- upvalues: getMap (val), EasySound (val), EmitterManager (val), Lighting (val), TweenService (val), Debris (val)
    -- upvalues: RunService (val)
    if a1.Preview then
        return
    end
    local Instance = a1.Character.Instance
    local CanisterEmoteAccessory = Instance:WaitForChild("CanisterEmoteAccessory")
    local Handle = CanisterEmoteAccessory.Handle
    local u15 = Instance:WaitForChild("SunflowerEmoteAccessory"):Clone()
    local AnimationController = u15:WaitForChild("AnimationController")
    local u21 = RaycastParams.new()
    u21.FilterType = Enum.RaycastFilterType.Include
    u21.FilterDescendantsInstances = getMap()
    u21.IgnoreWater = true

    local function shatter(a1_2, a2, a3) -- Line: 39
        -- upvalues: CanisterEmoteAccessory (val), EasySound (upval), EmitterManager (upval), Lighting (upval)
        -- upvalues: u15 (val), TweenService (upval), AnimationController (val), Debris (upval), a1 (val)
        CanisterEmoteAccessory:Destroy()
        EasySound.Play({
            id = 77545498887140,
            destroyOnEnd = true,
            volume = 0.5,
            soundGroupName = "Emotes",
            timeScaled = false,
            position = a1_2,
        })
        local v1 = (CFrame.lookAlong(a1_2, a2)) * CFrame.Angles(-1.5707963267948966, 0, 0)
        EmitterManager.Emit("PlantGrow", v1, 1.5)
        if a3 then
            local SunDirection = Lighting:GetSunDirection()
            local ExtentsSize = u15:GetExtentsSize()
            local v2 = CFrame.lookAlong(a1_2 + Vector3.new(0, 1, 0) * ExtentsSize.Y / 2, (Vector3.new(SunDirection.X, 0, SunDirection.Z)))
            u15:PivotTo(v2 - Vector3.new(0, 2, 0))
            TweenService:Create(u15.Sunflower, TweenInfo.new(1), {CFrame = v2}):Play()
            u15.Parent = workspace
            AnimationController:LoadAnimation(AnimationController.Animation):Play()
            Debris:AddItem(u15, 15)
        end
        a1:Destroy()
    end

    a1:OnTrackPlayed("rbxassetid://97453355718435", function(a1_2) -- Line: 78
        -- upvalues: a1 (val), EasySound (upval), Handle (val), RunService (upval), u21 (val), shatter (val)
        a1._animEventConn = (a1_2:GetMarkerReachedSignal("Event")):Connect(function(a1_2) -- Line: 81
            -- upvalues: EasySound (upval), Handle (upval), a1 (upval), RunService (upval), u21 (upval), shatter (upval)
            if a1_2 == "Throw" then
                EasySound.Play({
                    id = 133029099265014,
                    destroyOnEnd = true,
                    volume = 0.5,
                    soundGroupName = "Emotes",
                    timeScaled = false,
                    parent = Handle,
                })
                local Position = Handle.Position
                a1._throwConn = RunService.PostSimulation:Connect(function() -- Line: 93 -- upvalues: Handle (upval), Position (ref), u21 (upval), shatter (upval)
                    local Position_2 = Handle.Position
                    local Unit = (Position_2 - Position).Unit
                    Position = Position_2
                    if Unit ~= Unit then
                        Unit = Vector3.new()
                    end
                    if Unit.Magnitude == 0 then
                        return
                    end
                    local v1 = workspace:Raycast(Position_2, Unit * 2, u21)
                    if v1 then
                        shatter(v1.Position, v1.Normal, v1.Normal:FuzzyEq(Vector3.new(0, 1, 0), 0.5))
                    end
                end)
            end
        end)
    end)
end

function v1:Destroy() -- Line: 118
    if self._animEventConn then
        self._animEventConn:Disconnect()
        self._animEventConn = nil
    end
    if self._throwConn then
        self._throwConn:Disconnect()
        self._throwConn = nil
    end
end

return v1