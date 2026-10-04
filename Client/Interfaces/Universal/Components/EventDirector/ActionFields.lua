-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.ActionFields
-- Decompile time: 11.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controls = require(script.Parent.Controls)
local MusicPreview = require(script.Parent.MusicPreview)
local React = require(ReplicatedStorage.Shared.UI.React)
require(script.Parent.Types)
local createElement = React.createElement

local function fieldIssue(a1, a2) -- Line: 21 -- types: a1: table?, a2: string
    for i, j in a1 or {} do
        if j.field ~= a2 and j.field ~= ("parameters.%*"):format(a2) then
            continue
        end
        return j.message
    end
    return nil
end

return function(a1) -- Line: 30
    -- upvalues: createElement (val), Controls (val), MusicPreview (val), fieldIssue (val), React (val)
    local key, key_4, label_2, updateParameter, v1, v2
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in a1.action.fields, v4, v5 do
        local u23 = a1.parameters[j.key]

        function updateParameter(a1_2) -- Line: 34 -- upvalues: a1 (val), j (val)
            local v1 = table.clone(a1.parameters)
            v1[j.key] = a1_2
            a1.onChange(v1)
        end

        v2 = i + (a1.orderOffset or 10)
        if j.kind == "boolean" then
            key = j.key
            v3[key] = (createElement(Controls.Button, {
                text = ("%*: %*"):format(j.label, if u23 ~= true then "Off" else "On"),
                selected = u23 == true,
                order = v2,
                disabled = a1.disabled,
                onActivated = function() -- Line: 46 -- upvalues: u23 (val), a1 (val), j (val)
                    local v1 = u23 ~= true
                    local v2 = table.clone(a1.parameters)
                    v2[j.key] = v1
                    a1.onChange(v2)
                end,
            }))
        elseif j.kind ~= "select" then
            label_2 = j.label
            if j.min ~= nil and j.max ~= nil then
                label_2 = ("%* (%*–%*)"):format(label_2, j.min, j.max)
            end
            key_4 = j.key
            v3[key_4] = (createElement(Controls.Input, {
                label = label_2,
                value = if u23 == nil then "" else tostring(u23),
                error = fieldIssue(a1.issues, j.key),
                order = v2,
                disabled = a1.disabled,
                onChanged = function(a1_2) -- Line: 100 -- upvalues: j (val), a1 (val)
                    local v1 = not (j.kind ~= "number") and tonumber(a1_2) or a1_2
                    local v2 = table.clone(a1.parameters)
                    v2[j.key] = v1
                    a1.onChange(v2)
                end,
            }))
        else
            v1 = {}
            for k, n in j.options or {} do
                table.insert(v1, {id = n, label = n})
            end
            if j.preview ~= "music" then
                v3[j.key] = (createElement(Controls.Select, {
                    label = j.label,
                    value = tostring(u23 or ""),
                    options = v1,
                    order = v2,
                    disabled = a1.disabled,
                    onChanged = updateParameter,
                }))
            else
                v3[j.key] = (createElement("Frame", {
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    LayoutOrder = v2,
                    Size = UDim2.fromScale(1, 0),
                }, {
                    Layout = createElement("UIListLayout", {
                        Padding = UDim.new(0, 6),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    }),
                    Select = createElement(Controls.Select, {
                        order = 1,
                        label = j.label,
                        value = tostring(u23 or ""),
                        options = v1,
                        disabled = a1.disabled,
                        onChanged = updateParameter,
                    }),
                    Preview = createElement(MusicPreview, {order = 2, track = tostring(u23 or "")}),
                }))
            end
        end
    end
    return createElement(React.Fragment, {}, v3)
end