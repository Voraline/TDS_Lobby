-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.CutsceneSkipVote
-- Decompile time: 2.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.Button)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useState = React.useState
return memo(function(a1) -- Line: 22
    -- upvalues: useState (val), useEffect (val), createElement (val), Button (val)
    local u3 = a1.visible ~= false
    local v1 = math.max(a1.holdDuration or 1.25, 0.1)
    local v2, u13 = useState(false)
    local u15 = a1.hasVoted or v2
    local v3 = {u3}
    useEffect(function() -- Line: 28 -- upvalues: u3 (val), u13 (val)
        if not u3 then
            u13(false)
        end
    end, v3)
    if not u3 then
        return nil
    end
    local v4 = math.max(a1.requiredVotes, 1)
    local v5 = math.clamp(a1.votes, 0, v4)
    local v6 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    local v7 = {}
    local v8 = {
        btnHoverScale = 20,
        dontScale = true,
        dontUseRatio = true,
        textSize = 18,
        anchorPoint = Vector2.new(0, 1),
        automaticSize = Enum.AutomaticSize.None,
    }
    local v9 = if not u15 then Color3.fromRGB(80, 255, 86) else Color3.fromRGB(33, 111, 42)
    v8.color = v9
    v8.holdTime = if not u15 then v1 else nil
    v8.position = UDim2.new(0, 28, 1, -28)
    v8.size = UDim2.fromOffset(280, 52)
    v8.text = ("%*  %*/%*"):format(if not u15 then "HOLD TO SKIP" else "VOTED TO SKIP", v5, v4)

    function v8.onClick() -- Line: 59 -- upvalues: u15 (val), u13 (val), a1 (val)
        if u15 then
            return
        end
        u13(true)
        a1.onVote()
    end

    v7.button = createElement(Button, v8)
    return createElement("Frame", v6, v7)
end)