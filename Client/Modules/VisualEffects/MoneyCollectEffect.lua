-- Script path: ReplicatedStorage.Client.Modules.VisualEffects.MoneyCollectEffect
-- Decompile time: 4.05 ms

local RunService = game:GetService("RunService")
local v1 = {}
local u6 = {}

local function bezier(a1, a2, a3, a4) -- Line: 20
    return (1 - a4) ^ 2 * a1 + 2 * (1 - a4) * a4 * a2 + a4 ^ 2 * a3
end

local function updateState(a1, a2, a3) -- Line: 24 -- types: a1: userdata, a2: table, a3: number
    a2.elapsed = math.min(a2.elapsed + a3, a2.duration)
    local v1 = a2.elapsed / a2.duration
    local p0 = a2.p0
    local p1 = a2.p1
    local p2 = a2.p2
    local v2 = (1 - v1) ^ 2 * p0 + 2 * (1 - v1) * v1 * p1 + v1 ^ 2 * p2
    local v3 = CFrame.new(v2)
    if a2.onUpdate then
        v3 = v3 * a2.onUpdate(a1, v2, v1, a3)
    end
    return v2, v3
end

local function step(a1) -- Line: 39 -- upvalues: u6 (val), updateState (val) -- types: a1: number
    local elapsed, v1
    local v2 = {}
    local v3 = {}
    for k, v in pairs(u6) do
        u28, v1 = updateState(k, v, a1)
        elapsed = v.elapsed
        if not (v.duration <= elapsed) then
            table.insert(v2, k)
            table.insert(v3, v1)
        else
            u6[k] = nil
            if not v.onFinished then
                k:Destroy()
            else
                task.spawn(function() -- Line: 50 -- upvalues: v (val), k (val), u28 (val)
                    v.onFinished(k, u28)
                    if k then
                        k:Destroy()
                    end
                end)
            end
        end
    end
    workspace:BulkMoveTo(v2, v3)
end

RunService.RenderStepped:Connect(function(a1) -- Line: 69 -- upvalues: u6 (val), step (val)
    if not next(u6) then
        return
    end
    step(a1)
end)

function v1.createHandler(a1) -- Line: 77 -- upvalues: u6 (val) -- types: a1: table
    local part = a1.part
    return {
        play = function(a1_2, a2, a3) -- Line: 85
            -- upvalues: u6 (upval), part (ref), a1 (val)
            local v1 = part
            u6[v1] = {
                elapsed = 0,
                duration = a1.duration,
                p0 = a1_2,
                p1 = a2,
                p2 = a3,
                onFinished = a1.onFinished,
                onUpdate = a1.onUpdate,
            }
            part.Parent = workspace.Trash
        end,
        cleanup = function() -- Line: 99 -- upvalues: part (ref), u6 (upval)
            if part then
                u6[part] = nil
                part:Destroy()
                part = nil
            end
        end,
    }
end

return v1