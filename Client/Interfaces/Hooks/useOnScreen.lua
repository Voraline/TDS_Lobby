-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useOnScreen
-- Decompile time: 9.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useState = React.useState

local function isRectVisible(a1, a2, a3, a4) -- Line: 18
    -- upvalues: 
    local v1 = a1 + a2
    local v2 = a3 + a4
    local v3 = false
    if a1.X < v2.X then
        v3 = false
        if a3.X < v1.X then
            v3 = false
            if a1.Y < v2.Y then
                v3 = a3.Y < v1.Y
            end
        end
    end
    return v3
end

local function isVisibleInHierarchy(a1) -- Line: 33 -- types: a1: userdata
    local Parent = a1
    while Parent do
        if Parent:IsA("GuiObject") and not Parent.Visible then
            return false
        end
        if Parent:IsA("LayerCollector") and not Parent.Enabled then
            return false
        end
        Parent = Parent.Parent
    end
    return true
end

return function(a1) -- Line: 49 -- upvalues: useState (val), useEffect (val), isVisibleInHierarchy (val) -- types: a1: table
    local u3 = a1.enabled ~= false
    local v1, u7 = useState(false)
    local v2 = useEffect
    local v3 = {u3, a1.targetRef, a1.viewportRef}
    v2(function() -- Line: 53 -- upvalues: u3 (val), u7 (val), a1 (val), isVisibleInHierarchy (upval)
        if not u3 then
            u7(false)
            return
        end
        local current = a1.targetRef.current
        local current_2 = if not a1.viewportRef then nil else a1.viewportRef.current
        local CurrentCamera = if not current_2 then workspace.CurrentCamera else nil
        if not current then
            u7(false)
            return
        end
        local u22 = false
        local u23 = {}
        local u24 = nil
        local u25 = {}

        local function updateVisibility() -- Line: 72
            -- upvalues: u22 (ref), current (val), isVisibleInHierarchy (upval), u7 (upval), current_2 (val)
            -- upvalues: CurrentCamera (val)
            if not u22 and current.Parent and isVisibleInHierarchy(current) then
                local v1, v2
                local v3 = true
                if not current_2 then
                    if CurrentCamera then
                        local zero = Vector2.zero
                        local ViewportSize = CurrentCamera.ViewportSize
                        local AbsolutePosition_3 = current.AbsolutePosition
                        local AbsoluteSize_2 = current.AbsoluteSize
                        v1 = zero + ViewportSize
                        v2 = AbsolutePosition_3 + AbsoluteSize_2
                        v3 = false
                        if zero.X < v2.X then
                            v3 = false
                            if AbsolutePosition_3.X < v1.X then
                                v3 = false
                                if zero.Y < v2.Y then
                                    v3 = AbsolutePosition_3.Y < v1.Y
                                end
                            end
                        end
                    end
                elseif not current_2.Parent then
                    v3 = false
                elseif isVisibleInHierarchy(current_2) then
                    local AbsoluteWindowSize = if not current_2:IsA("ScrollingFrame") then current_2.AbsoluteSize else current_2.AbsoluteWindowSize
                    local AbsolutePosition = current_2.AbsolutePosition
                    local AbsolutePosition_2 = current.AbsolutePosition
                    local AbsoluteSize = current.AbsoluteSize
                    v1 = AbsolutePosition + AbsoluteWindowSize
                    v2 = AbsolutePosition_2 + AbsoluteSize
                    v3 = false
                    if AbsolutePosition.X < v2.X then
                        v3 = false
                        if AbsolutePosition_2.X < v1.X then
                            v3 = false
                            if AbsolutePosition.Y < v2.Y then
                                v3 = AbsolutePosition_2.Y < v1.Y
                            end
                        end
                    end
                else
                    v3 = false
                end
                u7(v3)
                return
            end
            if not u22 then
                u7(false)
            end
        end

        local function observe(a1, a2) -- Line: 107
            -- upvalues: u23 (val), updateVisibility (val)
            table.insert(u23, ((a1:GetPropertyChangedSignal(a2)):Connect(updateVisibility)))
        end

        local function observeVisibilityHierarchy(a1) -- Line: 114
            -- upvalues: u25 (val), u23 (val), updateVisibility (val)
            local Parent = a1
            while Parent do
                if not u25[Parent] then
                    if Parent:IsA("GuiObject") then
                        table.insert(u23, ((Parent:GetPropertyChangedSignal("Visible")):Connect(updateVisibility)))
                        u25[Parent] = true
                    elseif Parent:IsA("LayerCollector") then
                        table.insert(u23, ((Parent:GetPropertyChangedSignal("Enabled")):Connect(updateVisibility)))
                        u25[Parent] = true
                    end
                end
                Parent = Parent.Parent
            end
        end

        table.insert(u23, ((current:GetPropertyChangedSignal("AbsolutePosition")):Connect(updateVisibility)))
        table.insert(u23, ((current:GetPropertyChangedSignal("AbsoluteSize")):Connect(updateVisibility)))
        observeVisibilityHierarchy(current)
        if current_2 then
            table.insert(u23, ((current_2:GetPropertyChangedSignal("AbsolutePosition")):Connect(updateVisibility)))
            table.insert(u23, ((current_2:GetPropertyChangedSignal("AbsoluteSize")):Connect(updateVisibility)))
            observeVisibilityHierarchy(current_2)
            if current_2:IsA("ScrollingFrame") then
                table.insert(u23, ((current_2:GetPropertyChangedSignal("AbsoluteWindowSize")):Connect(updateVisibility)))
                table.insert(u23, ((current_2:GetPropertyChangedSignal("CanvasPosition")):Connect(updateVisibility)))
            end
        elseif CurrentCamera then
            table.insert(u23, ((CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateVisibility)))
        end
        u24 = task.defer(function() -- Line: 149 -- upvalues: u24 (ref), updateVisibility (val)
            u24 = nil
            updateVisibility()
        end)
        return function() -- Line: 154 -- upvalues: u22 (ref), u24 (ref), u23 (val)
            u22 = true
            if u24 then
                task.cancel(u24)
            end
            for i, j in u23 do
                j:Disconnect()
            end
        end
    end, v3)
    return v1
end