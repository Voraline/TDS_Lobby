-- Script path: ReplicatedStorage.Client.Modules.SharedControllerFunctions
-- Decompile time: 3.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    getPlacement = function() -- Line: 14 -- upvalues: TypedPromise (val), PathPlacementCursorController (val)
        return TypedPromise.new(function(a1, a2, a3) -- Line: 15 -- upvalues: PathPlacementCursorController (upval)
            local u3 = nil
            local u4 = nil

            local function v1() -- Line: 19 -- upvalues: u3 (ref), u4 (ref)
                u3:Disconnect()
                u4:Disconnect()
            end

            PathPlacementCursorController:Start({constrainToGround = true, constrainToPath = false, uiEnabled = false, reposition = true})
            u3 = PathPlacementCursorController.Canceled:Connect(function() -- Line: 31 -- upvalues: u3 (ref), u4 (ref), a2 (val)
                u3:Disconnect()
                u4:Disconnect()
                a2("Canceled")
            end)
            u4 = PathPlacementCursorController.OnClicked:Connect(function(a1_2, a2) -- Line: 35 -- upvalues: u3 (ref), u4 (ref), a1 (val)
                u3:Disconnect()
                u4:Disconnect()
                a1(a1_2, a2)
            end)
            a3(function() -- Line: 40 -- upvalues: u3 (ref), u4 (ref), PathPlacementCursorController (upval)
                u3:Disconnect()
                u4:Disconnect()
                PathPlacementCursorController:Stop()
            end)
        end)
    end,
    RegisterJoints = function(a1, a2) -- Line: 60 -- types: a1: table, a2: table
        if a1.FBXModel then
            return
        end
        local HumanoidRootPart = a1.Model:FindFirstChild("HumanoidRootPart") and a1.Model.HumanoidRootPart:FindFirstChild("Pivot")
        local Torso = a1.Model:FindFirstChild("Torso") and (a1.Model.Torso:FindFirstChild("Neck") or a1.Model.Torso:FindFirstChild("Head"))
        assert(HumanoidRootPart, "SharedControllerFunctions.RegisterJoints: No pivot found")
        assert(Torso, "SharedControllerFunctions.RegisterJoints: No neck found")
        local v1 = a1._jointData == nil
        a1._jointData = {}
        if v1 then
            a1._jointOffsetPivot = HumanoidRootPart
            a1._neckJoint = Torso
            a1._neckC0 = Torso.C0
            a1._neckRot = Torso.C0 - Torso.C0.Position
            a1._root = a1.Model.HumanoidRootPart
            a1._rootOffset = HumanoidRootPart.WorldCFrame:ToObjectSpace(a1._root.CFrame)
        end
        for i, v in ipairs(a2) do
            table.insert(a1._jointData, {Joint = v, Offsets = {v.C0, v.C1}})
        end
    end,
    AppendJoints = function(a1, a2) -- Line: 105 -- types: a1: table, a2: table
        if a1.FBXModel then
            return
        end
        assert(a1._jointData, "SharedControllerFunctions.AppendJoints: No joints registered")
        for i, v in ipairs(a2) do
            table.insert(a1._jointData, {Joint = v, Offsets = {v.C0, v.C1}})
        end
    end,
    RemoveJoints = function(a1, a2) -- Line: 132 -- types: a1: table, a2: table
        local Joint, Offsets
        if a1.FBXModel then
            return
        end
        assert(a1._jointData, "SharedControllerFunctions.AppendJoints: No joints registered")
        local v1, v2 = a2, a1
        for k, v in pairs(a1._jointData) do
            if table.find(v1, v.Joint) then
                Joint = v.Joint
                Offsets = v.Offsets
                if Offsets then
                    Joint.C0 = Offsets[1]
                end
                v2._jointData[k] = nil
            end
        end
        for i, i2 in ipairs(v1) do
            table.insert(v2._jointData, {Joint = i2, Offsets = {i2.C0, i2.C1}})
        end
    end,
    AimArmsAt = function(a1, a2, a3) -- Line: 176 -- types: a1: table, a2: vector, a3: number?
        local Joint, Offsets, v1, v2, v3
        if a1.FBXModel then
            return
        end
        assert(a1._jointData, "SharedControllerFunctions.AimArmsAt: No joints registered")
        a1._jointOffsetPivot.WorldCFrame = CFrame.new(a1._jointOffsetPivot.WorldPosition, a2)
        for i, v in ipairs(a1._jointData) do
            Offsets = v.Offsets
            Joint = v.Joint
            if Offsets then
                v1 = Offsets[1]
                v2 = Offsets[2]
                v3 = v1 * v2:Inverse()
                Joint.C0 = Joint.C0:Lerp(
                    (a1._jointOffsetPivot.WorldCFrame * (Joint.Part0.CFrame:ToObjectSpace(a1._root.CFrame):Inverse()) * a1._rootOffset * v3):ToObjectSpace(Joint.Part0.CFrame):inverse() * v2,
                    (math.clamp(20 * (a3 or 1), 0, 1))
                )
            end
        end
    end,
    AimHeadAt = function(a1, a2, a3) -- Line: 224 -- types: a1: table, a2: vector, a3: number?
        if a1.FBXModel then
            return
        end
        assert(a1._neckJoint, "SharedControllerFunctions.AimArmsAt: No neck joint registered")
        local Part1 = a1._neckJoint.Part1
        local CFrame_2 = a1._neckJoint.Part0.CFrame
        local v1 = CFrame_2:ToObjectSpace((CFrame.lookAt(Part1.Position, a2)))
        v1 = v1 - v1.Position
        local v2 = CFrame_2:ToObjectSpace(a1._root.CFrame)
        v2 = v2 - v2.Position
        a1._neckJoint.C0 = a1._neckJoint.C0:Lerp(CFrame.new(a1._neckJoint.C0.Position) * v1 * v2:Inverse() * a1._neckRot, (math.clamp(20 * (a3 or 1), 0, 1)))
    end,
    ResetJoints = function(a1) -- Line: 258 -- types: a1: table
        local Joint, Offsets
        if a1.FBXModel then
            return
        end
        assert(a1._neckJoint, "SharedControllerFunctions.AimArmsAt: No neck joint registered")
        a1._neckJoint.C0 = a1._neckC0
        for i, v in ipairs(a1._jointData) do
            Joint = v.Joint
            Offsets = v.Offsets
            if Offsets then
                Joint.C0 = Offsets[1]
            end
        end
    end,
}