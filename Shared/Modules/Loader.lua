-- Script path: ReplicatedStorage.Shared.Modules.Loader
-- Decompile time: 1.59 ms

local Concur = require(script.Parent.Concur)
return {
    LoadChildren = function(a1, a2) -- Line: 7 -- types: a1: userdata, a2: function?
        local result, success
        local v1 = {}
        local v2 = a2
        for i, j in a1:GetChildren() do
            if j:IsA("ModuleScript") then
                if not v2 or v2(j) then
                    success, result = pcall(require, j)
                    if success then
                        v1[j.Name] = result
                    else
                        warn("Failed to load module: " .. j:GetFullName())
                        warn(result)
                    end
                end
            end
        end
        return v1
    end,
    LoadDescendants = function(a1, a2) -- Line: 27 -- types: a1: userdata, a2: function?
        local result, success
        local v1 = {}
        local v2 = a2
        for i, j in a1:GetDescendants() do
            if j:IsA("ModuleScript") then
                if not v2 or v2(j) then
                    success, result = pcall(require, j)
                    if success then
                        v1[j.Name] = result
                    else
                        warn("Failed to load module: " .. j:GetFullName())
                        warn(result)
                    end
                end
            end
        end
        return v1
    end,
    MatchesName = function(a1) -- Line: 47 -- types: a1: string
        return function(a1_2) -- Line: 48 -- upvalues: a1 (val) -- types: a1_2: userdata
            return a1_2.Name:match(a1) ~= nil
        end
    end,
    SpawnAll = function(a1, a2) -- Line: 53 -- upvalues: Concur (val) -- types: a1: table, a2: string
        local v1 = {}
        for i, j in a1 do
            if typeof(j) == "table" then
                local u18 = j[a2]
                if type(u18) == "function" then
                    local u25 = Concur.spawn(function() -- Line: 63 -- upvalues: i (val), u18 (val), j (val)
                        debug.setmemorycategory(i)
                        u18(j)
                    end)
                    task.delay(5, function() -- Line: 68 -- upvalues: u25 (val), i (val), a2 (val)
                        if u25:IsCompleted() then
                            return
                        end
                        warn((("Module '%*' took longer than 5 seconds to start. Please check your %* function."):format(i, a2)))
                    end)
                    u25:OnCompleted(function(a1) -- Line: 77
                        if a1 then
                            warn(a1)
                        end
                    end)
                    table.insert(v1, u25)
                end
            end
        end
        return v1
    end,
}