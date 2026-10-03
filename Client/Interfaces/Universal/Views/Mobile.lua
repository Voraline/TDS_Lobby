-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Mobile
-- Decompile time: 5.69 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local Components_2 = ReplicatedStorage.Client.Interfaces.Universal.Components
local CommunicationAvailability = require(ReplicatedStorage.Client.Modules.CommunicationAvailability)
local Mobile = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Mobile)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local MobileButton = require(Components_2.MobileButton)
local useAttribute = require(Hooks.useAttribute)
local useEvent = require(Hooks.useEvent)
local useFFlag = require(Hooks.useFFlag)
local useGameStateValue = require(Hooks.useGameStateValue)
local useIsTutorialMatch = require(Hooks.useIsTutorialMatch)
local useView = require(Hooks.useView)
local Fragment = React.Fragment
local useState = React.useState
local useEffect = React.useEffect
local useMemo = React.useMemo
local createElement = React.createElement
local LocalPlayer = Players.LocalPlayer
local u70 = {{{"Sticker", "Emote", "Run"}, {"Communication"}}, {{"Rotate", "Trash"}}}
local u82 = {
    Run = 137073199794871,
    Walk = 79363904276603,
    Emote = 95613610599489,
    Sticker = 131700179762636,
    Communication = 89327088116089,
    Rotate = 86625900702034,
    Trash = 113439229278725,
}

local function getAngleIndex(a1, a2) -- Line: 57 -- types: a1: number, a2: number
    return a2 - a1 + 1
end

local function RotatedMobileButton(a1) -- Line: 61
    -- upvalues: u82 (val), useAttribute (val), LocalPlayer (val), createElement (val), MobileButton (val), Mobile (val)
    local jumpButtonSize = a1.jumpButtonSize
    local jumpButtonCenter = a1.jumpButtonCenter
    local angleIndex = a1.angleIndex
    local layoutOrder = a1.layoutOrder
    local name = a1.name
    local radius = a1.radius
    local v1 = jumpButtonSize * 0.8
    local v2 = math.rad(50 * (angleIndex - 1)) + 3.141592653589793
    local v3 = radius * math.cos(v2)
    local v4 = radius * math.sin(v2)
    local v5 = u82[name]
    local v6 = nil
    if name == "Run" then
        v5 = if not useAttribute(LocalPlayer, "Sprinting") then 137073199794871 else 79363904276603
    elseif name == "Sticker" then
        v6 = Color3.fromRGB(223, 223, 223)
    end
    return createElement(MobileButton, {
        Visible = true,
        LayoutOrder = layoutOrder,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(v1, v1),
        Position = (UDim2.fromOffset(jumpButtonCenter.X, jumpButtonCenter.Y)) + UDim2.fromOffset(v3, v4),
        Image = v5,
        ImageColor3 = v6,
        click = function() -- Line: 95 -- upvalues: Mobile (upval), name (val)
            Mobile.Signals[name]:Fire()
        end,
    })
end

return function() -- Line: 101
    -- upvalues: useView (val), useState (val), Mobile (val), useGameStateValue (val), Players (val), useFFlag (val)
    -- upvalues: useIsTutorialMatch (val), useMemo (val), useEvent (val), useEffect (val), LocalPlayer (val), u70 (val)
    -- upvalues: PlayerReplicator (val), CommunicationAvailability (val), createElement (val), RotatedMobileButton (val)
    -- upvalues: Fragment (val)
    local v1 = useView(true)
    local v2, u7 = useState(Mobile.Index)
    local GameMode = useGameStateValue("GameMode")
    local v3 = useGameStateValue("PlayerCount", #Players:GetPlayers())
    local v4 = useGameStateValue("PlayerCountPerTeam", {})
    local v5 = useGameStateValue("Intermission", false)
    local v6 = useFFlag("communication.enabled", false)
    local v7 = useIsTutorialMatch()
    local u35, u36 = useState(nil)
    local v8 = {u35}
    local v9 = useMemo(function() -- Line: 112 -- upvalues: u35 (val)
        if u35 then
            return (u35:WaitForChild("TouchControlFrame")):FindFirstChild("JumpButton")
        end
        return nil
    end, v8)
    useEvent(Mobile.IndexChanged, function(a1) -- Line: 120 -- upvalues: u7 (val)
        u7(a1)
    end)
    useEffect(function() -- Line: 124 -- upvalues: LocalPlayer (upval), u36 (val)
        local u0 = nil
        u0 = task.spawn(function() -- Line: 126 -- upvalues: LocalPlayer (upval), u0 (ref), u36 (upval)
            local TouchGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TouchGui", 3)
            if not TouchGui then
                return
            end
            u0 = nil
            TouchGui.DisplayOrder = 10
            u36(TouchGui)
        end)
        return function() -- Line: 140 -- upvalues: u0 (ref)
            if u0 then
                task.cancel(u0)
            end
        end
    end, {})
    if v9 and u35 then
        local v10, v11, v12, v13, v14
        local Offset = v9.Size.Y.Offset
        v8 = v9.AbsolutePosition + v9.AbsoluteSize / 2
        local v15 = u70[v2]
        local v16 = Offset * 0.8 + 20
        local v17 = PlayerReplicator.GetEntityFromPlayer(LocalPlayer)
        local v18 = CommunicationAvailability.canUseFromState(GameMode, v3, v4, v17 and v17.Team, v5, v6, v7)
        local v19 = 0
        local v20 = 0
        local v21 = {}
        for i, j in v15 do
            v20 = math.max(v20, #j)
        end
        local v22 = nil
        local v23 = nil
        for k, n in v15, v22, v23 do
            v10 = nil
            v11 = nil
            for m, i5 in n, v10, v11 do
                if i5 ~= "Communication" or v18 then
                    v19 = v19 + 1
                    v12 = createElement
                    v13 = RotatedMobileButton
                    v14 = {
                        name = i5,
                        angleIndex = v20 - m + 1,
                        layoutOrder = v19,
                        radius = v16 * k,
                        jumpButtonCenter = v8,
                        jumpButtonSize = Offset,
                    }
                    v21[i5] = (v12(v13, v14))
                end
            end
        end
        return createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0, 0),
            Visible = v1:map(function(a1) -- Line: 197
                local v1 = true
                if a1 ~= "Hotbar" then
                    v1 = a1 == ""
                end
                return v1
            end),
        }, {components = createElement(Fragment, {}, v21)})
    end
end