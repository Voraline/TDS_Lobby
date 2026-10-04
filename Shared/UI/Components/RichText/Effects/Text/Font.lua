-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Text.Font
-- Decompile time: 0.48 ms

return {
    DesiredType = "Word",
    render = function(a1) -- Line: 4
        local UIStroke, UIStroke_2
        local props = a1.props
        for i, v in ipairs((a1.labels:Get())) do
            if props.color then
                v.TextColor3 = Color3.fromHex(props.color)
            end
            if props.style then
                v.Font = props.style
            end
            if props.stroke then
                UIStroke = v:FindFirstChildOfClass("UIStroke") or Instance.new("UIStroke", v)
                UIStroke.Thickness = tonumber(props.stroke)
            end
            if props.strokeTransparency then
                UIStroke_2 = v:FindFirstChildOfClass("UIStroke")
                if UIStroke_2 then
                    UIStroke_2.Transparency = tonumber(props.strokeTransparency)
                end
            end
        end
        return true
    end,
}