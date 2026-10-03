-- Script path: ReplicatedStorage.Client.Controllers.Game.ShrineBillboardMount
-- Decompile time: 4.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local ShrineBillboard = require(ReplicatedStorage.Client.Interfaces.Game.Components.ShrineBillboard)
local v1 = {}
local u28 = {
    "Active",
    "Activated",
    "Completed",
    "DurationWaves",
    "RemainingWaves",
    "RewardAmount",
    "RewardCurrencyType",
    "RewardLabel",
    "ShrineName",
}

local function getNumberAttribute(a1, a2, a3) -- Line: 22 -- types: a1: userdata, a2: string, a3: number
    local Attribute = a1:GetAttribute(a2)
    if typeof(Attribute) == "number" then
        return Attribute
    end
    return a3
end

local function getStringAttribute(a1, a2, a3) -- Line: 32 -- types: a1: userdata, a2: string, a3: string
    local Attribute = a1:GetAttribute(a2)
    if typeof(Attribute) == "string" and Attribute ~= "" then
        return Attribute
    end
    return a3
end

local function getPrimaryPart(a1) -- Line: 42 -- types: a1: userdata
    if a1.PrimaryPart then
        return a1.PrimaryPart
    end
    return a1:FindFirstChildWhichIsA("BasePart", true)
end

local function waitForShrinePrompt(a1, a2) -- Line: 50 -- types: a1: userdata, a2: function
    local v1 = os.clock() + 5
    local ShrinePrompt = a1:FindFirstChild("ShrinePrompt", true)
    local v2 = a2
    while true do
        if not ShrinePrompt then
            if not v3.Parent or not (os.clock() < v1) or v2() then
                break
            end
        elseif ShrinePrompt:IsA("ProximityPrompt") or not v3.Parent or not (os.clock() < v1) or v2() then
            break
        end
        task.wait()
        ShrinePrompt = v3:FindFirstChild("ShrinePrompt", true)
    end
    if v2() then
        return nil
    end
    if ShrinePrompt and ShrinePrompt:IsA("ProximityPrompt") then
        return ShrinePrompt
    end
    return nil
end

local function getUiContainer(a1, a2) -- Line: 71 -- types: a1: userdata, a2: userdata
    if a2.Parent and a2.Parent:IsA("Attachment") then
        return a2.Parent
    end
    local PrimaryPart = if not a1.PrimaryPart then a1:FindFirstChildWhichIsA("BasePart", true) else a1.PrimaryPart
    local PromptAtt = PrimaryPart and PrimaryPart:FindFirstChild("PromptAtt")
    if PromptAtt and PromptAtt:IsA("Attachment") then
        return PromptAtt
    end
    return PrimaryPart
end

local function createShrineBillboardGui(a1) -- Line: 85 -- types: a1: userdata
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "ProgressUI"
    BillboardGui.AlwaysOnTop = false
    BillboardGui.ClipsDescendants = true
    BillboardGui.Enabled = true
    BillboardGui.LightInfluence = 0
    BillboardGui.MaxDistance = (1 / 0)
    BillboardGui.Size = UDim2.fromScale(3, 3)
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Parent = a1
    BillboardGui.StudsOffsetWorldSpace = Vector3.new(0, 3.5, 0)
    return BillboardGui
end

local function getShrineUiProps(a1, a2, a3) -- Line: 101 -- types: a1: userdata, a2: boolean, a3: number
    local v1 = a1:GetAttribute("Completed") == true
    local v2 = true
    if a1:GetAttribute("Activated") ~= true then
        v2 = a1:GetAttribute("Active") == true
    end
    local Attribute = a1:GetAttribute("DurationWaves")
    local v3 = math.max(math.floor(if typeof(Attribute) ~= "number" then 1 else Attribute), 1)
    local Attribute_2 = a1:GetAttribute("RemainingWaves")
    local v4 = {AnimationKey = a3}
    v4.CompletedWaves = math.clamp(v3 - (math.clamp(math.floor(if typeof(Attribute_2) ~= "number" then v3 else Attribute_2), 0, v3)), 0, v3)
    v4.DurationWaves = v3
    v4.Mode = if not v2 then "Reward" else "Progress"
    local Attribute_3 = a1:GetAttribute("RewardAmount")
    v4.RewardAmount = if typeof(Attribute_3) ~= "number" then 0 else Attribute_3
    local Attribute_4 = a1:GetAttribute("RewardCurrencyType")
    v4.RewardCurrencyType = if typeof(Attribute_4) ~= "string" then "Gems" else if Attribute_4 == "" then "Gems" else Attribute_4
    local Attribute_5 = a1:GetAttribute("RewardLabel")
    v4.RewardLabel = if typeof(Attribute_5) ~= "string" then "Gems" else if Attribute_5 == "" then "Gems" else Attribute_5
    local Name = a1.Name
    local Attribute_6 = a1:GetAttribute("ShrineName")
    v4.ShrineName = if typeof(Attribute_6) ~= "string" then Name else if Attribute_6 == "" then Name else Attribute_6
    v4.Visible = not v1 and (v2 or a2)
    return v4
end

local function renderShrineUi(a1, a2) -- Line: 125
    -- upvalues: getShrineUiProps (val), React (val), ShrineBillboard (val)
    if not a1.Parent then
        return
    end
    local v1 = getShrineUiProps(a1, a2.promptShown, a2.animationVersion)
    if v1.Visible then
        if a2.lastVisible ~= true or a2.lastMode ~= v1.Mode then
            a2.animationVersion = a2.animationVersion + 1
            v1.AnimationKey = a2.animationVersion
        end
    end
    a2.lastVisible = v1.Visible
    a2.lastMode = v1.Mode
    a2.root:render((React.createElement(ShrineBillboard, v1)))
end

function v1.mount(a1) -- Line: 141
    -- upvalues: Maid (val), waitForShrinePrompt (val), ReactRoblox (val), renderShrineUi (val), u28 (val)
    local u3 = Maid.new()
    local u4 = false

    local function u6() -- Line: 146 -- upvalues: u4 (ref), u3 (val)
        u4 = true
        u3:Sweep()
    end

    task.spawn(function() -- Line: 151
        -- upvalues: waitForShrinePrompt (upval), a1 (val), u4 (ref), ReactRoblox (upval), u3 (val)
        -- upvalues: renderShrineUi (upval), u28 (upval), u6 (ref)
        local v1 = waitForShrinePrompt(a1, function() -- Line: 152 -- upvalues: u4 (upval)
            return u4
        end)
        if not u4 and v1 and a1.Parent then
            local Parent
            local v2 = a1
            if not v1.Parent or not v1.Parent:IsA("Attachment") then
                local PrimaryPart = if not v2.PrimaryPart then v2:FindFirstChildWhichIsA("BasePart", true) else v2.PrimaryPart
                local PromptAtt = PrimaryPart and PrimaryPart:FindFirstChild("PromptAtt")
                Parent = if not PromptAtt then PrimaryPart else if not PromptAtt:IsA("Attachment") then PrimaryPart else PromptAtt
            else
                Parent = v1.Parent
            end
            if not Parent then
                return
            end
            local ProgressUI = Parent:FindFirstChild("ProgressUI")
            if ProgressUI then
                ProgressUI:Destroy()
            end
            local BillboardGui = Instance.new("BillboardGui")
            BillboardGui.Name = "ProgressUI"
            BillboardGui.AlwaysOnTop = false
            BillboardGui.ClipsDescendants = true
            BillboardGui.Enabled = true
            BillboardGui.LightInfluence = 0
            BillboardGui.MaxDistance = (1 / 0)
            BillboardGui.Size = UDim2.fromScale(3, 3)
            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            BillboardGui.Parent = Parent
            BillboardGui.StudsOffsetWorldSpace = Vector3.new(0, 3.5, 0)
            local u62 = {animationVersion = 0, promptShown = false}
            u62.root = ReactRoblox.createRoot(BillboardGui)
            u3:Mark(function() -- Line: 179 -- upvalues: u62 (val)
                u62.root:unmount()
            end)
            u3:Mark(BillboardGui)
            u3:Mark((v1.PromptShown:Connect(function() -- Line: 184 -- upvalues: u62 (val), renderShrineUi (upval), a1 (upval)
                u62.promptShown = true
                renderShrineUi(a1, u62)
            end)))
            u3:Mark((v1.PromptHidden:Connect(function() -- Line: 189 -- upvalues: u62 (val), renderShrineUi (upval), a1 (upval)
                u62.promptShown = false
                renderShrineUi(a1, u62)
            end)))
            for i, j in u28 do
                u3:Mark(((a1:GetAttributeChangedSignal(j)):Connect(function() -- Line: 195 -- upvalues: renderShrineUi (upval), a1 (upval), u62 (val)
                    renderShrineUi(a1, u62)
                end)))
            end
            local v3 = u6
            u3:Mark((a1.Destroying:Connect(v3)))
            renderShrineUi(a1, u62)
            return
        end
    end)
    return u6
end

return v1