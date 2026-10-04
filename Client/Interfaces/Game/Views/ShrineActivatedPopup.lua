-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.ShrineActivatedPopup
-- Decompile time: 3.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurseVotedFor = require(ReplicatedStorage.Client.Interfaces.Game.Components.CurseVotedFor)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local Shrines = NewNetwork.Channel("Shrines")

local function getPopupName(a1) -- Line: 23 -- types: a1: table
    local displayName = a1.displayName or a1.name
    if typeof(displayName) == "string" and displayName ~= "" then
        return displayName
    end
    return "Shrine"
end

local function getPopupDescription(a1) -- Line: 29 -- types: a1: table
    local description = a1.description
    if typeof(description) == "string" and description ~= "" then
        return description
    end
    return nil
end

return function(a1) -- Line: 35
    -- upvalues: useState (val), useRef (val), useEffect (val), Shrines (val), createElement (val), CurseVotedFor (val)
    a1.setDisplayOrder(999999999)
    a1.setIgnoreGuiInset(true)
    a1.setZIndexBehavior(Enum.ZIndexBehavior.Global)
    local v1, u13 = useState(nil)
    local u16 = useRef(0)
    local u19 = useRef(false)
    useEffect(function() -- Line: 44 -- upvalues: u19 (val), Shrines (upval), u16 (val), u13 (val)
        u19.current = true
        local u7 = Shrines:onEvent("Activated", function(a1, a2, a3) -- Line: 49 -- upvalues: u16 (upval), u13 (upval), u19 (upval) -- types: a3: table?
            if typeof(a3) ~= "table" then
                return
            end
            local v1 = u16
            v1.current = v1.current + 1
            local current = u16.current
            local u11 = {enabled = true, colors = a3.colors}
            local description = a3.description
            u11.description = if typeof(description) ~= "string" then nil else if description == "" then nil else description
            local displayName = a3.displayName or a3.name
            u11.name = if typeof(displayName) ~= "string" then "Shrine" else if displayName == "" then "Shrine" else displayName
            u11.version = current
            u13(u11)
            task.delay(3.5, function() -- Line: 67 -- upvalues: u19 (upval), u16 (upval), current (val), u13 (upval), u11 (val)
                if u19.current and u16.current == current then
                    u13({
                        enabled = false,
                        colors = u11.colors,
                        description = u11.description,
                        name = u11.name,
                        version = current,
                    })
                    task.delay(0.64, function() -- Line: 80 -- upvalues: u19 (upval), u16 (upval), current (upval), u13 (upval)
                        if u19.current and u16.current == current then
                            u13(nil)
                            return
                        end
                    end)
                    return
                end
            end)
        end)
        return function() -- Line: 91 -- upvalues: u19 (upval), u7 (val)
            u19.current = false
            if u7 then
                u7()
            end
        end
    end, {})
    if not v1 then
        return nil
    end
    return createElement(CurseVotedFor, {
        index = 1,
        shrine = true,
        colors = v1.colors,
        description = v1.description,
        enabled = v1.enabled == true,
        modifier = v1.name,
    })
end