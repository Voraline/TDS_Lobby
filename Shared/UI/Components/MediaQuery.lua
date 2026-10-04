-- Script path: ReplicatedStorage.Shared.UI.Components.MediaQuery
-- Decompile time: 1.97 ms

local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local function getPlatform(a1) -- Line: 5 -- upvalues: UserInputService (val), GuiService (val)
    local v1 = "Computer"
    if UserInputService.TouchEnabled then
        if 600 < a1.Y then
            return "Tablet"
        end
        return "Phone"
    end
    if GuiService:IsTenFootInterface() then
        v1 = "Console"
    end
    return v1
end

return function(a1) -- Line: 26 -- upvalues: Workspace (val), UserInputService (val), GuiService (val)
    local u1 = {}
    local u33 = nil

    local function disconnectViewport() -- Line: 30 -- upvalues: u33 (ref)
        if u33 then
            u33:Disconnect()
            u33 = nil
        end
    end

    local function runCallback() -- Line: 37
        -- upvalues: Workspace (upval), UserInputService (upval), a1 (val), GuiService (upval)
        local CurrentCamera = Workspace.CurrentCamera
        local ViewportSize = if not CurrentCamera then Vector2.zero else CurrentCamera.ViewportSize
        local v1 = Vector2.new(ViewportSize.X, ViewportSize.Y)
        local TouchEnabled = UserInputService.TouchEnabled
        local v2 = "Computer"
        if UserInputService.TouchEnabled then
            v2 = if not (600 < v1.Y) then "Phone" else "Tablet"
        elseif GuiService:IsTenFootInterface() then
            v2 = "Console"
        end
        a1(v1, v2, TouchEnabled)
    end

    table.insert(u1, ((UserInputService:GetPropertyChangedSignal("TouchEnabled")):Connect(runCallback)))
    table.insert(u1, ((Workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function() -- Line: 46
        -- upvalues: u33 (ref), Workspace (upval), runCallback (val), UserInputService (upval), a1 (val)
        -- upvalues: GuiService (upval)
        if u33 then
            u33:Disconnect()
            u33 = nil
        end
        local CurrentCamera = Workspace.CurrentCamera
        if CurrentCamera then
            u33 = (CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(runCallback)
        end
        local CurrentCamera_2 = Workspace.CurrentCamera
        local ViewportSize = if not CurrentCamera_2 then Vector2.zero else CurrentCamera_2.ViewportSize
        local v1 = Vector2.new(ViewportSize.X, ViewportSize.Y)
        local TouchEnabled = UserInputService.TouchEnabled
        local v2 = "Computer"
        if UserInputService.TouchEnabled then
            v2 = if not (600 < v1.Y) then "Phone" else "Tablet"
        elseif GuiService:IsTenFootInterface() then
            v2 = "Console"
        end
        a1(v1, v2, TouchEnabled)
    end)))
    if u33 then
        u33:Disconnect()
        u33 = nil
    end
    local CurrentCamera = Workspace.CurrentCamera
    if CurrentCamera then
        u33 = (CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(runCallback)
    end
    local CurrentCamera_2 = Workspace.CurrentCamera
    local ViewportSize = if not CurrentCamera_2 then Vector2.zero else CurrentCamera_2.ViewportSize
    local v1 = Vector2.new(ViewportSize.X, ViewportSize.Y)
    local TouchEnabled = UserInputService.TouchEnabled
    local v2 = "Computer"
    if UserInputService.TouchEnabled then
        v2 = if not (600 < v1.Y) then "Phone" else "Tablet"
    elseif GuiService:IsTenFootInterface() then
        v2 = "Console"
    end
    a1(v1, v2, TouchEnabled)
    return function() -- Line: 69 -- upvalues: u33 (ref), u1 (val)
        if u33 then
            u33:Disconnect()
            u33 = nil
        end
        for i, j in u1 do
            j:Disconnect()
        end
    end
end