-- Script path: ReplicatedStorage.Shared.Modules.CustomProjectile
-- Decompile time: 2.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local u15 = {}
local u16 = 0
local u17 = nil
local u20 = table.create(256)
local u23 = table.create(256)
local u26 = table.create(64)

local function stepProjectiles(a1) -- Line: 30
    -- upvalues: GameState (val), u15 (val), u26 (val), u20 (val), u23 (val), u16 (ref), u17 (ref)
    local result, success, v1, v2, v3, v4
    debug.profilebegin("CustomProjectileStep")
    local TimeScale = GameState.TimeScale
    if TimeScale <= 0 then
        debug.profileend()
        return
    end
    local v5 = a1 * TimeScale
    local v6 = 0
    local v7 = 0
    debug.profilebegin("CustomProjectileStepLoop")
    local v8 = nil
    local v9 = nil
    for i, j in u15, v8, v9 do
        v4 = j.elapsedTime + v5
        v1 = v4 / j.timeToDest
        if v1 > 1 then
            v1 = 1
        end
        j.elapsedTime = v4
        j.alpha = v1
        v2 = j.onStep(j)
        if v2 then
            if v2 ~= j.lastCFrame then
                v6 = v6 + 1
                u20[v6] = v2
                u23[v6] = i
                j.lastCFrame = v2
            end
        end
        if v1 >= 1 then
            v7 = v7 + 1
            u26[v7] = j
        end
    end
    debug.profileend()
    if v6 > 0 then
        debug.profilebegin("CustomProjectileBulkMoveTo")
        workspace:BulkMoveTo(u23, u20, Enum.BulkMoveMode.FireCFrameChanged)
        debug.profileend()
    end
    debug.profilebegin("CustomProjectileClearBuffers")
    v9 = v6 + 1
    local v10 = #u23
    for k = v9, v10 do
        u23[k] = nil
        u20[k] = nil
    end
    debug.profileend()
    debug.profilebegin("CustomProjectileFinish")
    for n = 1, v7 do
        v3 = u26[n]
        u26[n] = nil
        u15[v3.part] = nil
        u16 = u16 - 1
        if v3.onFinish then
            success, result = pcall(v3.onFinish, v3)
            if not success then
                warn(result)
            end
        end
    end
    debug.profileend()
    if u16 <= 0 and u17 then
        u17:Disconnect()
        u17 = nil
    end
    debug.profileend()
end

return {
    ThrowProjectile = function(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 116
        -- upvalues: u15 (val), u16 (ref), u17 (ref), RunService (val), stepProjectiles (val)
        local v1 = {
            elapsedTime = 0,
            alpha = 0,
            start = a2,
            goal = a3,
            lastCFrame = CFrame.new(a2),
            timeToDest = a4,
            part = a5,
            onStep = a6,
            onFinish = a7,
        }
        if a8 then
            for i, j in a8 do
                v1[i] = j
            end
        end
        u15[a5] = v1
        u16 = u16 + 1
        if not u17 then
            u17 = RunService.PreSimulation:Connect(stepProjectiles)
        end
    end,
    GetActiveCount = function(a1) -- Line: 152 -- upvalues: u16 (ref)
        return u16
    end,
}