-- Script path: ReplicatedStorage.Content.NewEnemies.Brick Man.Animator
-- Decompile time: 0.59 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 4
    a1.deathAnim = (a1.Model:WaitForChild("AnimationController")):LoadAnimation((a1.Model:WaitForChild("Animations"):WaitForChild("Death")))
    a1.Executables = {
        Death = function() -- Line: 11 -- upvalues: a1 (val)
            a1.deathAnim:Play()
            local Head = a1.Model:FindFirstChild("Head")
            if Head then
                local Rattle = Head:FindFirstChild("Rattle")
                if Rattle then
                    Rattle:Play()
                    Rattle.PlaybackSpeed = Rattle.PlaybackSpeed * Random.new():NextNumber(0.85, 1.1)
                end
            end
            task.defer(function() -- Line: 23 -- upvalues: a1 (upval)
                while a1.deathAnim.Length == 0 do
                    task.wait()
                end
                task.wait(a1.deathAnim.Length * 0.95)
                a1.deathAnim:AdjustSpeed(0)
            end)
        end,
    }
end

return v1