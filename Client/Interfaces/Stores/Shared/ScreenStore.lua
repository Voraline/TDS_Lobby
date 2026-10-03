-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.ScreenStore
-- Decompile time: 0.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12, u13 = (require(ReplicatedStorage.Packages.Charm)).signal({isMobile = false, screenSize = Vector2.zero})
return {
    getState = u12,
    getDeviceType = function() -- Line: 21 -- upvalues: u12 (val)
        return u12().deviceType
    end,
    getIsMobile = function() -- Line: 25 -- upvalues: u12 (val)
        return u12().isMobile
    end,
    getScreenSize = function() -- Line: 29 -- upvalues: u12 (val)
        return u12().screenSize
    end,
    setScreenInfo = function(a1, a2) -- Line: 33 -- upvalues: u12 (val), u13 (val) -- types: a1: userdata, a2: string?
        local v1 = u12()
        local v2 = a1.X <= 1200
        if v1.screenSize == a1 and v1.deviceType == a2 and v1.isMobile == v2 then
            return
        end
        u13({deviceType = a2, isMobile = v2, screenSize = a1})
    end,
}