-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useGamemodes
-- Decompile time: 1.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local useChild = require(script.Parent.useChild)
return function() -- Line: 6 -- upvalues: useChild (val), ReplicatedStorage (val), React (val), Enum (val)
    local u7 = useChild(useChild(ReplicatedStorage, "Content"), "Gamemodes")
    return React.useMemo(function() -- Line: 10 -- upvalues: u7 (val), Enum (upval)
        local Category, Difficulties, DisplayInfo, DisplayName, v1
        local v2 = {}
        if u7 == nil then
            return v2
        end
        for i, j in u7:GetChildren() do
            Difficulties = j:FindFirstChild("Difficulties")
            if Difficulties ~= nil then
                for k, n in Difficulties:GetChildren() do
                    DisplayInfo = n:FindFirstChild("DisplayInfo")
                    if DisplayInfo then
                        v1 = require(DisplayInfo)
                        DisplayName = v1.DisplayName or v1.Name or n.Name
                        Category = v1.Category or j.Name
                        if v1.GamemodeType ~= Enum.GamemodeType.Hidden then
                            if v1.GamemodeType ~= nil or Category ~= "HIDDEN" then
                                if v2[Category] == nil then
                                    v2[Category] = {}
                                end
                                table.insert(v2[Category], {
                                    displayName = DisplayName,
                                    id = n.Name,
                                    gamemode = j.Name,
                                })
                            end
                        end
                    end
                end
            end
        end
        return v2
    end, {u7})
end