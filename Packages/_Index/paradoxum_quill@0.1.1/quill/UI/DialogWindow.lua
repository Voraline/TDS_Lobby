-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.UI.DialogWindow
-- Decompile time: 3.83 ms

local Dependencies = require(script.Parent.Parent.Dependencies)
local React = Dependencies.get("React")
Dependencies.get("Charm")
local ReactFlow = Dependencies.get("ReactFlow")
local DialogBubble = require(script.Parent.DialogBubble)
local useDialogRevealText = require(script.Parent.useDialogRevealText)
local useAtom = require(script.Parent.useAtom)
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local memo = React.memo
local createElement = React.createElement
local useEffect = React.useEffect
local u40 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
local u45 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
return memo(function(a1) -- Line: 60
    -- upvalues: useAtom (val), useGroupAnimation (val), useSequenceAnimation (val), ReactFlow (val), useAnimation (val)
    -- upvalues: useDialogRevealText (val), useEffect (val), createElement (val), DialogBubble (val), u40 (val)
    -- upvalues: u45 (val)
    local u3 = useAtom(a1.visible)
    local u6 = useAtom(a1.interacting)
    local get = a1.dialogText.get
    local v1, u39 = useGroupAnimation({
        enable = useSequenceAnimation({
            {
                timestamp = 0.05,
                dialogTransparency = ReactFlow.Tween({
                    target = 0,
                    info = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                }),
            },
        }),
        disable = useSequenceAnimation({
            {
                timestamp = 0,
                dialogTransparency = ReactFlow.Tween({
                    target = 1,
                    info = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                }),
            },
        }),
    }, {dialogTransparency = 1})
    local v2, u170 = useGroupAnimation({
        enable = useSequenceAnimation({
            {
                timestamp = 0,
                nameTagPosition = ReactFlow.Spring({damper = 0.5, speed = 12, target = UDim2.fromScale(0.5, 0)}),
                nameTagSize = ReactFlow.Spring({speed = 10, target = UDim2.fromScale(0.5, 0.25)}),
                tagIconSize = ReactFlow.Spring({speed = 25, target = UDim2.fromScale(0, 0)}),
                tagIconPosition = ReactFlow.Spring({speed = 20, target = UDim2.fromScale(0.5, 0.7)}),
            },
            {
                timestamp = 0.05,
                backgroundTransparency = ReactFlow.Tween({
                    target = 0.25,
                    info = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                }),
                backgroundSize = ReactFlow.Spring({speed = 10, target = UDim2.fromScale(1, 0.5)}),
            },
        }),
        disable = useAnimation({
            nameTagPosition = ReactFlow.Spring({damper = 0.45, speed = 10, target = UDim2.fromScale(0.5, 0.6)}),
            nameTagSize = ReactFlow.Spring({speed = 10, target = UDim2.fromScale(0.5, 0.2)}),
            backgroundTransparency = ReactFlow.Tween({
                target = 1,
                info = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            backgroundSize = ReactFlow.Spring({speed = 10, target = UDim2.fromScale(0.4, 0.5)}),
            tagIconSize = ReactFlow.Spring({damper = 0.2, speed = 15, target = UDim2.fromScale(0.06, 0.06)}),
            tagIconPosition = ReactFlow.Spring({speed = 15, target = UDim2.fromScale(0.5, 0.9)}),
        }),
    }, {
        backgroundTransparency = 1,
        nameTagPosition = UDim2.fromScale(0.5, 0),
        backgroundSize = UDim2.fromScale(0.4, 0.5),
        tagIconSize = UDim2.fromScale(0.05, 0.05),
        tagIconPosition = UDim2.fromScale(0.5, 0.75),
        nameTagSize = UDim2.fromScale(0.3, 0.3),
    })
    local v3, u199 = useGroupAnimation({
        enable = useAnimation({
            nameTagTransparency = ReactFlow.Tween({
                target = 0,
                info = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
        }),
        disable = useAnimation({
            nameTagTransparency = ReactFlow.Tween({
                target = 1,
                info = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
        }),
    }, {dialogTransparency = 1, nameTagTransparency = 1})
    local v4, v5 = useDialogRevealText(get, {
        revealInterval = 0.018,
        active = u3 and u6,
        speaker = a1.dialogBlipSpeaker,
        onShow = function() -- Line: 190 -- upvalues: u39 (val)
            u39("enable")
        end,
        onHide = function() -- Line: 193 -- upvalues: u39 (val)
            u39("disable")
        end,
    })
    local v6 = if v5 == "" then v4:getValue() else v5
    local v7 = {u3, u6}
    useEffect(function() -- Line: 199 -- upvalues: u3 (val), u199 (val), u6 (val), u170 (val)
        if not u3 then
            u199("disable")
        else
            u199("enable")
        end
        if u3 and u6 then
            u170("enable")
            return
        end
        u170("disable")
    end, v7)
    return createElement(DialogBubble, {
        textSize = 24,
        minTextSize = 22,
        measureMaxWidth = 10000,
        fitTextMaxWidth = 2476,
        minWidth = 380,
        maxWidth = 2600,
        minHeight = 96,
        horizontalPadding = 124,
        verticalPadding = 42,
        textBlockHeightScale = 0.8,
        textHorizontalInset = 52,
        textVerticalInset = 20,
        textWrapped = false,
        native = a1.native,
        text = v4,
        layoutText = v6,
        fontFace = u40,
        textXAlignment = Enum.TextXAlignment.Center,
        textYAlignment = Enum.TextYAlignment.Center,
        backgroundSize = v2.backgroundSize,
        backgroundTransparency = v2.backgroundTransparency,
        textTransparency = v1.dialogTransparency,
        strokeTransparency = v1.dialogTransparency,
        children = {
            Nametag = createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = v2.nameTagPosition,
                Size = v2.nameTagSize,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = u45,
                Text = a1.npcName,
                TextTransparency = v3.nameTagTransparency,
                TextStrokeTransparency = v3.nameTagTransparency,
            }),
            TagIcon = createElement("Frame", {
                BackgroundTransparency = 0,
                Rotation = 45,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = v2.tagIconPosition,
                Size = v2.tagIconSize,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            }, {
                UIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
                UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.25, 0)}),
                UIStroke = createElement("UIStroke", {
                    Transparency = 0,
                    Thickness = 0.25,
                    Color = Color3.fromRGB(0, 0, 0),
                    StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
                }),
            }),
        },
    })
end)