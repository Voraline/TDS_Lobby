-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.UI.useDialogRevealText
-- Decompile time: 1.84 ms

local Dependencies = require(script.Parent.Parent.Dependencies)
local ReactFlow = Dependencies.get("ReactFlow")
local React = Dependencies.get("React")
local DialogTextRevealUtil = require(script.Parent.DialogTextRevealUtil)
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
return function(a1, a2) -- Line: 28
    -- upvalues: React (val), useState (val), useRef (val), useMemo (val), ReactFlow (val), DialogTextRevealUtil (val)
    -- upvalues: useEffect (val)
    local active = a2.active
    local u4 = a2.revealInterval or 0.018
    local onShow = a2.onShow
    if not onShow then
        function onShow() end
    end
    local onHide = a2.onHide
    if not onHide then
        function onHide() end
    end
    local speaker = a2.speaker
    local v1, u16 = React.useBinding("")
    local v2, u24 = useState(a1:getValue())
    local u27 = useRef(nil)
    local u30 = useRef("")
    local u34 = useMemo(function() -- Line: 39
        return Random.new()
    end, {})

    local function cancelRevealThread() -- Line: 43 -- upvalues: u27 (val)
        if u27.current ~= nil then
            task.cancel(u27.current)
            u27.current = nil
        end
    end

    local v3 = {a1}
    local v4 = {active, speaker}
    ReactFlow.useBindings(function(a1) -- Line: 50
        -- upvalues: u24 (val), active (val), u30 (val), onShow (val), u27 (val), u16 (val), onHide (val)
        -- upvalues: DialogTextRevealUtil (upval), u34 (val), speaker (val), u4 (val)
        u24(a1)
        if active and a1 ~= "" and a1 == u30.current then
            onShow()
            return
        end
        if u27.current ~= nil then
            task.cancel(u27.current)
            u27.current = nil
        end
        if active and a1 ~= "" then
            u30.current = a1
            local u24_2 = DialogTextRevealUtil.splitGraphemes(a1)
            local u25 = #u24_2
            u16("")
            onShow()
            u27.current = task.spawn(function() -- Line: 79
                -- upvalues: u25 (val), u16 (upval), DialogTextRevealUtil (upval), a1 (val), u34 (upval), u24_2 (val)
                -- upvalues: speaker (upval), u4 (upval), u27 (upval)
                for i = 1, u25 do
                    u16(DialogTextRevealUtil.substringByGraphemes(a1, i))
                    DialogTextRevealUtil.playDialogBlip(u34, u24_2[i], speaker)
                    task.wait(u4)
                end
                u27.current = nil
            end)
            return
        end
        u30.current = if not active then "" else a1
        u16(a1)
        if active and a1 ~= "" then
            onShow()
            return
        end
        onHide()
    end, v3, v4)
    useEffect(function() -- Line: 89 -- upvalues: u27 (val)
        return function() -- Line: 90 -- upvalues: u27 (upval)
            if u27.current ~= nil then
                task.cancel(u27.current)
                u27.current = nil
            end
        end
    end, {})
    return v1, v2
end