-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.MedicTowerSelection
-- Decompile time: 6.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local TowerDisplayName = require(ReplicatedStorage.Shared.Modules.TowerDisplayName)
local TowerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useAtomSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtomSelector)
local useInGameTowers = require(ReplicatedStorage.Client.Interfaces.Hooks.useInGameTowers)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useState = React.useState

local function getModelRootFromInstance(a1) -- Line: 23 -- types: a1: userdata
    if a1:IsA("Model") then
        return a1
    end
    local Parent = a1
    while true do
        Parent = Parent.Parent
        if Parent then
            if Parent:IsA("Model") then
                if not Parent:FindFirstChild("HumanoidRootPart") and not Parent:FindFirstChild("RootPart") then
                    if Parent then
                        continue
                    end
                    return nil
                end
                if not Parent:GetAttribute("Ignore") then
                    return Parent
                end
            end
        end
        if not Parent then
            return nil
        end
    end
end

local u77 = tick()
local u78 = false
local u81 = memo(function() -- Line: 47
    -- upvalues: useAtomSelector (val), ClientAtoms (val), useInGameTowers (val), useTagReplicatorInstance (val)
    -- upvalues: useState (val), useEffect (val), TowerReplicator (val), TowerDisplayName (val), UserInputService (val)
    -- upvalues: u78 (ref), u77 (ref), RunService (val), getModelRootFromInstance (val), Maid (val), table (val)
    -- upvalues: createElement (val), React (val), Tooltip (val)
    local u4 = useAtomSelector(ClientAtoms.towerSelectorAtom, function(a1) -- Line: 48
        return a1.enabled
    end)
    local u9 = useAtomSelector(ClientAtoms.towerSelectorAtom, function(a1) -- Line: 51
        return a1.tower
    end)
    local u11 = useInGameTowers()
    local u19 = useTagReplicatorInstance(u9 and u9.Model, "TowerReplicator", "Tower")
    local v1, u23 = useState({})
    local u26, u27 = useState(nil)
    local v2, u31 = useState({})
    local v3, u35 = useState(nil)
    local v4 = {u26}
    useEffect(function() -- Line: 65 -- upvalues: u26 (val), TowerReplicator (upval), u35 (val), TowerDisplayName (upval)
        if not u26 then
            u35(nil)
            return
        end
        local v1 = TowerReplicator.getTowerByModel(u26)
        if v1 then
            u35({Title = TowerDisplayName.resolve(v1.Name, v1, v1.Model)})
            return
        end
        u35(nil)
    end, v4)
    v4 = {u26, u4}
    useEffect(function() -- Line: 81
        -- upvalues: u4 (val), UserInputService (upval), u78 (upval), u77 (upval), u26 (val), TowerReplicator (upval)
        -- upvalues: u9 (val)
        if not u4 then
            return
        end
        local u6 = UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 86
            -- upvalues: u78 (upval), UserInputService (upval), u77 (upval), u26 (upval), TowerReplicator (upval)
            -- upvalues: u9 (upval)
            if a2 then
                return
            end
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1
                and a1.UserInputType ~= Enum.UserInputType.Touch
                and a1.KeyCode ~= Enum.KeyCode.ButtonX
                and a1.KeyCode ~= Enum.KeyCode.ButtonR2 then
                return
            end
            if u78 then
                return
            end
            if (UserInputService:GetLastInputType()) == Enum.UserInputType.Touch and not (tick() - u77 < 0.4) then
                u77 = tick()
            end
            if u26 and TowerReplicator.getTowerByModel(u26) then
                u78 = true
                u9:ToggleSelectedTower(u26)
                task.delay(0.15, function() -- Line: 117 -- upvalues: u78 (upval)
                    u78 = false
                end)
            end
        end)
        return function() -- Line: 125 -- upvalues: u6 (val)
            if u6 then
                u6:Disconnect()
            end
        end
    end, v4)
    v4 = {u4, u11, u9}
    useEffect(function() -- Line: 132
        -- upvalues: u4 (val), u9 (val), RunService (upval), UserInputService (upval), getModelRootFromInstance (upval)
        -- upvalues: TowerReplicator (upval), u27 (val), u23 (val)
        local u2 = RaycastParams.new()
        u2.FilterType = Enum.RaycastFilterType.Include
        u2.FilterDescendantsInstances = {workspace:WaitForChild("Towers")}
        local u19 = u4 and u9 and RunService.Heartbeat:Connect(function() -- Line: 141
            -- upvalues: UserInputService (upval), u2 (val), getModelRootFromInstance (upval), TowerReplicator (upval)
            -- upvalues: u9 (upval), u27 (upval)
            local MouseLocation = UserInputService:GetMouseLocation()
            local v1 = workspace.CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
            local v2 = workspace:Raycast(v1.Origin, v1.Direction * 1000, u2)
            if not v2 then
                UserInputService.MouseIcon = ""
                u27(nil)
                return
            end
            local v3 = getModelRootFromInstance(v2.Instance)
            local v4 = TowerReplicator.getTowerByModel(v3)
            if v4 and v4.Model == u9.Model then
                return
            end
            if not v4 then
                return
            end
            UserInputService.MouseIcon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
            u27(v3)
        end)
        return function() -- Line: 167 -- upvalues: u19 (ref), u27 (upval), u23 (upval)
            if u19 then
                u19:Disconnect()
            end
            u27(nil)
            u23({})
        end
    end, v4)
    v4 = {u19, u4, u11, u9, u26}
    useEffect(function() -- Line: 177
        -- upvalues: Maid (upval), u19 (val), table (upval), u11 (val), u9 (val), createElement (upval), u23 (val)
        -- upvalues: u31 (val), u26 (val), u4 (val)
        local u2 = Maid.new()

        local function updateSelected() -- Line: 180
            -- upvalues: u19 (upval), table (upval), u11 (upval), u9 (upval), createElement (upval), u23 (upval)
            -- upvalues: u31 (upval), u26 (upval)
            local v1, v2, v3, v4, v5
            local v6 = u19:Get("TowersCanSelect")
            local v7 = u19:Get("TowersSelected")
            if table.count(v7) == v6 then
                local Range, UID, v8, v9
                v3 = {}
                v4 = nil
                v5 = nil
                for k, n in u11, v4, v5 do
                    if n.Model ~= u9.Model
                        and n.Name ~= "Medic"
                        and n
                        and n.Model
                        and n.Model.Parent
                        and u9
                        and u9.Model
                        and u9.Model.Parent then
                        Range = u9:GetRange()
                        v1 = n.Model.PrimaryPart.Position * Vector3.new(1, 0, 1)
                        if not (Range < (v1 - u9.Model.PrimaryPart.Position * Vector3.new(1, 0, 1)).Magnitude) then
                            v1 = v7[n.UID]
                            UID = n.UID
                            v2 = createElement
                            v8 = {FillTransparency = 0.23, OutlineTransparency = 0.55}
                            v9 = v1 and Color3.fromRGB(43, 241, 255) or Color3.fromRGB(213, 0, 0)
                            v8.FillColor = v9
                            v8.Adornee = n.Model
                            v3[UID] = (v2("Highlight", v8))
                        end
                    end
                end
                u23({})
                u31(v3)
                return
            end
            if v6 and v6 > 0 then
                local Range_2, v10
                v3 = {}
                v4 = nil
                v5 = nil
                for i, j in u11, v4, v5 do
                    if j.Model ~= u9.Model
                        and j.Name ~= "Medic"
                        and j
                        and j.Model
                        and j.Model.Parent
                        and u9
                        and u9.Model
                        and u9.Model.Parent then
                        Range_2 = u9:GetRange()
                        v1 = j.Model.PrimaryPart.Position * Vector3.new(1, 0, 1)
                        if not (Range_2 < (v1 - u9.Model.PrimaryPart.Position * Vector3.new(1, 0, 1)).Magnitude) then
                            v1 = v7[j.UID]
                            v10 = 0.23
                            v2 = v1 and Color3.fromRGB(43, 241, 255) or Color3.fromRGB(0, 0, 0)
                            if u26 == j.Model then
                                v2 = Color3.fromRGB(255, 255, 255)
                                v10 = 0.3
                            end
                            if j.Model:GetAttribute("MedicUID") and (j.Model:GetAttribute("MedicUID")) ~= u9.UID then
                                v2 = Color3.fromRGB(255, 0, 0)
                            end
                            v3[j.UID] = (createElement("Highlight", {
                                OutlineTransparency = 0.4,
                                FillColor = v2,
                                FillTransparency = v10,
                                Adornee = j.Model,
                            }))
                        end
                    end
                end
                u23({})
                u31(v3)
                return
            end
            u23({})
        end

        if u4 and u19 then
            updateSelected()
            u2:Mark(((u19:GetStateChangedSignal("TowersSelected")):Connect(updateSelected)))
            u2:Mark(((u19:GetStateChangedSignal("TowersCanSelect")):Connect(updateSelected)))
            u2:Mark(((u19:GetStateChangedSignal("Range")):Connect(updateSelected)))
        end
        return function() -- Line: 315 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v4)
    return u4 and createElement(React.Fragment, nil, v1, v2, {
        toolTip = v3 and createElement(Tooltip, {
            Subject = "Click to toggle this tower",
            Name = "MedicTowerSelectionTooltip",
            Header = ("Toggle %*"):format(v3.Title),
        }),
    })
end)
return function(a1) -- Line: 330 -- upvalues: createElement (val), u81 (val)
    if workspace.Type.Value ~= "Game" then
        return nil
    end
    return createElement(u81)
end