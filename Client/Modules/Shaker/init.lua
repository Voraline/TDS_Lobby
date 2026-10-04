-- Script path: ReplicatedStorage.Client.Modules.Shaker
-- Decompile time: 4.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CameraShake = require(script:WaitForChild("CameraShake"))
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local u30 = {}
local u31 = {Instance = CameraShake.CameraShakeInstance, Presets = CameraShake.Presets}
u31.__index = u31
local identity = CFrame.identity
local u40 = CameraShake.new(Enum.RenderPriority.Camera.Value + 2, function(a1) -- Line: 15 -- upvalues: identity (ref)
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    CurrentCamera.CFrame = CurrentCamera.CFrame * a1
    identity = a1
end)

function u31.getLastShakeCFrame() -- Line: 31 -- upvalues: identity (ref)
    return identity
end

function u31.Shake(a1, a2, a3, a4, a5) -- Line: 37
    -- upvalues: u31 (val), SettingsController (val), u40 (val), u30 (val)
    local v1 = {camera = workspace.CurrentCamera, arguments = a2, cancelTime = a3, fadeOut = a4}
    local u10 = setmetatable(v1, u31)
    if SettingsController.Game:Get("Camera Shake") then
        u40:Start()
        u10.ShakeInstance = u40:StartShake((unpack(u10.arguments)))
        if a5 then
            u10.ShakeInstance.WorldData = a5
        end
        if u10.cancelTime then
            task.delay(a3, function() -- Line: 56 -- upvalues: u10 (val)
                u10:Stop(u10.fadeOut)
            end)
        end
        u30[u10] = true
    end
    return u10
end

function u31.ShakePreset(a1, a2, a3, a4, a5) -- Line: 70
    -- upvalues: u31 (val), SettingsController (val), u40 (val), u30 (val)
    local v1 = {camera = workspace.CurrentCamera, cancelTime = a3, fadeOut = a4}
    local u10 = setmetatable(v1, u31)
    if SettingsController.Game:Get("Camera Shake") then
        u40:Start()
        v1 = u31.Presets[a2]
        u10.ShakeInstance = v1
        if a5 then
            v1.WorldData = a5
        end
        u40:Shake(v1)
        if u10.cancelTime then
            task.delay(u10.cancelTime, function() -- Line: 96 -- upvalues: u10 (val)
                u10:Stop(u10.fadeOut)
            end)
        end
        u30[u10] = true
    end
    return u10
end

function u31:Stop(a2) -- Line: 107 -- upvalues: u30 (val), u40 (val) -- types: self: table, a2: number?
    local v1 = a2 or 0
    if not self.ShakeInstance then
        return
    end
    u30[self] = false
    self.ShakeInstance:StartFadeOut(v1)
    task.delay(v1, function() -- Line: 117 -- upvalues: u30 (upval), u40 (upval)
        if not next(u30) then
            u40:Stop()
        end
    end)
end

return u31