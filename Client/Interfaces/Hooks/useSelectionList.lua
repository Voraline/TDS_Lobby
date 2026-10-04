-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useSelectionList
-- Decompile time: 2.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local SelectionListStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SelectionListStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect
return function(a1, a2) -- Line: 19
    -- upvalues: useState (val), useEffect (val), SelectionListStore (val), UserInputService (val)
    local u4, u5 = useState(a1)
    local Title = a2.Title
    local Values = a2.Values
    local OnUpdate = a2.OnUpdate
    local Highlight = a2.Highlight
    if not Highlight then
        Highlight = {}
    end
    local Disabled = a2.Disabled
    if not Disabled then
        Disabled = {}
    end
    local v1 = {Values, OnUpdate}
    useEffect(function() -- Line: 29 -- upvalues: SelectionListStore (upval), Values (val), u5 (val), OnUpdate (val)
        local u5_2 = SelectionListStore.selected:Connect(function(a1, a2) -- Line: 30 -- upvalues: Values (upval), u5 (upval), OnUpdate (upval)
            if a2 and a1.values == Values then
                u5(a2)
                if OnUpdate then
                    OnUpdate(a2)
                end
                return
            end
        end)
        return function() -- Line: 42 -- upvalues: u5_2 (val)
            u5_2:Disconnect()
        end
    end, v1)
    return u4, function() -- Line: 48
        -- upvalues: UserInputService (upval), SelectionListStore (upval), u4 (val), Title (val), Values (val)
        -- upvalues: Highlight (val), Disabled (val)
        local MouseLocation = UserInputService:GetMouseLocation()
        SelectionListStore.update({
            enabled = true,
            selected = u4,
            title = Title,
            values = Values,
            highlight = Highlight,
            disabled = Disabled,
            position = UDim2.fromOffset(MouseLocation.X, MouseLocation.Y - 16),
        })
    end
end