-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useFFlag
-- Decompile time: 2.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local __subscribeToBinding = React.__subscribeToBinding
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local u38 = RunService:IsRunning()
return function(a1, a2, a3) -- Line: 23
    -- upvalues: useRef (val), useState (val), useReactBinding (val), useEffect (val), u38 (val), FFlagController (val)
    -- upvalues: __subscribeToBinding (val)
    local u6 = false
    if a3 ~= nil then
        u6 = a3.isBinding == true
    end
    local enabled = if not a3 then true else if a3.enabled == nil then true else a3.enabled
    local u16 = useRef(a2)
    local v1, u20 = useState(a2)
    local v2, u24 = useReactBinding(a2)
    local v3 = {a1, enabled, u6}
    useEffect(function() -- Line: 31
        -- upvalues: u38 (upval), FFlagController (upval), a1 (val), u16 (val), u6 (val), u24 (val), u20 (val)
        -- upvalues: enabled (val), __subscribeToBinding (upval)
        if not u38 then
            return
        end
        local u1 = nil
        local u2 = nil
        local u3 = nil
        local u4 = false
        local u5 = true
        local u11 = FFlagController.get(a1, u16.current)

        local function cancelUpdate() -- Line: 43 -- upvalues: u3 (ref)
            if u3 then
                task.cancel(u3)
                u3 = nil
            end
        end

        local function updateFlag() -- Line: 50
            -- upvalues: u3 (ref), u11 (val), u5 (ref), u4 (ref), u6 (upval), u24 (upval), u20 (upval)
            if u3 then
                task.cancel(u3)
                u3 = nil
            end
            u3 = task.defer(function() -- Line: 52
                -- upvalues: u11 (upval), u5 (upval), u4 (upval), u6 (upval), u24 (upval), u20 (upval), u3 (upval)
                local v1 = u11()
                if u5 and u4 then
                    if not u6 then
                        u20(v1)
                    else
                        u24(v1)
                    end
                end
                u3 = nil
            end)
        end

        local function setEnabled(a1_2) -- Line: 66
            -- upvalues: u5 (ref), u4 (ref), u3 (ref), u1 (ref), FFlagController (upval), a1 (upval), updateFlag (val)
            -- upvalues: u11 (val), u6 (upval), u24 (upval), u20 (upval)
            if u5 and u4 ~= a1_2 then
                u4 = a1_2
                if u3 then
                    task.cancel(u3)
                    u3 = nil
                end
                if u1 then
                    u1:Disconnect()
                    u1 = nil
                end
                if a1_2 then
                    FFlagController.request(a1)
                    u1 = FFlagController.Updated:Connect(updateFlag)
                    if u3 then
                        task.cancel(u3)
                        u3 = nil
                    end
                    u3 = task.defer(function() -- Line: 52
                        -- upvalues: u11 (upval), u5 (upval), u4 (upval), u6 (upval), u24 (upval), u20 (upval)
                        -- upvalues: u3 (upval)
                        local v1 = u11()
                        if u5 and u4 then
                            if not u6 then
                                u20(v1)
                            else
                                u24(v1)
                            end
                        end
                        u3 = nil
                    end)
                end
                return
            end
        end

        if typeof(enabled) ~= "table" then
            setEnabled(enabled)
        else
            local v1 = enabled
            u2 = __subscribeToBinding(v1, setEnabled)
            setEnabled(v1:getValue())
        end
        return function() -- Line: 94 -- upvalues: u5 (ref), u3 (ref), u2 (ref), u1 (ref)
            u5 = false
            if u3 then
                task.cancel(u3)
                u3 = nil
            end
            if u2 then
                u2()
            end
            if u1 then
                u1:Disconnect()
            end
        end
    end, v3)
    if u6 then
        return v2
    end
    return v1
end