-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.MusicPreview
-- Decompile time: 2.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controls = require(script.Parent.Controls)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement

local function stopPreview(a1) -- Line: 19
    a1:Stop()
    a1:Play("")
end

return function(a1) -- Line: 28
    -- upvalues: React (val), createElement (val), Controls (val), ReplicatedStorage (val)
    local u4, u5 = React.useState(false)
    local u9 = React.useRef(nil)
    local u13 = React.useRef(nil)
    local useEffect = React.useEffect
    local v1 = {u4, a1.track}
    useEffect(function() -- Line: 33 -- upvalues: u4 (val), u9 (val), a1 (val), u13 (val)
        if u4 and u9.current then
            if a1.track ~= "" and u13.current ~= a1.track then
                u9.current:Play(a1.track)
                u13.current = a1.track
            end
            return
        end
    end, v1)
    React.useEffect(function() -- Line: 43 -- upvalues: u9 (val), u13 (val)
        return function() -- Line: 44 -- upvalues: u9 (upval), u13 (upval)
            if u9.current and u13.current then
                local current = u9.current
                current:Stop()
                current:Play("")
            end
            u9.current = nil
            u13.current = nil
        end
    end, {})
    return createElement(Controls.Button, {
        text = if not u4 then "Preview" else "Stop preview",
        selected = u4,
        disabled = a1.track == "",
        order = a1.order,
        onActivated = function() -- Line: 58 -- upvalues: u4 (val), u9 (val), u13 (val), u5 (val), ReplicatedStorage (upval), a1 (val)
            if not u4 then
                local v1 = require(ReplicatedStorage.Client.Controllers.Shared.MusicController).CreateController("EventDirectorPreview", nil, "Music")
                v1:Play(a1.track)
                u9.current = v1
                u13.current = a1.track
                u5(true)
                return
            end
            if u9.current and u13.current then
                local current = u9.current
                current:Stop()
                current:Play("")
            end
            u9.current = nil
            u13.current = nil
            u5(false)
        end,
    })
end