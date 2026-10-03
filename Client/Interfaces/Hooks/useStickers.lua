-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useStickers
-- Decompile time: 0.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Stickers = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Stickers)
local useChild = require(script.Parent.useChild)
local useChildren = require(script.Parent.useChildren)
local u39 = RunService:IsRunning()
return function() -- Line: 13
    -- upvalues: useChild (val), u39 (val), ReplicatedStorage (val), ServerStorage (val), useChildren (val), React (val)
    -- upvalues: Stickers (val)
    local v1 = useChild(u39 and ReplicatedStorage or ServerStorage, "Content")
    local v2 = useChild(v1, "Sticker")
    local u15 = useChildren(v2)
    return React.useMemo(function() -- Line: 18 -- upvalues: u15 (val), Stickers (upval)
        local v1
        local v2 = {}
        for i, j in u15 do
            v1 = Stickers(j.Name)
            if v1 then
                v2[j.Name] = v1
            end
        end
        return v2
    end, {v1, v2, u15})
end