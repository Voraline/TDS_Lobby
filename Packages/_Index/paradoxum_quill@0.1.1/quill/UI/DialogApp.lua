-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.UI.DialogApp
-- Decompile time: 16.82 ms

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Dependencies = require(script.Parent.Parent.Dependencies)
local React = Dependencies.get("React")
local Charm = Dependencies.get("Charm")
local Promise = Dependencies.get("Promise")
local Trove = Dependencies.get("Trove")
local AssetUtils = require(script.Parent.Parent.AssetUtils)
local Atoms = require(script.Parent.Parent.Atoms)
local Commands = require(script.Parent.Parent.Commands)
local Config = require(script.Parent.Parent.Config)
local Graph = require(script.Parent.Parent.Graph)
local TemplateString = require(script.Parent.Parent.TemplateString)
require(script.Parent.Parent.Types)
local DialogInteractionText = require(script.Parent.DialogInteractionText)
local DialogResponse = require(script.Parent.DialogResponse)
local DialogWindow = require(script.Parent.DialogWindow)
local useAtom = require(script.Parent.useAtom)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local Pacing = Config.Pacing
local u98 = Vector2.new(1360, 260)
local u102 = Vector2.new(560, 260)

local function estimateReadTime(a1) -- Line: 44 -- upvalues: Pacing (val) -- types: a1: string
    return (math.clamp((utf8.len(a1) or #a1) / Pacing.CharactersPerSecond, Pacing.PromptReadTimeMin, Pacing.PromptReadTimeMax))
end

local function formatText(a1) -- Line: 50 -- upvalues: TemplateString (val) -- types: a1: string
    local Parent = require(script.Parent.Parent)
    local _getConfig = Parent._getConfig and Parent._getConfig()
    local templateContext = _getConfig and _getConfig.templateContext
    if templateContext then
        return TemplateString.format(a1, templateContext)
    end
    return a1
end

local function ActiveDialogOverlay(a1) -- Line: 66
    -- upvalues: createElement (val), DialogInteractionText (val)
    local v1
    if #a1.choices == 0 then
        return nil
    end
    local v2 = {
        Layout = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
        }),
    }
    local v3 = nil
    local v4 = nil
    for i, j in a1.choices, v3, v4 do
        v1 = ("Choice_%*"):format(i)
        v2[v1] = (createElement(DialogInteractionText, {
            layoutOrder = i,
            text = j.text,
            isHighlighted = i == a1.highlightedIndex,
            onActivated = function() -- Line: 85 -- upvalues: a1 (val), j (val)
                a1.onChoose(j.index)
            end,
        }))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, v2)
end

return React.memo(function() -- Line: 100
    -- upvalues: useAtom (val), Atoms (val), useRef (val), React (val), Charm (val), useState (val), Promise (val)
    -- upvalues: AssetUtils (val), TemplateString (val), Pacing (val), Commands (val), Players (val), Graph (val)
    -- upvalues: useEffect (val), Trove (val), UserInputService (val), createElement (val), u98 (val)
    -- upvalues: DialogWindow (val), u102 (val), DialogResponse (val), ActiveDialogOverlay (val)
    local v1 = useAtom(Atoms.currentNpcId)
    local u6 = useRef(nil)
    local v2, u11 = React.useBinding("")
    local current = useRef(Charm.atom(false)).current
    local current_2 = useRef(Charm.atom(false)).current
    local v3, u30 = React.useBinding("")
    local current_3 = useRef(Charm.atom(false)).current
    local v4, u41 = useState({})
    local v5, u45 = useState(1)
    local u48 = useRef(nil)
    local u51 = useRef({})
    local u54 = useRef(1)
    local v6, u58 = useState(nil)
    local v7, u62 = useState(nil)
    local v8, u66 = useState("")
    local v9, u70 = useState(nil)
    local u73 = useRef(nil)

    local function waitForAdvance(a1) -- Line: 124 -- upvalues: Promise (upval), u73 (val) -- types: a1: table
        if a1.isCancelled() then
            return false
        end
        local u4 = false
        Promise.new(function(a1) -- Line: 130 -- upvalues: u73 (upval), u4 (ref)
            function u73.current() -- Line: 131 -- upvalues: u4 (upval), a1 (val)
                if not u4 then
                    u4 = true
                    a1()
                end
            end
        end):await()
        u73.current = nil
        return not (a1.isCancelled())
    end

    local function waitForAdvanceOrTimeout(a1, a2) -- Line: 143
        -- upvalues: Promise (upval), u73 (val)
        if a1.isCancelled() then
            return false
        end
        local u5 = false
        Promise.new(function(a1) -- Line: 152 -- upvalues: u5 (ref), u73 (upval), a2 (val)
            local function finish() -- Line: 153 -- upvalues: u5 (upval), a1 (val)
                if not u5 then
                    u5 = true
                    a1()
                end
            end

            u73.current = finish
            task.delay(a2, finish)
        end):await()
        u73.current = nil
        return not (a1.isCancelled())
    end

    local function waitForChoice(a1, a2) -- Line: 168
        -- upvalues: u41 (val), u51 (val), u45 (val), u54 (val), Promise (upval), u48 (val)
        if a1.isCancelled() then
            return nil
        end
        u41(a2)
        u51.current = a2
        u45(1)
        u54.current = 1
        local u14 = nil
        Promise.new(function(a1) -- Line: 182 -- upvalues: u48 (upval), u14 (ref)
            function u48.current(a1_2) -- Line: 183 -- upvalues: u14 (upval), a1 (val) -- types: a1_2: number
                u14 = a1_2
                a1()
            end
        end):await()
        u48.current = nil
        u41({})
        u51.current = {}
        if not a1.isCancelled() and u14 ~= -1 then
            return u14
        end
        return nil
    end

    local u77 = nil

    local function showChosenResponseAndContinue(a1, a2, a3) -- Line: 200
        -- upvalues: AssetUtils (upval), TemplateString (upval), u30 (val), current_3 (val), Pacing (upval), u77 (ref)
        local v1 = a1.nodes[a2]
        if not v1 then
            return
        end
        local v2 = AssetUtils.getNodeTextValues(a1, v1)
        if #v2 > 0 then
            local v3 = v2[1]
            local Parent = require(script.Parent.Parent)
            local _getConfig = Parent._getConfig and Parent._getConfig()
            local templateContext = _getConfig and _getConfig.templateContext
            u30(if not templateContext then v3 else TemplateString.format(v3, templateContext))
            current_3(true)
            task.wait(Pacing.ResponseChoiceLinger)
            current_3(false)
        end
        if a3.isCancelled() then
            return
        end
        local v4 = AssetUtils.getGraphNextNodeId(a1, a2)
        if v4 then
            u77(a1, v4, a3)
        end
    end

    function u77(a1, a2, a3) -- Line: 229
        -- upvalues: u77 (ref), AssetUtils (upval), current_2 (val), TemplateString (upval), u11 (val), current (val)
        -- upvalues: Pacing (upval), waitForAdvanceOrTimeout (val), waitForAdvance (val), waitForChoice (val)
        -- upvalues: showChosenResponseAndContinue (val), Commands (upval)
        local Parent, Parent_2, _getConfig, _getConfig_2, templateContext, templateContext_2, v1, v2, v3, v4, v5, v6
        if a3.isCancelled() then
            return
        end
        local v7 = a1.nodes[a2]
        if not v7 then
            return
        end
        if v7.t == "root" then
            if v7.out and #v7.out > 0 then
                u77(a1, v7.out[1], a3)
            end
            return
        end
        if v7.t ~= "prompt" then
            if v7.t == "response" then
                showChosenResponseAndContinue(a1, a2, a3)
                return
            end
            if v7.t == "command" then
                local action = v7.action and a1.actions[v7.action]
                if action then
                    Commands.execute(action)
                end
                if v7.out and #v7.out > 0 then
                    u77(a1, v7.out[1], a3)
                end
                return
            end
            if v7.t == "predicate" then
                local predicate = v7.predicate and a1.predicates[v7.predicate]
                local v8 = false
                if predicate then
                    v8 = Commands.evaluate(predicate)
                end
                local yes = if not v8 then v7.no else v7.yes
                if not yes and v7.out and #v7.out > 0 then
                    yes = v7.out[1]
                end
                if yes then
                    u77(a1, yes, a3)
                end
            end
            return
        end
        local v9 = AssetUtils.getNodeTextValues(a1, v7)
        current_2(true)
        local out = v7.out or {}
        local v10 = {}
        for i, j in out do
            v1 = a1.nodes[j]
            if v1 and v1.t == "response" then
                table.insert(v10, j)
            end
        end
        local v11 = AssetUtils.getGraphNextNodeId(a1, a2)
        local v12 = false
        if #v10 == 0 then
            v12 = v11 == nil
        end
        local v13 = nil
        local v14 = nil
        local v15, v16 = a3, a1
        for k, n in v9, v13, v14 do
            if v15.isCancelled() then
                return
            end
            Parent_2 = require(script.Parent.Parent)
            _getConfig_2 = Parent_2._getConfig and Parent_2._getConfig()
            templateContext_2 = _getConfig_2 and _getConfig_2.templateContext
            u11(if not templateContext_2 then n else TemplateString.format(n, templateContext_2))
            current(true)
            v3 = k == #v9
            if v12 and v3 then
                waitForAdvanceOrTimeout(v15, (math.max(
                    math.clamp((utf8.len(v2) or #v2) / Pacing.CharactersPerSecond, Pacing.PromptReadTimeMin, Pacing.PromptReadTimeMax),
                    Pacing.EndReadHold
                )))
                if not v15.isCancelled() then
                    continue
                end
                return
            end
            task.wait((math.clamp((utf8.len(v2) or #v2) / Pacing.CharactersPerSecond, Pacing.PromptReadTimeMin, Pacing.PromptReadTimeMax)))
            if v15.isCancelled() then
                return
            end
            if v7.skip ~= true and v3 and not waitForAdvance(v15) then
                return
            end
            if k < #v9 then
                task.wait(Pacing.PromptInterLineGap)
            end
        end
        task.wait(Pacing.PromptPostLineHold)
        if v15.isCancelled() then
            return
        end
        if not (#v10 > 1) then
            if #v10 == 1 then
                current_2(false)
                showChosenResponseAndContinue(v16, v10[1], v15)
                return
            end
            if v11 then
                u77(v16, v11, v15)
                return
            end
            current_2(false)
            return
        end
        current_2(false)
        local v17 = {}
        v14 = nil
        v1 = nil
        for m, i5 in v10, v14, v1 do
            v3 = v16.nodes[i5]
            if v3 then
                v4 = AssetUtils.getNodeTextValues(v16, v3)
                if not (#v4 > 0) then
                    v5 = "..."
                else
                    v6 = v4[1]
                    Parent = require(script.Parent.Parent)
                    _getConfig = Parent._getConfig and Parent._getConfig()
                    templateContext = _getConfig and _getConfig.templateContext
                    v5 = if not templateContext then v6 else TemplateString.format(v6, templateContext)
                end
                table.insert(v17, {index = i5, text = v5})
            end
        end
        v13 = waitForChoice(v15, v17)
        if v13 then
            showChosenResponseAndContinue(v16, v13, v15)
        end
    end

    local function executeLegacyDialog(a1, a2) -- Line: 373
        -- upvalues: current_2 (val), TemplateString (upval), u11 (val), current (val), Pacing (upval)
        -- upvalues: waitForAdvance (val), u30 (val), current_3 (val)
        local Parent, Parent_2, _getConfig, _getConfig_2, templateContext, templateContext_2, v1, v2, v3
        local dialogBlockChain = a1.dialogBlockChain
        if not dialogBlockChain then
            return
        end
        current_2(true)
        local v4 = nil
        local v5 = nil
        local v6 = a2
        for i, j in dialogBlockChain, v4, v5 do
            if v6.isCancelled() then
                return
            end
            if j.DialogType == "Dialog" then
                v3 = nil
                v1 = nil
                for k, n in j.LinearOptions, v3, v1 do
                    if v6.isCancelled() then
                        return
                    end
                    Parent = require(script.Parent.Parent)
                    _getConfig = Parent._getConfig and Parent._getConfig()
                    templateContext = _getConfig and _getConfig.templateContext
                    u11(if not templateContext then n else TemplateString.format(n, templateContext))
                    current(true)
                    task.wait((math.clamp((utf8.len(v2) or #v2) / Pacing.CharactersPerSecond, Pacing.PromptReadTimeMin, Pacing.PromptReadTimeMax)))
                    if k ~= #j.LinearOptions then
                        if k < #j.LinearOptions then
                            task.wait(Pacing.PromptInterLineGap)
                        end
                    elseif not waitForAdvance(v6) then
                        return
                    end
                end
            elseif j.DialogType == "Response" and #j.LinearOptions > 0 then
                v3 = j.LinearOptions[1]
                Parent_2 = require(script.Parent.Parent)
                _getConfig_2 = Parent_2._getConfig and Parent_2._getConfig()
                templateContext_2 = _getConfig_2 and _getConfig_2.templateContext
                u30(if not templateContext_2 then v3 else TemplateString.format(v3, templateContext_2))
                current_3(true)
                task.wait(Pacing.ResponseAdvanceLinger)
                current_3(false)
            end
        end
        current_2(false)
    end

    local function runDialogSequence(a1) -- Line: 421
        -- upvalues: Atoms (upval), u58 (val), Players (upval), u62 (val), u66 (val), u70 (val), u6 (val)
        -- upvalues: AssetUtils (upval), Graph (upval), u77 (ref), executeLegacyDialog (val), Pacing (upval)
        -- upvalues: current (val), current_2 (val), current_3 (val), u11 (val), u30 (val), u41 (val)
        local LocalPlayer, dialog_2, model, u87, v1, v2, v3
        local v4 = require(script.Parent.Parent).getNPC(a1)
        if not v4 then
            return
        end
        local config = v4.config
        if typeof(config.dialog) ~= "function" then
            dialog_2 = config.dialog
            if not dialog_2 then
                warn((("[Quill] No dialog available for NPC \"%*\""):format(a1)))
                Atoms.currentNpcId(nil)
                return
            end
            model = config.model
            u58(model:FindFirstChild("Head") or model.PrimaryPart or model:FindFirstChild("HumanoidRootPart"))
            LocalPlayer = Players.LocalPlayer
            u62(if not LocalPlayer then nil else if not LocalPlayer.Character then nil else LocalPlayer.Character:FindFirstChild("Head"))
            u66(config.id)
            u70(config.blipSpeaker)
            Atoms.inDialogMode(true)
            u87 = false
            v2 = {
                cancel = function() -- Line: 469 -- upvalues: u87 (ref)
                    u87 = true
                end,
                isCancelled = function() -- Line: 472 -- upvalues: u87 (ref)
                    return u87
                end,
            }
            u6.current = v2
            if not AssetUtils.isGraphDialog(dialog_2) then
                executeLegacyDialog(dialog_2, v2)
            else
                v3 = dialog_2
                v1 = Graph.getRootId(v3)
                if v1 then
                    u77(v3, v1, v2)
                end
            end
            if not v2.isCancelled() then
                task.wait(Pacing.PromptPostLineHold)
                current(false)
                current_2(false)
                current_3(false)
                u11("")
                u30("")
                u41({})
                Atoms.currentNpcId(nil)
                Atoms.inDialogMode(false)
            end
            if u6.current == v2 then
                u6.current = nil
            end
            return
        end
        local success, result = pcall(config.dialog)
        if not success then
            warn((("[Quill] Failed to resolve dialog for NPC \"%*\": %*"):format(a1, result)))
            Atoms.currentNpcId(nil)
            return
        end
        if not result then
            warn((("[Quill] No dialog available for NPC \"%*\""):format(a1)))
            Atoms.currentNpcId(nil)
            return
        end
        model = config.model
        u58(model:FindFirstChild("Head") or model.PrimaryPart or model:FindFirstChild("HumanoidRootPart"))
        LocalPlayer = Players.LocalPlayer
        u62(if not LocalPlayer then nil else if not LocalPlayer.Character then nil else LocalPlayer.Character:FindFirstChild("Head"))
        u66(config.id)
        u70(config.blipSpeaker)
        Atoms.inDialogMode(true)
        u87 = false
        v2 = {
            cancel = function() -- Line: 469 -- upvalues: u87 (ref)
                u87 = true
            end,
            isCancelled = function() -- Line: 472 -- upvalues: u87 (ref)
                return u87
            end,
        }
        u6.current = v2
        if not AssetUtils.isGraphDialog(dialog_2) then
            executeLegacyDialog(dialog_2, v2)
        else
            v3 = dialog_2
            v1 = Graph.getRootId(v3)
            if v1 then
                u77(v3, v1, v2)
            end
        end
        if not v2.isCancelled() then
            task.wait(Pacing.PromptPostLineHold)
            current(false)
            current_2(false)
            current_3(false)
            u11("")
            u30("")
            u41({})
            Atoms.currentNpcId(nil)
            Atoms.inDialogMode(false)
        end
        if u6.current == v2 then
            u6.current = nil
        end
    end

    local function cancelSequence() -- Line: 505
        -- upvalues: u6 (val), u73 (val), u48 (val), current (val), current_2 (val), current_3 (val), u11 (val)
        -- upvalues: u30 (val), u41 (val), u51 (val), u45 (val), u54 (val), u58 (val), u62 (val), Atoms (upval)
        if u6.current then
            u6.current.cancel()
            u6.current = nil
        end
        if u73.current then
            u73.current()
        end
        if u48.current then
            u48.current(-1)
        end
        current(false)
        current_2(false)
        current_3(false)
        u11("")
        u30("")
        u41({})
        u51.current = {}
        u45(1)
        u54.current = 1
        u58(nil)
        u62(nil)
        Atoms.inDialogMode(false)
    end

    useEffect(function() -- Line: 532
        -- upvalues: Trove (upval), Charm (upval), Atoms (upval), cancelSequence (val), runDialogSequence (val)
        -- upvalues: UserInputService (upval), u73 (val), u48 (val), u51 (val), u54 (val), u45 (val)
        local u2 = Trove.new()
        u2:Add((Charm.subscribe(Atoms.currentNpcId, function(a1) -- Line: 535 -- upvalues: cancelSequence (upval), runDialogSequence (upval) -- types: a1: string?
            cancelSequence()
            if a1 then
                task.spawn(runDialogSequence, a1)
            end
        end)))
        u2:Connect(UserInputService.InputBegan, function(a1, a2) -- Line: 544
            -- upvalues: u73 (upval), u48 (upval), u51 (upval), u54 (upval), u45 (upval)
            if a2 then
                return
            end
            local KeyCode = a1.KeyCode
            if KeyCode ~= Enum.KeyCode.Space and KeyCode ~= Enum.KeyCode.E and KeyCode ~= Enum.KeyCode.ButtonA then
                if KeyCode ~= Enum.KeyCode.W and KeyCode ~= Enum.KeyCode.Up and KeyCode ~= Enum.KeyCode.DPadUp then
                    if KeyCode == Enum.KeyCode.S or KeyCode == Enum.KeyCode.Down then
                        if #u51.current > 0 then
                            u45(function(a1) -- Line: 587 -- upvalues: u51 (upval), u54 (upval)
                                local v1 = if not (#u51.current <= a1) then a1 + 1 else 1
                                u54.current = v1
                                return v1
                            end)
                        end
                    elseif KeyCode == Enum.KeyCode.DPadDown and #u51.current > 0 then
                        u45(function(a1) -- Line: 587 -- upvalues: u51 (upval), u54 (upval)
                            local v1 = if not (#u51.current <= a1) then a1 + 1 else 1
                            u54.current = v1
                            return v1
                        end)
                    end
                    return
                end
                if #u51.current > 0 then
                    u45(function(a1) -- Line: 572 -- upvalues: u51 (upval), u54 (upval)
                        local v1 = if not (a1 <= 1) then a1 - 1 else #u51.current
                        u54.current = v1
                        return v1
                    end)
                end
                return
            end
            if u73.current then
                u73.current()
                return
            end
            if u48.current then
                local v1 = #u51.current
                if v1 > 0 then
                    v1 = u51.current[u54.current]
                    if v1 then
                        u48.current(v1.index)
                    end
                end
            end
        end)
        u2:Connect(UserInputService.InputBegan, function(a1, a2) -- Line: 599 -- upvalues: u73 (upval) -- types: a1: userdata, a2: boolean
            if a2 then
                return
            end
            if a1.UserInputType == Enum.UserInputType.MouseButton1 and u73.current then
                u73.current()
            end
        end)
        return function() -- Line: 612 -- upvalues: cancelSequence (upval), u2 (val)
            cancelSequence()
            u2:Destroy()
        end
    end, {})
    if not v1 then
        return nil
    end
    local Fragment = React.Fragment
    local v10 = {
        NPCDialogBillboard = v6 and createElement("BillboardGui", {
            StudsOffset = Vector3.new(0, 5.099999904632568, 0),
            Active = false,
            AlwaysOnTop = true,
            ResetOnSpawn = false,
            LightInfluence = 0,
            Adornee = v6,
            Size = UDim2.fromOffset(u98.X, u98.Y),
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        }, {
            DialogWindow = createElement(DialogWindow, {
                dialogText = {get = v2, set = u11},
                npcName = v8,
                dialogBlipSpeaker = v9,
                visible = current,
                interacting = current_2,
            }),
        }),
        PlayerResponseBillboard = v7 and createElement("BillboardGui", {
            StudsOffset = Vector3.new(0, 3.5, 0),
            Active = false,
            AlwaysOnTop = true,
            ResetOnSpawn = false,
            LightInfluence = 0,
            Adornee = v7,
            Size = UDim2.fromOffset(u102.X, u102.Y),
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        }, {
            DialogResponse = createElement(DialogResponse, {dialogText = {get = v3, set = u30}, visible = current_3}),
        }),
    }
    local v11 = false
    if #v4 > 0 then
        v11 = createElement("ScreenGui", {
            ResetOnSpawn = false,
            IgnoreGuiInset = true,
            DisplayOrder = 100,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        }, {
            Container = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.new(0.5, 0, 1, -80),
                Size = UDim2.new(0.3, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
            }, {
                Overlay = createElement(ActiveDialogOverlay, {
                    choices = v4,
                    highlightedIndex = v5,
                    onChoose = function(a1) -- Line: 677 -- upvalues: u48 (val) -- types: a1: number
                        if u48.current then
                            u48.current(a1)
                        end
                    end,
                }),
            }),
        })
    end
    v10.ChoicesOverlay = v11
    return (createElement(Fragment, nil, v10))
end)