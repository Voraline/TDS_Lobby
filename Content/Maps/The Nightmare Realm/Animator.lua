-- Script path: ReplicatedStorage.Content.Maps.The Nightmare Realm.Animator
-- Decompile time: 4.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local u16 = Random.new()
local CurrentCamera = workspace.CurrentCamera
return function(a1, a2) -- Line: 8
    -- upvalues: u16 (val), ReplicatedStorage (val), CurrentCamera (val), GameState (val), RunService (val)
    local Environment = a1:WaitForChild("Environment")
    local SmallRocks = Environment:WaitForChild("SmallRocks")
    local ComputerParts = a1:WaitForChild("ComputerParts")
    local SuperComputer = Environment:WaitForChild("SuperComputer")
    local u18 = {}
    local u19 = {}
    local Children = SmallRocks:GetChildren()
    for i, j in Children do
        u18[j] = (u16:NextUnitVector())
        u19[j] = j.CFrame.Position
    end
    local u33 = nil
    local u34 = nil
    local u35 = nil
    local u36 = nil
    local u37 = nil

    local function getNextComputerPart() -- Line: 29 -- upvalues: ComputerParts (val)
        local Children = ComputerParts:GetChildren()
        table.sort(Children, function(a1, a2) -- Line: 31
            return (a1:GetAttribute("BuyableCost")) < a2:GetAttribute("BuyableCost")
        end)
        return Children[1]
    end

    local function cleanObjectiveArrow() -- Line: 37 -- upvalues: u33 (ref), u34 (ref), u35 (ref), u36 (ref), u37 (ref)
        if u33 then
            u33:Destroy()
            u33 = nil
        end
        if u34 then
            u34:Destroy()
            u34 = nil
        end
        if u35 then
            u35:Destroy()
            u35 = nil
        end
        u36 = nil
        u37 = nil
    end

    local function updateObjectiveArrow() -- Line: 54
        -- upvalues: SuperComputer (val), ComputerParts (val), u33 (ref), ReplicatedStorage (upval)
        -- upvalues: CurrentCamera (upval), u34 (ref), u35 (ref), u36 (ref), u37 (ref)
        if not ((SuperComputer:GetAttribute("PartsRebuilt")) < 8) then
            if u33 then
                u33:Destroy()
                u33 = nil
            end
            if u34 then
                u34:Destroy()
                u34 = nil
            end
            if u35 then
                u35:Destroy()
                u35 = nil
            end
            u36 = nil
            u37 = nil
            return
        end
        local Children = ComputerParts:GetChildren()
        table.sort(Children, function(a1, a2) -- Line: 31
            return (a1:GetAttribute("BuyableCost")) < a2:GetAttribute("BuyableCost")
        end)
        local v1 = Children[1]
        local Position = v1:GetPivot().Position
        if not u33 then
            u33 = ((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Models")):WaitForChild("PointerArrow"):Clone()
            u33.Parent = CurrentCamera
        end
        if not u34 then
            u34 = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Client")):WaitForChild("ObjectiveCircle"):Clone()
        end
        if not u35 then
            u35 = Instance.new("Highlight")
            u35.OutlineColor = Color3.fromRGB(178, 255, 187)
            u35.FillTransparency = 1
        end
        u36 = Position
        u34.Position = Position - Vector3.new(0, 1, 0) * v1:GetBoundingBox().Y
        u34.Parent = v1
        u35.Parent = v1
    end

    a2:Mark((ComputerParts.ChildRemoved:Connect(updateObjectiveArrow)))
    a2:Mark(((GameState.Replicator:GetStateChangedSignal("Wave")):Connect(function(a1) -- Line: 90 -- upvalues: updateObjectiveArrow (val) -- types: a1: number
        if a1 == 1 then
            updateObjectiveArrow()
        end
    end)))
    a2:Mark((RunService.Stepped:Connect(function(a1, a2) -- Line: 96
        -- upvalues: GameState (upval), u33 (ref), u36 (ref), CurrentCamera (upval), u37 (ref), Children (val)
        -- upvalues: u18 (val), u19 (val)
        local Rotation, v1, v2, v3, v4, v5, v6, v7, v8, v9
        local TimeScale = GameState.TimeScale
        if u33 and u36 then
            v8 = u36
            local v10 = a1 * TimeScale * 2
            v7 = v8 + Vector3.new(0, 1, 0) * (math.sin(v10) / 2 + 4)
            v8 = CurrentCamera.CFrame.Position - v7
            v9 = Vector3.new(v8.X, 0, v8.Z)
            local v11 = u37 and u37:Lerp(v7, a2 * TimeScale * 4) or v7
            local v12 = (CFrame.lookAt(v11, v11 + v9)) * CFrame.Angles(-1.5707963267948966, 0, 0)
            u33.CFrame = v12
            u37 = v11
        end
        v7 = {}
        v8 = {}
        v9 = tick() * 2
        for i, j in Children do
            v1 = u18[j]
            v2 = u19[j]
            Rotation = j.CFrame.Rotation
            v4 = math.max(0.2, 1 - j.Size.Magnitude / 60)
            v5 = v4 * 0.001
            v6 = (math.clamp(v4 ^ 2, 0.4, 0.8)) * 0.1 * 10
            v2 = v2 + Vector3.new(0, math.sin(v1.Y * 100 + v9) * 0.5 * v6, 0)
            v3 = Rotation * (CFrame.Angles(v1.X * v5, v1.Y * v5, v1.Z * v5))
            table.insert(v7, (CFrame.new(v2)) * v3)
            table.insert(v8, j)
        end
        workspace:BulkMoveTo(v8, v7, Enum.BulkMoveMode.FireCFrameChanged)
    end)))
end