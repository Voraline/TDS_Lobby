-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.DangerAlert.story
-- Decompile time: 0.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DangerAlert = require(script.Parent.DangerAlert)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect

local function render(a1) -- Line: 12
    -- upvalues: useState (val), useEffect (val), createElement (val), DangerAlert (val)
    local v1, u4 = useState(true)
    useEffect(function() -- Line: 15 -- upvalues: u4 (val)
        local u2 = task.spawn(function() -- Line: 16 -- upvalues: u4 (upval)
            while true do
                task.wait(5)
                u4(function(a1) -- Line: 19
                    return not a1
                end)
            end
        end)
        return function() -- Line: 25 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, {})
    return createElement(DangerAlert, {text = "MOVE YOUR TOWERS!", visible = v1})
end

return function(a1) -- Line: 36 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render(createElement(render), a1)
    return function() -- Line: 41 -- upvalues: u4 (val)
        u4:unmount()
    end
end