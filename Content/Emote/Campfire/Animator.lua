-- Script path: ReplicatedStorage.Content.Emote.Campfire.Animator
-- Decompile time: 2.43 ms

local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local v1 = {}
Random.new()

local function toggleParticles(a1, a2) -- Line: 16 -- types: a1: userdata, a2: boolean
    for i, j in a1:GetDescendants() do
        if j.Name ~= "crumbs" and j:IsA("ParticleEmitter") then
            j.Enabled = a2
        end
    end
end

function v1.Initialize(a1) -- Line: 28
    -- upvalues: RunService (val), toggleParticles (val), TweenService (val), ContextActionService (val)
    local Marshmello = a1.Character.Instance:WaitForChild("Seat"):WaitForChild("Marshmello")
    local Mesh = Marshmello:WaitForChild("Mesh")
    local u16 = tick()
    local u17 = true
    a1:OnTrackPlayed("rbxassetid://15686958360", function(a1) -- Line: 38
        -- upvalues: RunService (upval), u17 (ref), u16 (ref), Mesh (val), toggleParticles (upval), Marshmello (val)
        local v1, v2, v3
        while a1.IsPlaying do
            RunService.Heartbeat:Wait()
            if u17 then
                v1 = tick() - u16
                v2 = Mesh
                v3 = math.clamp(v1 / 40, 0, 1)
                v2.VertexColor = Vector3.new(1, 1, 1):Lerp(Vector3.new(0, 0, 0), v3)
                if v1 >= 40 then
                    toggleParticles(Marshmello, true)
                    return
                end
            end
        end
    end)
    a1:OnTrackPlayed("rbxassetid://15686958960", function(a1) -- Line: 57 -- upvalues: u17 (ref), u16 (ref) -- types: a1: userdata
        u17 = false
        a1.Stopped:Once(function() -- Line: 60 -- upvalues: u17 (upval), u16 (upval)
            u17 = true
            u16 = tick()
        end)
    end)
    a1:OnTrackPlayed("rbxassetid://15686939985", function(a1) -- Line: 66
        -- upvalues: u17 (ref), Marshmello (val), TweenService (upval), Mesh (val), toggleParticles (upval), u16 (ref)
        u17 = false
        local u9 = (a1:GetMarkerReachedSignal("Event")):Connect(function(a1) -- Line: 69 -- upvalues: Marshmello (upval), TweenService (upval)
            if a1 == "Eat" then
                Marshmello.Transparency = 1
                Marshmello.EatSound:Play()
                Marshmello.crumbs:Emit(5)
                return
            end
            if a1 == "Grow" then
                Marshmello.Mesh.Scale = Vector3.new(0, 0, 0)
                Marshmello.Transparency = 0
                TweenService:Create(
                    Marshmello.Mesh,
                    TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    {Scale = Vector3.new(3, 3, 3)}
                ):Play()
            end
        end)
        a1.Stopped:Once(function() -- Line: 87
            -- upvalues: Mesh (upval), toggleParticles (upval), Marshmello (upval), u16 (upval), u17 (upval), u9 (val)
            Mesh.VertexColor = Vector3.new(1, 1, 1)
            toggleParticles(Marshmello, false)
            u16 = tick()
            u17 = true
            u9:Disconnect()
        end)
    end)
    if not a1.Local then
        return
    end
    a1.playing = true
    a1.binding = Instance.new("BindableEvent")
    a1.thread = task.spawn(function() -- Line: 104 -- upvalues: a1 (val)
        a1:PlayTrack("rbxassetid://15686958960").Stopped:Wait()
        while a1.playing do
            a1.binding.Event:Wait()
            a1:PlayTrack("rbxassetid://15686939985").Stopped:Wait()
        end
    end)
    if not a1.Preview then
        local v1 = ContextActionService
        local MouseButton1 = Enum.UserInputType.MouseButton1
        v1:BindAction("EAT_MARSHMELLO", function() -- Line: 114 -- upvalues: a1 (val)
            if a1.binding then
                a1.binding:Fire()
            end
            return Enum.ContextActionResult.Pass
        end, false, MouseButton1)
    end
end

function v1:Destroy() -- Line: 124 -- upvalues: ContextActionService (val)
    self.playing = false
    if self.thread then
        task.cancel(self.thread)
        self.thread = nil
    end
    if self.binding then
        self.binding:Destroy()
        self.binding = nil
    end
    if self.Local and not self.Preview then
        ContextActionService:UnbindAction("EAT_MARSHMELLO")
    end
end

return v1