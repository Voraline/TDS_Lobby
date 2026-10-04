-- Script path: ReplicatedStorage.Shared.Modules.UsernameFromId
-- Decompile time: 0.94 ms

local Players = game:GetService("Players")
local u5 = {}
Players.PlayerRemoving:Connect(function(a1) -- Line: 46 -- upvalues: u5 (val)
    u5[a1.UserId] = nil
end)
task.spawn(function() -- Line: 50 -- upvalues: u5 (val)
    local v1, v2
    while true do
        v1 = os.time()
        v2 = {}
        for i, j in u5 do
            if 300 < v1 - j.lastRead then
                table.insert(v2, i)
            end
        end
        for k, n in v2 do
            u5[n] = nil
        end
        task.wait(60)
    end
end)
return function(a1, a2) -- Line: 14 -- upvalues: Players (val), u5 (val) -- types: a1: number, a2: boolean?
    local PlayerByUserId = Players:GetPlayerByUserId(a1)
    if PlayerByUserId then
        return PlayerByUserId.Name
    end
    local v1 = u5[a1]
    local v2 = os.time()
    if v1 then
        v1.lastRead = v2
        return v1.username
    end
    local success, result = pcall(function() -- Line: 26 -- upvalues: Players (upval), a1 (val)
        return Players:GetNameFromUserIdAsync((tonumber(a1)))
    end)
    if not success then
        return ""
    end
    if a2 then
        return result
    end
    u5[a1] = {lastRead = v2, username = result}
    return result
end