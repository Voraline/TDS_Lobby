-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.FanArtDisplay
-- Decompile time: 4.54 ms

local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local FanArtUser = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.FanArtUser)
local React = require(ReplicatedStorage.Shared.UI.React)
local useTagged = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagged)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useBinding = React.useBinding
local FanArt = (workspace:WaitForChild("Lobby")):WaitForChild("FanArt")
local u52 = RaycastParams.new()
u52.FilterType = Enum.RaycastFilterType.Include
u52.FilterDescendantsInstances = {FanArt}

local function render() -- Line: 20
    -- upvalues: useState (val), useBinding (val), useTagged (val), useEffect (val), RunService (val)
    -- upvalues: UserInputService (val), GuiService (val), u52 (val), createElement (val), FanArtUser (val)
    local v1, u3 = useState(nil)
    local v2, u10 = useBinding(UDim2.fromScale(0.5, 0.5))
    local u13, u14 = useState(nil)
    local FanArtScreen = useTagged("FanArtScreen")
    local v3 = {FanArtScreen}
    useEffect(function() -- Line: 26
        -- upvalues: FanArtScreen (val), RunService (upval), UserInputService (upval), GuiService (upval), u52 (upval)
        -- upvalues: u3 (val), u14 (val)
        if #FanArtScreen == 0 then
            return
        end
        local u7 = RunService.Heartbeat:Connect(function(a1) -- Line: 30 -- upvalues: UserInputService (upval), GuiService (upval), u52 (upval), u3 (upval), u14 (upval)
            local MouseLocation = UserInputService:GetMouseLocation()
            local v1 = workspace.CurrentCamera:ScreenPointToRay(MouseLocation.X, MouseLocation.Y - (GuiService:GetGuiInset()).Y)
            local v2 = workspace:Raycast(v1.Origin, v1.Direction * 120, u52)
            if v2 and v2.Instance:HasTag("FanArtScreen") then
                local Attribute = v2.Instance:GetAttribute("ArtistName")
                u3(Attribute)
                u14(v2.Instance)
                return
            end
            u3(nil)
        end)
        return function() -- Line: 46 -- upvalues: u7 (val)
            u7:Disconnect()
        end
    end, v3)
    v3 = {u13}
    useEffect(function() -- Line: 51 -- upvalues: RunService (upval), u13 (val), u10 (val)
        local u5 = RunService.Heartbeat:Connect(function() -- Line: 52 -- upvalues: u13 (upval), u10 (upval)
            if u13 then
                local v1, v2 = workspace.CurrentCamera:WorldToScreenPoint(u13.Position + Vector3.new(0, -1, 0))
                if v2 then
                    u10(UDim2.fromOffset(v1.X, v1.Y))
                    return
                end
                u10(UDim2.fromScale(0.5, -2))
            end
        end)
        return function() -- Line: 64 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, v3)
    return createElement(FanArtUser, {enabled = v1 ~= nil, userName = v1 or "", position = v2})
end

return function() -- Line: 76 -- upvalues: createElement (val), render (val)
    return createElement(render, {})
end