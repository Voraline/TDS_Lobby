-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.PursuitAbilityView
-- Decompile time: 1.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local PursuitAbility = require(ReplicatedStorage.Client.Interfaces.Game.Components.PursuitAbility)
local PursuitStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.PursuitStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local createElement = React.createElement
local useState = React.useState
local useBinding = React.useBinding

local function render() -- Line: 15
    -- upvalues: useCharmBinding (val), PursuitStore (val), useState (val), useBinding (val), useReactBindings (val)
    -- upvalues: RunService (val), PathPlacementCursorController (val), createElement (val), PursuitAbility (val)
    local v1 = useCharmBinding(PursuitStore.getState)
    local v2 = v1:getValue()
    local v3, u10 = useState(v2.visible)
    local v4, u14 = useState(v2.model)
    local v5, u19 = useBinding((Vector3.new()))
    local v6 = {v1}
    useReactBindings(function(a1) -- Line: 22
        -- upvalues: u14 (val), u10 (val), RunService (upval), PathPlacementCursorController (upval), u19 (val)
        u14(a1.model)
        u10(a1.visible)
        local u15 = nil
        if a1.visible then
            u15 = RunService.RenderStepped:Connect(function() -- Line: 27 -- upvalues: PathPlacementCursorController (upval), u19 (upval)
                local CurrentPosition = PathPlacementCursorController.CurrentPosition
                if CurrentPosition then
                    u19(CurrentPosition)
                end
            end)
        end
        return function() -- Line: 35 -- upvalues: u15 (ref)
            if u15 then
                u15:Disconnect()
            end
        end
    end, v6)
    return v3 and createElement(PursuitAbility, {model = v4, cursorPosition = v5})
end

return function(a1) -- Line: 49 -- upvalues: createElement (val), render (val)
    return createElement(render)
end