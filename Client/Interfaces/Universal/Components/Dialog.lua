-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Dialog
-- Decompile time: 31.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local u37 = nil
if RunService:IsRunning() then
    u37 = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
end
local Assets = ReplicatedStorage:WaitForChild("Assets")
require(ReplicatedStorage.Shared.Modules.GameState)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Client.Interfaces.Components.RichText)
require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
if not RunService:IsRunning() then
    GameState = {State = {TimeScale = 1}}
end
local useTween = ReactFlow.useTween
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
local u124 = true
local u129 = Color3.fromRGB(0, 0, 0)
local u130 = {
    ["Fallen King"] = {Rage = 18703413345},
    ["Giga AJ"] = {Default = 6782390382, Scared = 6782390112, Aggressive = 6782389815},
    ["Void Caster"] = {
        Default = 5666897699,
        Laugh = 5666897534,
        Aggressive = 5666897413,
        Challenge = 5666897090,
        Command = 5666897227,
        Depressed = 5666897326,
        Chant = 5666897830,
    },
    Narrator = {Default = 5886599151, Evil = 5886599496, Sinister = 5886599834},
    Jaxe = {Default = 7894201849, Aggressive = 7894201974, Scared = 7894201679, Taunt = 7894201438},
    ["Swamp Monster"] = {Default = 7894210791, Aggressive = 7894211007, Scared = 7894210628, Taunt = 7894210479},
    Penumbras = {Default = 7894218958, Aggressive = 7894219174, Scared = 7894218734, Taunt = 7894218357},
    ["The Umbra"] = {Default = 7894224041, Aggressive = 7894224207, Scared = 7894223845, Taunt = 7894223537},
}

local function getPlainText(a1, a2) -- Line: 112 -- types: a1: string?, a2: boolean?
    if not a1 then
        return ""
    end
    if not a2 then
        return a1
    end
    return (a1:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", ""))
end

local function getGraphemeCount(a1, a2) -- Line: 125 -- types: a1: string?, a2: boolean?
    local v1 = 0
    local graphemes = utf8.graphemes
    local v2 = a1
    for i in graphemes(if v2 then if a2 then v2:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v2 else "") do
        v1 = v1 + 1
    end
    return v1
end

local function getWordCount(a1) -- Line: 135 -- upvalues: math (val) -- types: a1: string
    local v1 = 0
    for i in string.gmatch(a1, "%S+") do
        v1 = v1 + 1
    end
    return math.max(5, v1)
end

local function getPageReadDelay(a1, a2) -- Line: 145 -- upvalues: math (val) -- types: a1: string, a2: boolean?
    local v1 = a1
    local v2 = if v1 then if a2 then v1:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v1 else ""
    v1 = 0
    for i in string.gmatch(v2, "%S+") do
        v1 = v1 + 1
    end
    return math.clamp(math.max(5, v1) / 3 * 0.45, 0.75, 2.25)
end

local function hasOpenRichTextTag(a1) -- Line: 150 -- types: a1: string
    local v1, v2
    local v3 = {}
    for i in a1:gmatch("<(.-)>") do
        if not i:match("^%s*br%s*/?%s*$") and not i:match("/%s*$") then
            v1 = i:match("^%s*/%s*([%w]+)")
            if not v1 then
                v2 = i:match("^%s*([%w]+)")
                if v2 then
                    table.insert(v3, v2)
                end
            else
                for j = #v3, 1, -1 do
                    if v3[j] == v1 then
                        table.remove(v3, j)
                        break
                    end
                end
            end
        end
    end
    return #v3 > 0
end

local function textFitsPage(a1, a2, a3) -- Line: 177
    -- upvalues: TextService (val)
    local v1 = a1
    return TextService:GetTextSize(
        if v1 then if a2 then v1:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v1 else "",
        a3,
        Enum.Font.GothamBold,
        (Vector2.new(512, 10000))
    ).Y <= 108
end

local function trimLeadingWhitespace(a1) -- Line: 188 -- types: a1: string
    return (a1:gsub("^%s+", ""))
end

local function isNaturalBreak(a1, a2) -- Line: 192 -- types: a1: string, a2: boolean?
    local v1 = a1
    v1 = (if v1 then if a2 then v1:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v1 else ""):gsub("%s+$", ""):match("[%.%!%?%;:,]$") ~= nil
    return v1
end

local function canUseNaturalBreak(a1, a2) -- Line: 197
    -- upvalues: hasOpenRichTextTag (val)
    if a2 and hasOpenRichTextTag(a1) then
        return false
    end
    local v1 = false
    local v2 = 0
    local graphemes = utf8.graphemes
    local v3 = a1
    for i in graphemes(if v3 then if a2 then v3:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v3 else "") do
        v2 = v2 + 1
    end
    if v2 >= 70 then
        local v4 = a1
        v1 = ((if v4 then if a2 then v4:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v4 else ""):gsub("%s+$", "")):match("[%.%!%?%;:,]$") ~= nil
    end
    return v1
end

local function splitDialogText(a1, a2, a3) -- Line: 206
    -- upvalues: TextService (val), hasOpenRichTextTag (val)
    if a1 and a1 ~= "" then
        local graphemes, v1, v2, v3, v4, v5, v6, v7, v8, v9
        local v10 = a1
        if TextService:GetTextSize(
            if v10 then if a2 then v10:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v10 else "",
            a3,
            Enum.Font.GothamBold,
            (Vector2.new(512, 10000))
        ).Y <= 108 then
            return {a1}
        end
        local v11 = {}
        local v12 = ""
        local v13 = nil
        for i, j in a1:gmatch("(%s*)(%S+)") do
            v3 = v12 .. (if v12 ~= "" then i .. j else j)
            if v12 == "" then
                v12 = v3
            else
                v7 = v3
                if TextService:GetTextSize(
                    if v7 then if v1 then v7:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v7 else "",
                    v9,
                    Enum.Font.GothamBold,
                    (Vector2.new(512, 10000))
                ).Y <= 108 then
                    v12 = v3
                elseif not v1 then
                    if not v13 then
                        table.insert(v11, v12)
                        v12 = j
                    else
                        table.insert(v11, v13)
                        v12 = ((v12:sub(#v13 + 1)) .. v2):gsub("^%s+", "")
                    end
                elseif hasOpenRichTextTag(v12) then
                    v12 = v3
                elseif not v13 then
                    table.insert(v11, v12)
                    v12 = j
                else
                    table.insert(v11, v13)
                    v12 = ((v12:sub(#v13 + 1)) .. v2):gsub("^%s+", "")
                end
            end
            if not v1 then
                v4 = false
                v5 = 0
                graphemes = utf8.graphemes
                v8 = v12
                for k in graphemes(if v8 then if v1 then v8:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v8 else "") do
                    v5 = v5 + 1
                end
                if v5 >= 70 then
                    v6 = v12
                    v4 = ((if v6 then if v1 then v6:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v6 else ""):gsub("%s+$", "")):match("[%.%!%?%;:,]$") ~= nil
                end
            elseif not hasOpenRichTextTag(v12) then
                v4 = false
                v5 = 0
                graphemes = utf8.graphemes
                v8 = v12
                for n in graphemes(if v8 then if v1 then v8:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v8 else "") do
                    v5 = v5 + 1
                end
                if v5 >= 70 then
                    v6 = v12
                    v4 = ((if v6 then if v1 then v6:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v6 else ""):gsub("%s+$", "")):match("[%.%!%?%;:,]$") ~= nil
                end
            else
                v4 = false
            end
            if v4 then end
        end
        if v12 ~= "" then
            table.insert(v11, v12)
        end
        return v11
    end
    return {""}
end

local function toggleTransparency(a1, a2) -- Line: 253 -- types: a1: userdata, a2: boolean
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Transparency = if not a2 then 1 else 0
        end
    end
end

local function applySilhouette(a1) -- Line: 261 -- upvalues: u129 (val) -- types: a1: userdata
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Color = u129
            j.Material = Enum.Material.SmoothPlastic
            if j.Transparency < 1 then
                j.Transparency = 0
            end
            if j:IsA("MeshPart") then
                j.TextureID = ""
            end
        elseif j:IsA("Decal") or j:IsA("Texture") then
            j.Transparency = 1
        elseif j:IsA("SurfaceAppearance") then
            j:Destroy()
        elseif j:IsA("SpecialMesh") then
            j.TextureId = ""
        elseif j:IsA("ImageLabel") or j:IsA("ImageButton") then
            j.ImageColor3 = u129
        end
    end
end

local function isDialogHidden(a1, a2) -- Line: 286 -- upvalues: Asset (val) -- types: a1: string?, a2: boolean?
    local v1
    if a2 ~= nil then
        return a2 == true
    end
    if not a1 then
        return false
    end
    local v2 = Asset("Dialog", a1, true)
    if not v2 then
        v1 = false
    else
        v1 = true
        if v2.Hidden ~= true then
            v1 = false
        end
    end
    return v1
end

local function toggleProp(a1, a2) -- Line: 299 -- types: a1: boolean, a2: string
    local Props = a1:FindFirstChild("Props")
    local v1 = Props and Props:FindFirstChild(a2)
    if v1 then
        for i, j in v1:GetDescendants() do
            if j:IsA("BasePart") then
                j.Transparency = 0
            end
        end
    end
end

local function DialogCharacter(a1) -- Line: 308
    -- upvalues: useState (val), useRef (val), useEffect (val), u130 (val), Assets (val), u124 (ref)
    -- upvalues: applySilhouette (val), Asset (val), RunService (val), React (val), createElement (val), u129 (val)
    -- upvalues: math (val)
    local v1, u4 = useState(nil)
    local v2, u8 = useState(false)
    local u11 = useRef(nil)
    local u14 = useRef(nil)
    local v3 = a1.Transparency or 0
    local u18 = a1.Speaker or "Commander"
    local u20 = a1.Emotion or "Default"
    local Flipped = a1.Flipped
    local u24 = a1.Hidden == true
    local v4 = {u18, u20}
    useEffect(function() -- Line: 321 -- upvalues: u130 (upval), u18 (val), u20 (val), u4 (val)
        local v1 = u130[u18]
        if v1 and v1[u20] then
            u4(v1[u20])
        end
    end, v4)
    v4 = {u18, u20, u24, u11, u14}
    useEffect(function() -- Line: 331
        -- upvalues: u11 (val), u14 (val), Assets (upval), u124 (upval), u8 (val), u18 (val), u24 (val)
        -- upvalues: applySilhouette (upval), Asset (upval), u20 (val), RunService (upval)
        if u11.current and u14.current then
            local Dialog = Assets:FindFirstChild("Dialog")
            if not Dialog then
                if u124 then
                    u124 = false
                    warn("Missing folder 'Dialog' from Assets in ReplicatedStorage. Make sure assets are in sync")
                end
                u8(true)
                return
            end
            local v1 = Dialog:FindFirstChild(u18)
            if not v1 then
                u8(true)
                return
            end
            local u26 = v1:Clone()
            if u24 then
                applySilhouette(u26)
            end
            local v2 = Asset("Dialog", u18, true)
            local Poses = v2 and v2.Poses
            u26:PivotTo(if not Poses then CFrame.new() else Poses[u20] or Poses.Default or Poses.Neutral or CFrame.new())
            u26.Parent = u11.current
            local Prop = u26:FindFirstChild("Prop")
            if Prop then
                for i, j in Prop:GetDescendants() do
                    if j:IsA("BasePart") then
                        j.Transparency = 1
                    end
                end
            end
            local u117 = nil
            local v3 = u26.Animations:FindFirstChild(u20)
            if not v3 then
                warn((("Animation \"%*\" not found for %*"):format(u20, u18)))
            else
                local AnimationController = u26:FindFirstChildOfClass("AnimationController") or u26:FindFirstChildOfClass("Humanoid")
                if AnimationController then
                    AnimationController:LoadAnimation(v3):Play(0)
                    if RunService:IsStudio() and not RunService:IsRunning() then
                        u117 = RunService.Heartbeat:Connect(function(a1) -- Line: 384 -- upvalues: u11 (upval)
                            u11.current:StepPhysics(a1)
                        end)
                    end
                end
                local Attribute = v3:GetAttribute("Prop")
                if Attribute then
                    local Props = u26:FindFirstChild("Props")
                    local v4 = Props and Props:FindFirstChild(Attribute)
                    if v4 then
                        for k, n in v4:GetDescendants() do
                            if n:IsA("BasePart") then
                                n.Transparency = 0
                            end
                        end
                    end
                end
            end
            u8(false)
            return function() -- Line: 400 -- upvalues: u117 (ref), u26 (val)
                if u117 then
                    u117:Disconnect()
                    u117 = nil
                end
                u26:Destroy()
            end
        end
    end, v4)
    local createElement_2 = React.createElement
    local Fragment = React.Fragment
    local v5 = {
        dialogCharacter = createElement("ViewportFrame", {
            LightDirection = Vector3.new(-1, -1, 1),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Selectable = true,
            ZIndex = 2,
            Visible = not v2,
            Ambient = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0, 1),
            ImageColor3 = if not u24 then Color3.fromRGB(255, 255, 255) else u129,
            ImageTransparency = v3,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(if not Flipped then 0 else 1, -136, 1, 0),
            Size = UDim2.fromOffset(320, 320),
            CurrentCamera = u14,
        }, {
            camera = createElement("Camera", {
                CFrame = (CFrame.new(0, 1.5, -4)) * CFrame.Angles(0, -math.rad(180), 0),
                ref = u14,
            }),
            gradient = createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.8, 0),
                    NumberSequenceKeypoint.new(0.9, 0.2),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
            worldModel = createElement("WorldModel", {ref = u11}),
        }),
    }
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Selectable = true,
        ZIndex = 2,
        Visible = v2,
        AnchorPoint = Vector2.new(0, 1),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    v6.Position = UDim2.new(if not Flipped then 0 else 1, -95, 1, 0)
    v6.Size = UDim2.fromOffset(210, 210)
    v6.Image = not temp and ("rbxassetid://%*"):format(v1 or 0) or v1
    v6.ImageColor3 = if not u24 then Color3.fromRGB(255, 255, 255) else u129
    v6.ImageTransparency = v3
    v5.dialogIcon = createElement("ImageLabel", v6, {
        gradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.8, 0),
                NumberSequenceKeypoint.new(0.9, 0.2),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    return createElement_2(Fragment, {}, v5)
end

local function DialogActions(a1) -- Line: 481 -- upvalues: createElement (val), Button (val), math (val), React (val)
    local v1, v2, v3
    local Actions = a1.Actions or {}
    local Flipped = a1.Flipped
    local v4 = {}
    local v5 = 0
    for i in Actions do
        v5 = v5 + 1
        if v5 > 4 then
            break
        end
    end
    for j, k in Actions do
        v1 = createElement
        v2 = Button
        v3 = {
            Clicked = k.Clicked,
            Text = k.Text,
            Color = k.Color,
            Disabled = k.Disabled,
            LayoutOrder = k.LayoutOrder,
            Size = UDim2.new(1 / (v5 + 0.5), 0, 0, 48),
        }
        v4[j] = (v1(v2, v3))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.5, if not Flipped then 104 else -52, 1, 0),
        Size = UDim2.new(1, 0, 0, 64),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, math.map(v5, 2, 4, 32, 10)),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        buttons = React.createElement(React.Fragment, {}, v4),
    })
end

local function DialogContent(a1) -- Line: 529
    -- upvalues: useSound (val), useReactBinding (val), useFontScale (val), useState (val), useRef (val)
    -- upvalues: splitDialogText (val), math (val), Asset (val), RunService (val), GameState (ref), useEffect (val)
    -- upvalues: createElement (val), React (val)
    local u5 = useSound(a1.Blip or "Blip", true)
    local u8, u9 = useReactBinding(-1)
    local v1, u16 = useReactBinding(UDim2.fromOffset(0, 0))
    local v2 = useFontScale({size = 22, min = 22, max = 22})
    local v3 = useFontScale({size = 32, min = 32, max = 32})
    local v4, u26 = useState(1)
    local u29 = useRef(nil)
    local u32 = useRef(nil)
    local u35 = useRef(nil)
    local u38 = useRef(0)
    local u41 = useRef(nil)
    local u44 = useRef(nil)
    local u47 = useRef(nil)
    local u50 = useRef(false)
    local u53 = useRef(0)
    local u56 = useRef(false)
    local v5 = a1.Transparency or 0
    local DialogId = a1.DialogId
    local Text = a1.Text
    local RichText = a1.RichText
    local u66 = splitDialogText(Text, RichText, v2)
    local u72 = math.clamp(v4, 1, #u66)
    local u74 = u66[u72] or ""
    local Flipped = a1.Flipped
    local u78 = a1.TimeScaled ~= false
    u44.current = a1.VoiceLength
    u47.current = a1.PageDurations
    u50.current = a1.HasVoice == true
    local Speaker = a1.Speaker
    local v6 = "???"
    if a1.Hidden ~= true then
        v6 = a1.DisplayName or Speaker
        local v7 = Asset("Dialog", Speaker, true)
        if v7 and not a1.DisplayName then
            v6 = v7.DisplayName or v6
        end
    end

    local function stopPageTimer() -- Line: 579 -- upvalues: u35 (val)
        if u35.current then
            u35.current:Disconnect()
            u35.current = nil
        end
    end

    local function stopDialogTimer() -- Line: 586 -- upvalues: u41 (val)
        if u41.current then
            u41.current:Disconnect()
            u41.current = nil
        end
    end

    local function stopTextAnimation() -- Line: 593 -- upvalues: u29 (val), u32 (val)
        if u29.current then
            u29.current:Disconnect()
            u29.current = nil
        end
        if u32.current then
            u32.current:Disconnect()
            u32.current = nil
        end
    end

    local function skipTextAnimation() -- Line: 605
        -- upvalues: u53 (val), u8 (val), u56 (val), u9 (val), u29 (val), u32 (val)
        if u53.current <= 0 or u53.current <= (u8:getValue()) then
            return false
        end
        u56.current = true
        u9(u53.current)
        if u29.current then
            u29.current:Disconnect()
            u29.current = nil
        end
        if u32.current then
            u32.current:Disconnect()
            u32.current = nil
        end
        return true
    end

    local function advancePage() -- Line: 620 -- upvalues: u72 (val), u66 (val), u35 (val), u26 (val)
        if #u66 <= u72 then
            return
        end
        if u35.current then
            u35.current:Disconnect()
            u35.current = nil
        end
        u26(u72 + 1)
    end

    local function scheduleNextPage() -- Line: 629
        -- upvalues: u35 (val), u72 (val), u66 (val), u74 (val), RichText (val), math (upval), RunService (upval)
        -- upvalues: u78 (val), GameState (upval), u47 (val), u26 (val), u44 (val), u50 (val), u38 (val)
        if u35.current then
            u35.current:Disconnect()
            u35.current = nil
        end
        local v1 = u72
        if #u66 <= v1 then
            return
        end
        local u12 = 0
        local v2 = u74
        local v3 = if v2 then if RichText then v2:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v2 else ""
        v2 = 0
        for i in string.gmatch(v3, "%S+") do
            v2 = v2 + 1
        end
        local v4 = math.max(5, v2) / 3
        local u58 = math.clamp(v4 * 0.45, 0.75, 2.25)
        u35.current = RunService.Heartbeat:Connect(function(a1) -- Line: 639
            -- upvalues: u78 (upval), GameState (upval), u12 (ref), u47 (upval), u72 (upval), u66 (upval), u35 (upval)
            -- upvalues: u26 (upval), u44 (upval), u50 (upval), u38 (upval), u58 (val)
            local v1
            local TimeScale = if not u78 then 1 else GameState.State.TimeScale
            u12 = u12 + a1 * TimeScale
            local current = u47.current
            if current and current[u72] then
                local v2 = current[u72]
                if u12 < v2 then
                    return
                end
                v1 = u72
                if #u66 <= v1 then
                    return
                end
                if u35.current then
                    u35.current:Disconnect()
                    u35.current = nil
                end
                u26(u72 + 1)
                return
            end
            local current_2 = u44.current
            if u50.current and current_2 and current_2 > 0 then
                v1 = #u66
                if v1 > 1 then
                    v1 = current_2 * (u72 / #u66)
                    if not (u12 < 0.75) and not (u38.current < v1) then
                        local v3 = u72
                        if #u66 <= v3 then
                            return
                        end
                        if u35.current then
                            u35.current:Disconnect()
                            u35.current = nil
                        end
                        u26(u72 + 1)
                        return
                    end
                    return
                end
            end
            if u12 < u58 then
                return
            end
            v1 = u72
            if #u66 <= v1 then
                return
            end
            if u35.current then
                u35.current:Disconnect()
                u35.current = nil
            end
            u26(u72 + 1)
        end)
    end

    local v8 = {DialogId, Text, u78}
    useEffect(function() -- Line: 676 -- upvalues: u38 (val), u41 (val), RunService (upval), u78 (val), GameState (upval)
        u38.current = 0
        if u41.current then
            u41.current:Disconnect()
            u41.current = nil
        end
        u41.current = RunService.Heartbeat:Connect(function(a1) -- Line: 680 -- upvalues: u78 (upval), GameState (upval), u38 (upval)
            local TimeScale = if not u78 then 1 else GameState.State.TimeScale
            local v1 = u38
            v1.current = v1.current + a1 * TimeScale
        end)
        return function() -- Line: 685 -- upvalues: u41 (upval)
            if u41.current then
                u41.current:Disconnect()
                u41.current = nil
            end
        end
    end, v8)
    v8 = {DialogId, Text, RichText, v2}
    useEffect(function() -- Line: 690 -- upvalues: u26 (val)
        u26(1)
    end, v8)
    v8 = {DialogId, v2, Text, u74, RichText, u72}
    useEffect(function() -- Line: 694
        -- upvalues: Text (val), u74 (val), RichText (val), a1 (val), u56 (val), u53 (val), u35 (val), u29 (val)
        -- upvalues: u32 (val), u9 (val), u78 (val), GameState (upval), RunService (upval), u16 (val), math (upval)
        -- upvalues: u72 (val), u66 (val), u47 (val), u26 (val), u44 (val), u50 (val), u38 (val), u8 (val), u5 (val)
        local v1
        if Text == nil then
            return
        end
        local v2 = u74
        local v3 = if v2 then if RichText then v2:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v2 else ""
        local u98 = 0
        local u95 = 0
        for i in utf8.graphemes(v3) do
            v1 = a1.Glitch and Random.new():NextNumber(0.01, 0.2) * 1.1 or 0.02
            u95 = u95 + v1
            u98 = u98 + 1
        end
        local u31 = nil
        local u32_2 = nil
        u56.current = false
        u53.current = u98
        if u35.current then
            u35.current:Disconnect()
            u35.current = nil
        end
        if u29.current then
            u29.current:Disconnect()
            u29.current = nil
        end
        if u32.current then
            u32.current:Disconnect()
            u32.current = nil
        end
        local u79 = task.spawn(function() -- Line: 715
            -- upvalues: u56 (upval), u9 (upval), u78 (upval), GameState (upval), a1 (upval), u31 (ref)
            -- upvalues: RunService (upval), u16 (upval), math (upval), u32 (upval), u98 (ref), u35 (upval), u72 (upval)
            -- upvalues: u66 (upval), u74 (upval), RichText (upval), u47 (upval), u26 (upval), u44 (upval), u50 (upval)
            -- upvalues: u38 (upval), u32_2 (ref), u95 (ref), u8 (upval), u29 (upval), u5 (upval)
            if u56.current then
                return
            end
            u9(-1)
            local TimeScale = if not u78 then 1 else GameState.State.TimeScale
            if a1.Glitch then
                local u13 = tick()
                u31 = RunService.Heartbeat:Connect(function() -- Line: 726 -- upvalues: u13 (ref), TimeScale (val), u16 (upval), math (upval)
                    local v1 = tick() - u13
                    if 0.02 * TimeScale < v1 then
                        u16(UDim2.fromOffset((0.5 - math.random()) * 8, (0.5 - math.random()) * 8))
                        u13 = tick()
                    end
                end)
                u32.current = u31
            end
            local u23 = 0
            if not (u98 <= 0) then
                if u56.current then
                    return
                end
                u32_2 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 748
                    -- upvalues: u23 (ref), TimeScale (val), math (upval), u95 (upval), u98 (upval), u8 (upval)
                    -- upvalues: u31 (upval), u32 (upval), u32_2 (upval), u29 (upval), a1 (upval), u5 (upval)
                    -- upvalues: u9 (upval), u35 (upval), u72 (upval), u66 (upval), u74 (upval), RichText (upval)
                    -- upvalues: RunService (upval), u78 (upval), GameState (upval), u47 (upval), u26 (upval)
                    -- upvalues: u44 (upval), u50 (upval), u38 (upval)
                    u23 = u23 + a1_2 * TimeScale
                    local v1 = math.clamp(u23 / u95, 0, 1)
                    local v2 = math.floor(v1 * u98)
                    local v3 = u8:getValue()
                    if v2 == v3 then
                        return
                    end
                    if u98 <= v2 then
                        if u31 then
                            u31:Disconnect()
                            u31 = nil
                            u32.current = nil
                        end
                        u32_2:Disconnect()
                        u32_2 = nil
                        u29.current = nil
                    end
                    if v3 < v2 and a1.Enabled then
                        u5((1 + (0.15 - math.random() * 0.3)) * TimeScale)
                    end
                    u9(v2)
                    if u98 <= v2 then
                        if u35.current then
                            u35.current:Disconnect()
                            u35.current = nil
                        end
                        local v4 = u72
                        if #u66 <= v4 then
                            return
                        end
                        local u72_2 = 0
                        local v5 = u74
                        local v6 = if v5 then if RichText then v5:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v5 else ""
                        v5 = 0
                        for i in string.gmatch(v6, "%S+") do
                            v5 = v5 + 1
                        end
                        local v7 = math.max(5, v5) / 3
                        local u118 = math.clamp(v7 * 0.45, 0.75, 2.25)
                        u35.current = RunService.Heartbeat:Connect(function(a1) -- Line: 639
                            -- upvalues: u78 (upval), GameState (upval), u72_2 (ref), u47 (upval), u72 (upval)
                            -- upvalues: u66 (upval), u35 (upval), u26 (upval), u44 (upval), u50 (upval), u38 (upval)
                            -- upvalues: u118 (val)
                            local v1
                            local TimeScale = if not u78 then 1 else GameState.State.TimeScale
                            u72_2 = u72_2 + a1 * TimeScale
                            local current = u47.current
                            if current and current[u72] then
                                local v2 = current[u72]
                                if u72_2 < v2 then
                                    return
                                end
                                v1 = u72
                                if #u66 <= v1 then
                                    return
                                end
                                if u35.current then
                                    u35.current:Disconnect()
                                    u35.current = nil
                                end
                                u26(u72 + 1)
                                return
                            end
                            local current_2 = u44.current
                            if u50.current and current_2 and current_2 > 0 then
                                v1 = #u66
                                if v1 > 1 then
                                    v1 = current_2 * (u72 / #u66)
                                    if not (u72_2 < 0.75) and not (u38.current < v1) then
                                        local v3 = u72
                                        if #u66 <= v3 then
                                            return
                                        end
                                        if u35.current then
                                            u35.current:Disconnect()
                                            u35.current = nil
                                        end
                                        u26(u72 + 1)
                                        return
                                    end
                                    return
                                end
                            end
                            if u72_2 < u118 then
                                return
                            end
                            v1 = u72
                            if #u66 <= v1 then
                                return
                            end
                            if u35.current then
                                u35.current:Disconnect()
                                u35.current = nil
                            end
                            u26(u72 + 1)
                        end)
                    end
                end)
                u29.current = u32_2
                return
            end
            u9(0)
            if u35.current then
                u35.current:Disconnect()
                u35.current = nil
            end
            local v1 = u72
            if not (#u66 <= v1) then
                local u41 = 0
                local v2 = u74
                local v3 = if v2 then if RichText then v2:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v2 else ""
                v2 = 0
                for i in string.gmatch(v3, "%S+") do
                    v2 = v2 + 1
                end
                local v4 = math.max(5, v2) / 3
                local u87 = math.clamp(v4 * 0.45, 0.75, 2.25)
                u35.current = RunService.Heartbeat:Connect(function(a1) -- Line: 639
                    -- upvalues: u78 (upval), GameState (upval), u41 (ref), u47 (upval), u72 (upval), u66 (upval)
                    -- upvalues: u35 (upval), u26 (upval), u44 (upval), u50 (upval), u38 (upval), u87 (val)
                    local v1
                    local TimeScale = if not u78 then 1 else GameState.State.TimeScale
                    u41 = u41 + a1 * TimeScale
                    local current = u47.current
                    if current and current[u72] then
                        local v2 = current[u72]
                        if u41 < v2 then
                            return
                        end
                        v1 = u72
                        if #u66 <= v1 then
                            return
                        end
                        if u35.current then
                            u35.current:Disconnect()
                            u35.current = nil
                        end
                        u26(u72 + 1)
                        return
                    end
                    local current_2 = u44.current
                    if u50.current and current_2 and current_2 > 0 then
                        v1 = #u66
                        if v1 > 1 then
                            v1 = current_2 * (u72 / #u66)
                            if not (u41 < 0.75) and not (u38.current < v1) then
                                local v3 = u72
                                if #u66 <= v3 then
                                    return
                                end
                                if u35.current then
                                    u35.current:Disconnect()
                                    u35.current = nil
                                end
                                u26(u72 + 1)
                                return
                            end
                            return
                        end
                    end
                    if u41 < u87 then
                        return
                    end
                    v1 = u72
                    if #u66 <= v1 then
                        return
                    end
                    if u35.current then
                        u35.current:Disconnect()
                        u35.current = nil
                    end
                    u26(u72 + 1)
                end)
            end
        end)
        return function() -- Line: 785 -- upvalues: u35 (upval), u29 (upval), u32 (upval), u79 (val)
            if u35.current then
                u35.current:Disconnect()
                u35.current = nil
            end
            if u29.current then
                u29.current:Disconnect()
                u29.current = nil
            end
            if u32.current then
                u32.current:Disconnect()
                u32.current = nil
            end
            task.cancel(u79)
        end
    end, v8)
    v8 = {
        Active = a1.DisableSkip ~= true,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v5:map(function(a1) -- Line: 796
            return 0.6 + 0.4 * a1
        end),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Position = UDim2.fromOffset(if not Flipped then 104 else -50, 0),
        Size = UDim2.fromOffset(576, 180),
    }

    v8[React.Event.InputBegan] = function(a1_2, a2) -- Line: 804
        -- upvalues: a1 (val), u53 (val), u8 (val), u56 (val), u9 (val), u29 (val), u32 (val), u35 (val), u72 (val)
        -- upvalues: u66 (val), u74 (val), RichText (val), math (upval), RunService (upval), u78 (val)
        -- upvalues: GameState (upval), u47 (val), u26 (val), u44 (val), u50 (val), u38 (val)
        local v1
        if a2.UserInputType ~= Enum.UserInputType.MouseButton1 and a2.UserInputType ~= Enum.UserInputType.Touch then
            return
        end
        if a1.DisableSkip == true then
            return
        end
        if u53.current <= 0 then
            v1 = false
        elseif not (u53.current <= (u8:getValue())) then
            u56.current = true
            u9(u53.current)
            if u29.current then
                u29.current:Disconnect()
                u29.current = nil
            end
            if u32.current then
                u32.current:Disconnect()
                u32.current = nil
            end
            v1 = true
        else
            v1 = false
        end
        if not v1 then
            if u72 < #u66 then
                v1 = u72
                if #u66 <= v1 then
                    return
                end
                if u35.current then
                    u35.current:Disconnect()
                    u35.current = nil
                end
                u26(u72 + 1)
                return
            end
            if a1.OnSkipDialog then
                if u35.current then
                    u35.current:Disconnect()
                    u35.current = nil
                end
                a1.OnSkipDialog()
            end
            return
        end
        if u35.current then
            u35.current:Disconnect()
            u35.current = nil
        end
        v1 = u72
        if #u66 <= v1 then
            return
        end
        local u57 = 0
        local v2 = u74
        local v3 = if v2 then if RichText then v2:gsub("<br%s*/>", "\n"):gsub("<[^<>]->", "") else v2 else ""
        v2 = 0
        for i in string.gmatch(v3, "%S+") do
            v2 = v2 + 1
        end
        local v4 = math.max(5, v2) / 3
        local u103 = math.clamp(v4 * 0.45, 0.75, 2.25)
        u35.current = RunService.Heartbeat:Connect(function(a1) -- Line: 639
            -- upvalues: u78 (upval), GameState (upval), u57 (ref), u47 (upval), u72 (upval), u66 (upval), u35 (upval)
            -- upvalues: u26 (upval), u44 (upval), u50 (upval), u38 (upval), u103 (val)
            local v1
            local TimeScale = if not u78 then 1 else GameState.State.TimeScale
            u57 = u57 + a1 * TimeScale
            local current = u47.current
            if current and current[u72] then
                local v2 = current[u72]
                if u57 < v2 then
                    return
                end
                v1 = u72
                if #u66 <= v1 then
                    return
                end
                if u35.current then
                    u35.current:Disconnect()
                    u35.current = nil
                end
                u26(u72 + 1)
                return
            end
            local current_2 = u44.current
            if u50.current and current_2 and current_2 > 0 then
                v1 = #u66
                if v1 > 1 then
                    v1 = current_2 * (u72 / #u66)
                    if not (u57 < 0.75) and not (u38.current < v1) then
                        local v3 = u72
                        if #u66 <= v3 then
                            return
                        end
                        if u35.current then
                            u35.current:Disconnect()
                            u35.current = nil
                        end
                        u26(u72 + 1)
                        return
                    end
                    return
                end
            end
            if u57 < u103 then
                return
            end
            v1 = u72
            if #u66 <= v1 then
                return
            end
            if u35.current then
                u35.current:Disconnect()
                u35.current = nil
            end
            u26(u72 + 1)
        end)
    end

    local v9 = {
        uIStroke = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
            Transparency = v5,
        }, {
            uIGradient = createElement("UIGradient", {
                Rotation = if not Flipped then 125 else 45,
                Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
            }),
        }),
        speaker = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = v6,
            TextTransparency = v5,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = v3,
            AnchorPoint = Vector2.new(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(34, 34, 34),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromOffset(-20, 0),
            Size = UDim2.fromOffset(0, 40),
        }, {
            uIStroke1 = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(39, 39, 39), Transparency = v5}),
            uIPadding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 8),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
                PaddingTop = UDim.new(0, 8),
            }),
        }),
        uICorner = createElement("UICorner"),
    }
    local v10 = {
        TextScaled = false,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }
    local v11 = if not a1.RichText then u74 else v5:map(function(a1) -- Line: 884 -- upvalues: u74 (val)
        return (("<stroke color=\"#272727\" thickness=\"4\" transparency=\"%*\">%*</stroke>"):format(a1, u74))
    end)
    v10.Text = v11
    v10.TextTransparency = v5
    v10.MaxVisibleGraphemes = u8
    v10.TextColor3 = Color3.fromRGB(255, 255, 255)
    v10.TextSize = v2
    v10.RichText = a1.RichText
    v10.TextXAlignment = Enum.TextXAlignment.Left
    v10.TextYAlignment = Enum.TextYAlignment.Top
    v10.AnchorPoint = Vector2.new(0.5, 0.5)
    v10.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    v10.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v10.Position = v1:map(function(a1) -- Line: 903
        return UDim2.fromScale(0.5, 0.5) + a1
    end)
    v10.Size = UDim2.fromScale(1, 1)
    v9.dialogRichText = createElement("TextLabel", v10, {
        uIStroke2 = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(39, 39, 39), Transparency = v5}),
        uIPadding1 = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 32),
            PaddingLeft = UDim.new(0, 32),
            PaddingRight = UDim.new(0, 32),
            PaddingTop = UDim.new(0, 32),
        }),
    })
    return createElement("Frame", v8, v9)
end

return function(a1) -- Line: 924
    -- upvalues: useScale (val), useRef (val), Asset (val), useTween (val), useEffect (val), GameState (ref), math (val)
    -- upvalues: u37 (ref), RunService (val), createElement (val), DialogActions (val), DialogContent (val)
    -- upvalues: DialogCharacter (val)
    local v1
    local u3 = useScale(1)
    local Position = a1.Position
    if not Position then
        Position = UDim2.new(0.5, 0, 1, -96 * u3 - 32)
    end
    local u15 = useRef(nil)
    local current = a1
    local v2 = useRef(current)
    if v2.current and current.Text ~= v2.current.Text and current.Text == nil then
        current = v2.current
    end
    if current.Text then
        v2.current = current
    end
    local Text = current.Text
    local DialogId = current.DialogId
    local Speaker = current.Speaker
    local Emotion = current.Emotion
    local RichText = current.RichText
    local Flipped = if current.Flipped == nil then current.Flip else current.Flipped
    local Blip = current.Blip
    local Voice = current.Voice
    local VoiceLength = current.VoiceLength
    local Glitch = a1.Glitch
    local Hidden = current.Hidden
    if Hidden ~= nil then
        v1 = Hidden == true
    elseif Speaker then
        local v3 = Asset("Dialog", Speaker, true)
        if not v3 then
            v1 = false
        else
            v1 = true
            if v3.Hidden ~= true then
                v1 = false
            end
        end
    else
        v1 = false
    end
    local u65 = a1.TimeScaled ~= false
    local Visible = a1.Visible
    if Visible then
        Visible = false
        if Text ~= nil then
            Visible = Speaker ~= nil
        end
    end
    local v4, u86 = useTween({start = 1, target = 1, info = TweenInfo.new(0.2)})
    local v5 = {Visible}
    useEffect(function() -- Line: 966 -- upvalues: u65 (val), GameState (upval), math (upval), u86 (val), Visible (val)
        local v1 = 1 / (if not u65 then 1 else GameState.State.TimeScale)
        if v1 == math.huge then
            v1 = 0
        end
        u86({target = if not Visible then 1 else 0, info = TweenInfo.new(0.2 * v1)})
    end, v5)
    v5 = {DialogId, Voice, Visible, u65}
    useEffect(function() -- Line: 978
        -- upvalues: Visible (val), Voice (val), u37 (upval), u65 (val), GameState (upval), u15 (val)
        -- upvalues: RunService (upval)
        if not Visible or not Voice or not u37 then
            return
        end
        local u18 = u37("Voice", {
            Tag = "Dialog",
            Properties = {
                Volume = 1,
                SoundId = Voice,
                PlaybackSpeed = if not u65 then 1 else GameState.State.TimeScale,
            },
        })
        u15.current = u18.Sound
        local u21 = nil
        u21 = RunService.Heartbeat:Connect(function() -- Line: 1003 -- upvalues: u18 (val), u21 (ref), u65 (upval), GameState (upval)
            local Sound = u18.Sound
            if not Sound then
                return
            end
            if not Sound.IsPlaying then
                u21:Disconnect()
                u21 = nil
            end
            Sound.PlaybackSpeed = if not u65 then 1 else GameState.State.TimeScale
        end)
        u18:Play()
        return function() -- Line: 1019 -- upvalues: u21 (ref), u18 (val), u15 (upval)
            if u21 then
                u21:Disconnect()
                u21 = nil
            end
            u18:Stop()
            u15.current = nil
        end
    end, v5)
    v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local Size = a1.Size or UDim2.fromOffset(576, 180)
    v5.Size = Size
    v5.Position = v4:map(function(a1) -- Line: 1037 -- upvalues: Position (val), u3 (val)
        return Position + UDim2.fromOffset(0, 40 * a1 * u3)
    end)
    v5.Visible = v4:map(function(a1) -- Line: 1040
        return a1 < 1
    end)
    local v6 = {uiScale = createElement("UIScale", {Scale = u3})}
    local Actions = a1.Actions and createElement(DialogActions, {Actions = a1.Actions, Flipped = Flipped})
    v6.buttons = Actions
    v6.content = createElement(DialogContent, {
        DialogId = DialogId,
        Text = Text,
        Speaker = Speaker,
        DisplayName = current.DisplayName,
        RichText = RichText,
        Hidden = v1,
        Flipped = Flipped,
        Transparency = v4,
        Blip = Blip,
        Glitch = Glitch,
        Enabled = Visible,
        HasVoice = Voice ~= nil,
        VoiceLength = VoiceLength,
        PageDurations = current.PageDurations,
        DisableSkip = current.DisableSkip,
        TimeScaled = u65,
        OnSkipDialog = current.OnSkipDialog,
    })
    v6.character = createElement(DialogCharacter, {
        Speaker = Speaker,
        Emotion = Emotion,
        Hidden = v1,
        Flipped = Flipped,
        Transparency = v4,
    })
    return createElement("Frame", v5, v6)
end