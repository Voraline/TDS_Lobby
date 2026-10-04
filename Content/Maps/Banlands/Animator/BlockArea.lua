-- Script path: ReplicatedStorage.Content.Maps.Banlands.Animator.BlockArea
-- Decompile time: 4.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u26 = {}

local function toggleTransparency(a1, a2) -- Line: 10 -- types: a1: userdata, a2: number
    local v1 = {}
    local Descendants = a1:GetDescendants()
    v1[1] = a1
    v1[2] = unpack(Descendants)
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if j:IsA("Beam") or j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("BasePart") then
            j.LocalTransparencyModifier = a2
        end
    end
end

local function getBlockAreaByIndex(a1, a2) -- Line: 27 -- types: a1: userdata, a2: number
    local Environment = a1.Environment
    local v1 = Environment.Blocks:FindFirstChild((("BlockArea%*"):format(a2)))
    assert(v1, (("BlockArea not found for index: %*"):format(a2)))
    local v2 = {}
    for i, j in Environment.PathCrystals:GetChildren() do
        if string.match(j.Name, (("CrystalUnderground%*"):format(a2))) then
            table.insert(v2, j)
        end
    end
    return v1, v2
end

return {
    activate = function(a1, a2) -- Line: 49
        -- upvalues: getBlockAreaByIndex (val), u26 (val), Maid (val), TweenService (val), SpringClass (val)
        -- upvalues: RunService (val), toggleTransparency (val)
        local v1
        local u85, v2 = getBlockAreaByIndex(a1, a2)
        if u26[u85] then
            return
        end
        local u78 = Maid.new()

        local function addConnection(a1, a2) -- Line: 57 -- upvalues: u78 (val)
            local u5 = a1:Connect(a2)
            u78:Mark(function() -- Line: 60 -- upvalues: u5 (val)
                if u5.Connected then
                    u5:Disconnect()
                end
            end)
            return u5
        end

        local function addTween(a1, a2, a3) -- Line: 69 -- upvalues: TweenService (upval), u78 (val)
            local u9 = TweenService:Create(a1, a2, a3)
            u9:Play()
            u78:Mark(function() -- Line: 73 -- upvalues: u9 (val)
                u9:Cancel()
            end)
            return u9
        end

        local function addSpring(a1, a2) -- Line: 80
            -- upvalues: SpringClass (upval), RunService (upval), u78 (val)
            local u7 = SpringClass.new(a1.start, a1.damper, a1.speed)
            if a1.velocity then
                u7.v = a1.velocity
            end
            if a1.target then
                u7.t = a1.target
            end
            if a1.start then
                u7.p = a1.start
            end
            local u29 = RunService.RenderStepped:Connect(function(a1) -- Line: 104 -- upvalues: a2 (val), u7 (val) -- types: a1: number
                a2(u7, a1)
            end)
            u78:Mark(function() -- Line: 60 -- upvalues: u29 (val)
                if u29.Connected then
                    u29:Disconnect()
                end
            end)
            return function() -- Line: 108 -- upvalues: u29 (val)
                if u29.Connected then
                    u29:Disconnect()
                end
            end
        end

        for i, j in v2 do
            local Pivot = j.Left:GetPivot()
            local Pivot_2 = j.Right:GetPivot()
            v1 = {
                start = 120,
                target = 0,
                speed = 10,
                damper = 0.7,
                velocity = 200,
            }
            addSpring(v1, function(a1, a2) -- Line: 127 -- upvalues: j (val), Pivot (val) -- types: a2: number
                j.Left:PivotTo(Pivot * (CFrame.Angles(math.rad(a1.p), 0, 0)))
            end)
            addSpring(v1, function(a1, a2) -- Line: 131 -- upvalues: j (val), Pivot_2 (val) -- types: a2: number
                j.Right:PivotTo(Pivot_2 * (CFrame.Angles(-math.rad(a1.p), 0, 0)))
            end)
            u78:Mark(function() -- Line: 135 -- upvalues: j (val), Pivot (val), Pivot_2 (val)
                j.Left:PivotTo(Pivot)
                j.Right:PivotTo(Pivot_2)
            end)
            toggleTransparency(j, 0)
        end
        local u29 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
        local v3 = {}
        local Descendants = u85:GetDescendants()
        v3[1] = u85
        v3[2] = unpack(Descendants)
        local v4 = nil
        local v5 = nil
        for k, n in v3, v4, v5 do
            if n:IsA("Beam") or n:IsA("ParticleEmitter") or n:IsA("Trail") or n:IsA("BasePart") then
                n.LocalTransparencyModifier = 1
                local u80 = task.delay(0.3, function() -- Line: 160 -- upvalues: n (val), u29 (val), TweenService (upval), u78 (val)
                    local u9 = TweenService:Create(n, u29, {LocalTransparencyModifier = 0})
                    u9:Play()
                    u78:Mark(function() -- Line: 73 -- upvalues: u9 (val)
                        u9:Cancel()
                    end)
                end)
                u78:Mark(function() -- Line: 166 -- upvalues: u80 (ref), n (val)
                    if u80 then
                        task.cancel(u80)
                        u80 = nil
                    end
                    n.LocalTransparencyModifier = 0
                end)
            end
        end
        u26[u85] = u78
        task.delay(1.3, function() -- Line: 178 -- upvalues: u78 (val), u26 (upval), u85 (val)
            u78:Sweep()
            u26[u85] = nil
        end)
    end,
    deactivate = function(a1, a2) -- Line: 184
        -- upvalues: getBlockAreaByIndex (val), u26 (val), toggleTransparency (val)
        local v1, v2 = getBlockAreaByIndex(a1, a2)
        local v3 = u26[v1]
        if v3 then
            v3:Sweep()
            u26[v1] = nil
        end
        toggleTransparency(v1, 1)
        for i, j in v2 do
            toggleTransparency(j, 1)
        end
    end,
}