-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.UI.DialogBubble
-- Decompile time: 2.66 ms

local TextService = game:GetService("TextService")
local createElement = ((require(script.Parent.Parent.Dependencies)).get("React")).createElement

local function mergeDictionaries(a1, a2) -- Line: 42 -- types: a1: table, a2: table?
    local v1 = table.clone(a1)
    if a2 then
        for i, j in a2 do
            v1[i] = j
        end
    end
    return v1
end

return function(a1) -- Line: 52 -- upvalues: TextService (val), createElement (val) -- types: a1: table
    local v1
    local fitTextMaxWidth = a1.fitTextMaxWidth or a1.measureMaxWidth
    local layoutText = if a1.layoutText == "" then " " else a1.layoutText
    local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
    GetTextBoundsParams.Text = layoutText
    GetTextBoundsParams.Font = a1.fontFace
    GetTextBoundsParams.Size = a1.textSize
    GetTextBoundsParams.Width = fitTextMaxWidth
    local success, result = pcall(function() -- Line: 62 -- upvalues: TextService (upval), GetTextBoundsParams (val)
        return TextService:GetTextBoundsAsync(GetTextBoundsParams)
    end)
    local v2 = math.clamp(math.ceil((if not success then Vector2.new(0, 0) else result).X + a1.horizontalPadding), a1.minWidth, a1.maxWidth)
    local v3 = math.max(
        a1.minHeight,
        (math.ceil((math.max(a1.minHeight, (math.ceil(v1.Y + a1.verticalPadding)))) / (math.max(a1.textBlockHeightScale, 0.01))))
    )
    local v4 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(v2, v3),
    }
    local native = a1.native
    local v5 = table.clone(v4)
    if native then
        for i, j in native do
            v5[i] = j
        end
    end
    local v6 = {}
    local v7 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1, a1.textBlockHeightScale),
    }
    local v8 = {
        BackgroundFrame = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = a1.backgroundSize,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = a1.backgroundTransparency,
        }),
    }
    local v9 = {
        TextScaled = false,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -a1.textHorizontalInset, 1, -a1.textVerticalInset),
    }
    local textColor3 = a1.textColor3 or Color3.fromRGB(255, 255, 255)
    v9.TextColor3 = textColor3
    v9.TextSize = a1.textSize
    v9.TextWrapped = a1.textWrapped
    v9.TextXAlignment = a1.textXAlignment
    v9.TextYAlignment = a1.textYAlignment
    v9.FontFace = a1.fontFace
    v9.Text = a1.text
    v9.TextTransparency = a1.textTransparency
    v9.TextStrokeTransparency = a1.strokeTransparency
    v8.DialogText = createElement("TextLabel", v9)
    v6.TextBlock = createElement("Frame", v7, v8)
    local children = a1.children
    v4 = table.clone(v6)
    if children then
        for k, n in children do
            v4[k] = n
        end
    end
    return createElement("Frame", v5, v4)
end