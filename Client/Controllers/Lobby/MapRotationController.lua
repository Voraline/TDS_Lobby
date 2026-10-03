-- Script path: ReplicatedStorage.Client.Controllers.Lobby.MapRotationController
-- Decompile time: 0.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Maps = require(ReplicatedStorage.Shared.Modules.Network).Channel("Maps")
local v1, u20 = Charm.signal(nil)
local u21 = nil
local u22 = {getRotation = v1}

function u22.updateMaps() -- Line: 13 -- upvalues: Maps (val), u20 (val)
    local v1 = Maps:InvokeServer("Request")
    if not v1 then
        return
    end
    u20(v1)
end

Charm.listen(v1, function(a1) -- Line: 22 -- upvalues: u21 (ref), u22 (val)
    if u21 then
        task.cancel(u21)
        u21 = nil
    end
    if not a1 then
        return
    end
    local currentTime = a1.currentTime
    local endTime = a1.endTime
    if endTime and currentTime and not (endTime.UnixTimestamp <= currentTime.UnixTimestamp) then
        u21 = task.delay(endTime.UnixTimestamp - currentTime.UnixTimestamp, function() -- Line: 39 -- upvalues: u21 (upval), u22 (upval)
            u21 = nil
            u22.updateMaps()
        end)
        return
    end
end)
task.spawn(function() -- Line: 47 -- upvalues: u22 (val)
    u22.updateMaps()
end)
return u22