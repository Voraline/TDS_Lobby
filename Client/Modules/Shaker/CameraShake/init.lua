-- Script path: ReplicatedStorage.Client.Modules.Shaker.CameraShake
-- Decompile time: 7.78 ms

local u0 = {}
u0.__index = u0
local profilebegin = debug.profilebegin
local profileend = debug.profileend
local new = Vector3.new
local new_2 = CFrame.new
local Angles = CFrame.Angles
local rad = math.rad
local u8 = new()
local CameraShakeInstance = require(script.CameraShakeInstance)
local CameraShakeState = CameraShakeInstance.CameraShakeState
u0.CameraShakeInstance = CameraShakeInstance
u0.Presets = require(script.CameraShakePresets)

function u0.new(a1, a2) -- Line: 83 -- upvalues: u8 (val), u0 (val)
    assert(type(a1) == "number", "RenderPriority must be a number (e.g.: Enum.RenderPriority.Camera.Value)")
    assert(type(a2) == "function", "Callback must be a function")
    return (setmetatable({
        _running = false,
        _renderName = "CameraShaker",
        _renderPriority = a1,
        _posAddShake = u8,
        _rotAddShake = u8,
        _camShakeInstances = {},
        _removeInstances = {},
        _callback = a2,
    }, u0))
end

function u0.Start(a1) -- Line: 104 -- upvalues: profilebegin (val), profileend (val)
    if a1._running then
        return
    end
    a1._running = true
    local _callback = a1._callback
    ;(game:GetService("RunService")):BindToRenderStep(a1._renderName, a1._renderPriority, function(a1_2) -- Line: 111 -- upvalues: profilebegin (upval), a1 (val), profileend (upval), _callback (val)
        profilebegin("CameraShakerUpdate")
        local v1 = a1:Update(a1_2)
        profileend()
        _callback(v1)
    end)
end

function u0.Stop(a1) -- Line: 119
    if not a1._running then
        return
    end
    ;(game:GetService("RunService")):UnbindFromRenderStep(a1._renderName)
    a1._running = false
end

function u0.StopSustained(a1, a2) -- Line: 127
    local fadeInDuration
    for k, v in pairs(a1._camShakeInstances) do
        if v.fadeOutDuration == 0 then
            fadeInDuration = a2 or v.fadeInDuration
            v:StartFadeOut(fadeInDuration)
        end
    end
end

function u0:Update(a2) -- Line: 135 -- upvalues: u8 (val), CameraShakeState (val), new_2 (val), Angles (val), rad (val)
    local State, v1, v2
    local v3 = u8
    local v4 = u8
    local _camShakeInstances = self._camShakeInstances
    local v5 = #_camShakeInstances
    local v6 = a2
    for i = 1, v5 do
        v2 = _camShakeInstances[i]
        State = v2:GetState()
        if State ~= CameraShakeState.Inactive then
            if State ~= CameraShakeState.Inactive then
                v1 = v2:UpdateShake(v6)
                v3 = v3 + v1 * v2.PositionInfluence
                v4 = v4 + v1 * v2.RotationInfluence
            end
        elseif v2.DeleteOnInactive then
            self._removeInstances[#self._removeInstances + 1] = i
        elseif State ~= CameraShakeState.Inactive then
            v1 = v2:UpdateShake(v6)
            v3 = v3 + v1 * v2.PositionInfluence
            v4 = v4 + v1 * v2.RotationInfluence
        end
    end
    for j = #self._removeInstances, 1, -1 do
        table.remove(_camShakeInstances, self._removeInstances[j])
        self._removeInstances[j] = nil
    end
    return (new_2(v3)) * Angles(0, rad(v4.Y), 0) * Angles(rad(v4.X), 0, (rad(v4.Z)))
end

function u0.Shake(a1, a2) -- Line: 167
    local _camShakeInstance = false
    if type(a2) == "table" then
        _camShakeInstance = a2._camShakeInstance
    end
    assert(_camShakeInstance, "ShakeInstance must be of type CameraShakeInstance")
    a1._camShakeInstances[#a1._camShakeInstances + 1] = a2
    return a2
end

function u0.ShakeSustain(a1, a2) -- Line: 176
    local _camShakeInstance = false
    if type(a2) == "table" then
        _camShakeInstance = a2._camShakeInstance
    end
    assert(_camShakeInstance, "ShakeInstance must be of type CameraShakeInstance")
    a1._camShakeInstances[#a1._camShakeInstances + 1] = a2
    a2:StartFadeIn(a2.fadeInDuration)
    return a2
end

function u0.ShakeOnce(a1, a2, a3, a4, a5, a6, a7) -- Line: 186 -- upvalues: CameraShakeInstance (val)
    local v1 = CameraShakeInstance.new(a2, a3, a4, a5)
    v1.PositionInfluence = not (typeof(a6) ~= "Vector3") and a6 or Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448)
    v1.RotationInfluence = not (typeof(a7) ~= "Vector3") and a7 or Vector3.new(1, 1, 1)
    a1._camShakeInstances[#a1._camShakeInstances + 1] = v1
    return v1
end

function u0.StartShake(a1, a2, a3, a4, a5, a6) -- Line: 205 -- upvalues: CameraShakeInstance (val)
    local v1 = CameraShakeInstance.new(a2, a3, a4)
    v1.PositionInfluence = not (typeof(a5) ~= "Vector3") and a5 or Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448)
    v1.RotationInfluence = not (typeof(a6) ~= "Vector3") and a6 or Vector3.new(1, 1, 1)
    v1:StartFadeIn(a4)
    a1._camShakeInstances[#a1._camShakeInstances + 1] = v1
    return v1
end

return u0