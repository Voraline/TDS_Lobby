-- Script path: ReplicatedStorage.Content.Maps.Nil Zone.Animator
-- Decompile time: 5.26 ms

local RunService = game:GetService("RunService")
return function(a1, a2) -- Line: 30 -- upvalues: RunService (val)
    local Pivot, Pivot_2, v1, v2, v3, v4, v5
    local Environment = a1:WaitForChild("Environment")
    local FallingNoobs = Environment:WaitForChild("FallingNoobs")
    local FloatingFragments = Environment:WaitForChild("FloatingFragments")
    local u237 = {}
    local u249 = {}
    local u250 = 0
    for i, j in FallingNoobs:GetChildren() do
        for k, n in j:GetChildren() do
            if n:IsA("Model") then
                v4 = {}
                for m, i5 in n:GetDescendants() do
                    if i5:IsA("BasePart") then
                        table.insert(v4, i5)
                    end
                end
                Pivot_2 = n:GetPivot()
                v5 = {
                    start = Pivot_2,
                    currentStartY = Pivot_2.Y,
                    speed = math.random(21, 45),
                    parts = v4,
                }
                u237[n] = v5
                for i6, i7 in v4 do
                    i7.LocalTransparencyModifier = 1
                end
            end
        end
    end
    for i8, i9 in FloatingFragments:GetChildren() do
        if i9:IsA("BasePart") or i9:IsA("Model") then
            Pivot = i9:GetPivot()
            v1 = CFrame.Angles(math.rad((math.random(0, 360))), math.rad((math.random(0, 360))), (math.rad((math.random(0, 360)))))
            v2 = CFrame.new(Pivot.Position) * v1
            i9:PivotTo(v2)
            v3 = {
                lastOffset = Vector3.new(0, 0, 0),
                start = v2,
                speed = math.random(5, 20) / 10,
                direction = if math.random(0, 1) ~= 0 then 1 else -1,
                basePos = v2.Position,
                noiseSpeed = math.random(25, 60) / 100,
                amplitude = Vector3.new(math.random() * 2 + 1, math.random() * 0.7 + 0.3, (math.random()) * 2 + 1),
                smoothing = math.random(3, 7),
                seeds = {math.random(), math.random(), math.random()},
                phase = math.random() * 3.141592653589793 * 2,
                orbitRadius = math.random() * 3 + 1,
                orbitSpeed = math.random() * 0.35 + 0.15,
                orbitAngle = math.random() * 3.141592653589793 * 2,
            }
            u249[i9] = v3
        end
    end
    a2:Mark((RunService.PostSimulation:Connect(function(a1) -- Line: 113 -- upvalues: u250 (ref), u237 (val), u249 (val)
        local Pivot_2, Position, Rotation, Rotation_2, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14
        u250 = u250 + a1
        local v15 = nil
        local v16 = nil
        local v17 = a1
        for i, j in u237, v15, v16 do
            Pivot_2 = i:GetPivot()
            Rotation_2 = Pivot_2.Rotation
            Position = Pivot_2.Position
            if not (Pivot_2.Y < -100) then
                v2 = (CFrame.new(Position)) * (CFrame.new(0, -j.speed * v17, 0)) * Rotation_2
                i:PivotTo(v2)
            else
                v1 = math.max(j.start.Y, 200)
                v2 = (CFrame.new(j.start.X, v1, j.start.Z)) * j.start.Rotation
                i:PivotTo(v2)
                j.currentStartY = v2.Y
                for k, n in j.parts do
                    n.LocalTransparencyModifier = 1
                end
            end
            if -100 <= Pivot_2.Y then
                v14 = j.currentStartY - -100
                if v14 < 1 then
                    v14 = 1
                end
                v2 = math.clamp((j.currentStartY - Pivot_2.Y) / v14, 0, 1)
                v4 = 1 - math.clamp(if not (v2 < 0.15) then if not (v2 > 0.8) then 1 else (1 - v2) / 0.2 else v2 / 0.15, 0, 1)
                for m, i5 in j.parts do
                    i5.LocalTransparencyModifier = v4
                end
            end
        end
        for i6, i7 in u249 do
            Rotation = (i6:GetPivot()).Rotation
            i7.orbitAngle = i7.orbitAngle + i7.orbitSpeed * v17
            v1 = Vector3.new((math.cos(i7.orbitAngle)) * i7.orbitRadius, 0, (math.sin(i7.orbitAngle)) * i7.orbitRadius)
            v2 = u250 * i7.noiseSpeed
            v3 = math.noise(i7.seeds[1], v2, 0)
            v4 = math.noise(i7.seeds[2], v2, 0)
            v5 = math.noise(i7.seeds[3], v2, 0)
            v6 = Vector3.new(v3 * i7.amplitude.X, v4 * i7.amplitude.Y, v5 * i7.amplitude.Z)
            v7 = (math.sin(u250 * 0.5 + i7.phase)) * 0.25
            v8 = v1 + v6 + Vector3.new(0, v7, 0)
            v9 = math.clamp(v17 * i7.smoothing, 0, 1)
            v10 = i7.lastOffset:Lerp(v8, v9)
            i7.lastOffset = v10
            v11 = i7.basePos + v10
            v12 = i7.direction * i7.speed * v17
            v13 = (CFrame.new(v11)) * ((CFrame.Angles(0, v12, 0)) * Rotation)
            i6:PivotTo(v13)
        end
    end)))
end