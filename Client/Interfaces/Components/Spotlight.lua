-- Script path: ReplicatedStorage.Client.Interfaces.Components.Spotlight
-- Decompile time: 2.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local SpotlightStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SpotlightStore)
local useEffect = React.useEffect
local createElement = React.createElement
local useRef = React.useRef
return React.memo(function(a1) -- Line: 20
    -- upvalues: useRef (val), useEffect (val), SpotlightStore (val), createElement (val)
    assert(a1, "No props provided")
    assert(a1.name, "No Name provided")
    local name = a1.name
    local target = a1.target
    local v1 = a1.scale or 1
    local btnRef = a1.btnRef
    if not btnRef then
        btnRef = useRef()
    end
    useEffect(function() -- Line: 30 -- upvalues: btnRef (val), target (val), SpotlightStore (upval), name (val)
        if not btnRef.current then
            return
        end
        local current = btnRef.current
        local u16 = nil
        local u5 = nil

        local function onElement() -- Line: 39
            -- upvalues: target (upval), current (val), u5 (ref), SpotlightStore (upval), name (upval)
            local Parent = target or current.Parent
            if Parent and Parent:IsA("GuiButton") then
                if u5 and u5.Connected then
                    u5:Disconnect()
                end
                u5 = Parent.MouseButton1Up:Connect(function() -- Line: 49 -- upvalues: SpotlightStore (upval), name (upval)
                    if SpotlightStore.getState().selected == name then
                        SpotlightStore.fire(name)
                    end
                end)
                return
            end
        end

        if not target then
            u16 = (current:GetPropertyChangedSignal("Parent")):Connect(onElement)
        end
        onElement()
        SpotlightStore.add(name, current)
        return function() -- Line: 64 -- upvalues: u16 (ref), u5 (ref), SpotlightStore (upval), name (upval)
            if u16 and u16.Connected then
                u16:Disconnect()
            end
            if u5 and u5.Connected then
                u5:Disconnect()
            end
            SpotlightStore.remove(name)
        end
    end, {})
    if a1.btnRef then
        return nil
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(v1, v1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Name = ("SpotLight:%*"):format(name),
        ref = btnRef,
    })
end)