-- Script path: ReplicatedStorage.Content.Emote.Winter Express.Animator
-- Decompile time: 2.68 ms

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local u13 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential)
local u14 = {
    equip = "rbxassetid://139117098711498",
    idle = "rbxassetid://100442759975025",
    loop = {"rbxassetid://113230335163046", "rbxassetid://118305290649629"},
}
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14 -- upvalues: u14 (val), RunService (val)
    local Instance = a1.Character.Instance
    a1._humanoid = Instance:WaitForChild("Humanoid")
    a1._root = Instance:WaitForChild("HumanoidRootPart")
    a1._hornElapsed = 0
    a1._nextTrainHorn = 0
    a1._train = Instance:WaitForChild("Winter Train")
    a1._wheels = a1._train:WaitForChild("Wheels")
    a1._body = a1._train:WaitForChild("TrainBody")
    a1._funnel = a1._train:WaitForChild("Funneltop1")
    a1:ToggleVFX(false)
    a1:OnTrackPlayed(u14.equip, function(a1_2) -- Line: 29 -- upvalues: a1 (val), u14 (upval) -- types: a1_2: userdata
        a1._equipTrack = a1_2
        task.wait(1.98)
        a1_2:AdjustSpeed(0)
        a1:PlayTrack(u14.idle, 0)
    end)
    a1:PreloadTrack(u14.idle)
    a1:PreloadTrack(u14.loop[1])
    a1:PreloadTrack(u14.loop[2])
    a1:OnTrackPlayed(u14.idle, function(a1_2) -- Line: 40 -- upvalues: a1 (val) -- types: a1_2: userdata
        a1._loopTrack = a1_2
        if a1._equipTrack then
            a1._equipTrack:Stop()
            a1._equipTrack = nil
        end
        if not a1.Preview then
            task.defer(function() -- Line: 49 -- upvalues: a1 (upval)
                a1._root.Anchored = false
            end)
        end
    end)
    if a1.Preview then
        return
    end
    a1._root.Anchored = true
    a1.Maid:Mark(function() -- Line: 60 -- upvalues: a1 (val)
        a1._root.Anchored = false
    end)
    a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 64 -- upvalues: a1 (val)
        a1:Step(a1_2)
    end)))
end

function v1:IsMoving() -- Line: 69
    return 0 < self._humanoid.MoveDirection.Magnitude
end

function v1:ToggleVFX(a2) -- Line: 73 -- types: self: table, a2: boolean
    for i, j in self._train:GetDescendants() do
        if j:IsA("ParticleEmitter") or j:IsA("Trail") then
            j.Enabled = a2
        end
    end
end

function v1:Step(a2) -- Line: 81 -- upvalues: u14 (val), TweenService (val), u13 (val) -- types: self: table, a2: number
    local Motor6D
    if not self._loopTrack then
        return
    end
    if not self:IsMoving() then
        if self._walkTrack then
            self._loopTrack = self:PlayTrack(u14.idle)
            self._walkTrack:Stop()
            self._walkTrack = nil
            self:ToggleVFX(false)
            TweenService:Create(self._body.Chug, u13, {Volume = 0}):Play()
            if self._thread then
                task.cancel(self._thread)
            end
            self._thread = task.delay(u13.Time, function() -- Line: 140 -- upvalues: self (val)
                self._body.Chug:Stop()
                self._thread = nil
            end)
        end
        return
    end
    self._hornElapsed = self._hornElapsed + a2
    if not self._walkTrack then
        local v1 = math.floor((workspace:GetServerTimeNow()))
        self._walkTrack = self:PlayTrack(u14.loop[((Random.new(v1)):NextInteger(1, #u14.loop))])
        self._loopTrack:Stop()
        self._hornElapsed = 0
        self._nextTrainHorn = Random.new():NextNumber(3, 6)
        self:ToggleVFX(true)
        if self._thread then
            task.cancel(self._thread)
            self._thread = nil
        end
        self._body.Chug:Play()
        TweenService:Create(self._body.Chug, u13, {Volume = 0.5}):Play()
    end
    for i, j in self._wheels:GetChildren() do
        Motor6D = j:FindFirstChildWhichIsA("Motor6D")
        Motor6D.C1 = Motor6D.C1 * CFrame.Angles(a2 * 5, 0, 0)
    end
    if not (self._nextTrainHorn <= self._hornElapsed) then
        return
    end
    self._hornElapsed = 0
    self._nextTrainHorn = Random.new():NextNumber(3, 6)
    self._body.ChooChoo:Play()
end

function v1.Destroy(a1) -- Line: 148
    if a1._walkTrack then
        a1._walkTrack:Stop()
    end
end

return v1