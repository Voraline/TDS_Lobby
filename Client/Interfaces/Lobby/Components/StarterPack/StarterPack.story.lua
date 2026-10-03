-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StarterPack.StarterPack.story
-- Decompile time: 0.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local StarterPack = require(script.Parent).StarterPack
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect

local function Container() -- Line: 10
    -- upvalues: useReactBinding (val), useEffect (val), createElement (val), StarterPack (val)
    local u2, u3 = useReactBinding(true)
    local v1 = useReactBinding(workspace:GetServerTimeNow() + 259200)
    useEffect(function() -- Line: 14 -- upvalues: u3 (val)
        local u0 = nil
        u0 = task.delay(1, function() -- Line: 16 -- upvalues: u0 (ref), u3 (upval)
            u0 = nil
            u3(false)
        end)
        return function() -- Line: 21 -- upvalues: u0 (ref)
            if u0 then
                task.cancel(u0)
                u0 = nil
            end
        end
    end, {})
    return createElement(StarterPack, {
        ModalVisible = u2,
        BannerVisible = u2,
        EndTime = v1,
        ToggleModal = function() -- Line: 33 -- upvalues: u3 (val), u2 (val)
            u3(not u2)
        end,
    })
end

return function(a1) -- Line: 39 -- upvalues: createElement (val), Container (val), React (val)
    React.mount(createElement(Container, {}), a1)
    return function() -- Line: 43
        root:unmount()
    end
end