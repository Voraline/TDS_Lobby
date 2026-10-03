-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTags
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local NewTags = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewTags)
local useChild = require(script.Parent.useChild)
local u34 = RunService:IsRunning()
return function() -- Line: 13
    -- upvalues: useChild (val), u34 (val), ReplicatedStorage (val), ServerStorage (val), React (val), NewTags (val)
    local v1 = useChild(u34 and ReplicatedStorage or ServerStorage, "Content")
    local u12 = useChild(v1, "Nametag")
    return React.useMemo(function() -- Line: 17 -- upvalues: u12 (val), NewTags (upval)
        local v1
        local v2 = {}
        for i, j in u12:GetDescendants() do
            if j:IsA("ModuleScript") ~= false then
                v1 = NewTags(j.Name)
                if v1 then
                    v2[j.Name] = v1
                end
            end
        end
        return v2
    end, {v1, u12})
end