-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.UI.DialogResponse
-- Decompile time: 1.92 ms

local Dependencies = require(script.Parent.Parent.Dependencies)
local React = Dependencies.get("React")
local ReactFlow = Dependencies.get("ReactFlow")
Dependencies.get("Charm")
local DialogBubble = require(script.Parent.DialogBubble)
local useDialogRevealText = require(script.Parent.useDialogRevealText)
local useAtom = require(script.Parent.useAtom)
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local memo = React.memo
local createElement = React.createElement
local useEffect = React.useEffect
local u39 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
return memo(function(a1) -- Line: 48
    -- upvalues: useAtom (val), useGroupAnimation (val), useSequenceAnimation (val), ReactFlow (val)
    -- upvalues: useDialogRevealText (val), useEffect (val), createElement (val), DialogBubble (val), u39 (val)
    local u3 = useAtom(a1.visible)
    local get = a1.dialogText.get
    local v1, u76 = useGroupAnimation({
        show = useSequenceAnimation({
            {
                timestamp = 0,
                backgroundTransparency = ReactFlow.Tween({
                    target = 0.35,
                    info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                }),
                backgroundSize = ReactFlow.Spring({speed = 12, target = UDim2.fromScale(1, 0.6)}),
            },
            {
                timestamp = 0.05,
                dialogTransparency = ReactFlow.Tween({
                    target = 0,
                    info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                }),
            },
        }),
        hide = useSequenceAnimation({
            {
                timestamp = 0,
                dialogTransparency = ReactFlow.Tween({
                    target = 1,
                    info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                }),
            },
            {
                timestamp = 0.05,
                backgroundTransparency = ReactFlow.Tween({
                    target = 1,
                    info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                }),
                backgroundSize = ReactFlow.Spring({speed = 12, target = UDim2.fromScale(0.4, 0.6)}),
            },
        }),
    }, {
        backgroundTransparency = 1,
        dialogTransparency = 1,
        backgroundSize = UDim2.fromScale(0.4, 0.6),
    })
    local v2, v3 = useDialogRevealText(get, {
        revealInterval = 0.018,
        active = u3,
        onShow = function() -- Line: 105 -- upvalues: u76 (val)
            u76("show")
        end,
        onHide = function() -- Line: 108 -- upvalues: u76 (val)
            u76("hide")
        end,
    })
    local v4 = if v3 == "" then v2:getValue() else v3
    local v5 = {u3}
    useEffect(function() -- Line: 114 -- upvalues: u3 (val), u76 (val)
        if not u3 then
            u76("hide")
        end
    end, v5)
    return createElement(DialogBubble, {
        textSize = 20,
        measureMaxWidth = 5000,
        minWidth = 240,
        maxWidth = 1060,
        minHeight = 64,
        horizontalPadding = 48,
        verticalPadding = 30,
        textBlockHeightScale = 0.8,
        textHorizontalInset = 32,
        textVerticalInset = 16,
        textWrapped = false,
        native = a1.native,
        text = v2,
        layoutText = v4,
        fontFace = u39,
        textXAlignment = Enum.TextXAlignment.Center,
        textYAlignment = Enum.TextYAlignment.Center,
        backgroundSize = v1.backgroundSize,
        backgroundTransparency = v1.backgroundTransparency,
        textTransparency = v1.dialogTransparency,
        strokeTransparency = v1.dialogTransparency,
    })
end)