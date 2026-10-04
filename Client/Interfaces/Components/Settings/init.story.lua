-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.init.story
-- Decompile time: 1.89 ms

local cloneTable
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Parent = require(script.Parent)
local createElement = React.createElement
local useState = React.useState

function cloneTable(a1) -- Line: 9 -- upvalues: cloneTable (val)
    local v1 = {}
    for k, v in pairs(a1) do
        if type(k) ~= "table" or getmetatable(k) then
            v1[k] = v
        else
            v1[k] = (cloneTable(v))
        end
    end
    return v1
end

local function Component() -- Line: 23 -- upvalues: useState (val), createElement (val), Parent (val), cloneTable (val)
    local u2, u3 = useState({})
    return createElement(Parent, {
        Settings = u2,
        UpdateSetting = function(a1, a2) -- Line: 28 -- upvalues: cloneTable (upval), u2 (val), u3 (val)
            local v1 = cloneTable(u2)
            v1[a1] = a2
            u3(v1)
        end,
    })
end

return function(a1) -- Line: 36 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 40 -- upvalues: u4 (val)
        u4:unmount()
    end
end