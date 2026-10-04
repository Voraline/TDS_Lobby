-- Script path: ReplicatedStorage.Content.Emote.Snowman.Animator
-- Decompile time: 0.51 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 4
    a1._spawnTime = workspace:GetServerTimeNow()
end

function v1.update(a1, a2) end

function v1:Destroy() -- Line: 10
    if (workspace:GetServerTimeNow()) - self._spawnTime < 4 then
        return
    end
    local u13 = self.Replicator.Accessories[1]:Clone()
    u13.PrimaryPart.Anchored = true
    u13.Parent = workspace
    u13:PivotTo(self.Character.Root.CFrame * (CFrame.new(0, 0, -3)))
    task.delay(20, function() -- Line: 20 -- upvalues: u13 (val)
        u13:Destroy()
    end)
end

return v1