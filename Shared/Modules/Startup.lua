-- Script path: ReplicatedStorage.Shared.Modules.Startup
-- Decompile time: 1.71 ms

local RunService = game:GetService("RunService")
local Concur = require(script.Parent.Concur)
local Loader = require(script.Parent.Loader)
return function(a1, a2, a3) -- Line: 26
    -- upvalues: Loader (val), Concur (val), RunService (val)
    local stepType
    local v1 = Loader.LoadDescendants(a1, function(a1) -- Line: 27 -- upvalues: a3 (val), Loader (upval), a2 (val)
        if a3 and a3.modulePredicate then
            local v1 = false
            if a3.modulePredicate(a1) == true then
                v1 = Loader.MatchesName(a2)(a1)
            end
            return v1
        end
        return Loader.MatchesName(a2)(a1)
    end)
    if (Concur.all((Loader.SpawnAll(v1, "onStart"))):Await(5)) == Concur.Errors.Timeout then
        error("Modules failed to start within 5 seconds. Please check your onStart functions.")
    end
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if typeof(j) == "table" and j.onUpdate then
            stepType = "Heartbeat"
            if j.stepType then
                stepType = j.stepType
            end
            if j.stepType == "Stepped" then
                RunService.Stepped:Connect(function(a1, a2) -- Line: 53 -- upvalues: i (val), j (val)
                    debug.profilebegin(i .. "_SteppedUpdate")
                    j.onUpdate(a2)
                    debug.profileend()
                end)
            elseif j.stepType ~= "RenderStepped" or not j.priority or not RunService:IsClient() then
                RunService[stepType]:Connect(function(a1) -- Line: 66 -- upvalues: i (val), j (val)
                    debug.profilebegin(i .. "_HeartbeatUpdate")
                    j.onUpdate(a1)
                    debug.profileend()
                end)
            else
                RunService:BindToRenderStep(i .. "Update", j.priority, function(a1) -- Line: 59 -- upvalues: i (val), j (val)
                    debug.profilebegin(i .. "_RenderSteppedUpdate")
                    j.onUpdate(a1)
                    debug.profileend()
                end)
            end
        end
    end
    Loader.SpawnAll(v1, "onLoaded")
end