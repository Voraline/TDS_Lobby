-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useFlairs
-- Decompile time: 0.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Flairs = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Flairs)
local React = require(ReplicatedStorage.Shared.UI.React)
local useChild = require(script.Parent.useChild)
local u34 = RunService:IsRunning()
return function() -- Line: 12
    -- upvalues: useChild (val), u34 (val), ReplicatedStorage (val), ServerStorage (val), React (val), Flairs (val)
    local v1 = useChild(u34 and ReplicatedStorage or ServerStorage, "Content")
    local u12 = useChild(v1, "Flair")
    return React.useMemo(function() -- Line: 16 -- upvalues: u12 (val), Flairs (upval)
        local v1
        local v2 = {}
        for i, j in u12:GetDescendants() do
            if j:IsA("ModuleScript") then
                v1 = Flairs(j.Name)
                if v1 then
                    v2[j.Name] = v1
                end
            end
        end
        return v2
    end, {v1, u12})
end