-- Script path: ReplicatedStorage.Client.Modules.CutscenePlayerAppearanceUtil
-- Decompile time: 7.45 ms

local u0 = {}
local u19 = table.freeze({
    "HumanoidRootPart",
    "Head",
    "UpperTorso",
    "LowerTorso",
    "LeftUpperArm",
    "LeftLowerArm",
    "LeftHand",
    "RightUpperArm",
    "RightLowerArm",
    "RightHand",
    "LeftUpperLeg",
    "LeftLowerLeg",
    "LeftFoot",
    "RightUpperLeg",
    "RightLowerLeg",
    "RightFoot",
})
local u22 = table.freeze({
    BodyDepthScale = 1,
    BodyHeightScale = 0.95,
    BodyProportionScale = 1,
    BodyTypeScale = 0.3,
    BodyWidthScale = 1,
    HeadScale = 1,
})

local function clearTags(a1) -- Line: 31 -- types: a1: userdata
    for i, j in a1:GetTags() do
        a1:RemoveTag(j)
    end
end

function u0.PrepareModel(a1) -- Line: 37 -- upvalues: u19 (val), u22 (val) -- types: a1: userdata
    local v1, v2
    for i, j in a1:GetTags() do
        a1:RemoveTag(j)
    end
    local v3 = a1
    for k, n in a1:GetChildren() do
        v1 = n:IsA("Accessory") or n:IsA("BodyColors") or n:IsA("Humanoid") or n:IsA("Pants") or n:IsA("Shirt") or n:IsA("ShirtGraphic") or n:IsA("BasePart") and table.find(u19, n.Name) ~= nil
        if not v1 then
            n:Destroy()
        end
    end
    for m, i5 in v3:GetDescendants() do
        for i6, i7 in i5:GetTags() do
            i5:RemoveTag(i7)
        end
        if i5:IsA("Animator") or i5:IsA("LuaSourceContainer") or i5:IsA("Motor6D") then
            i5:Destroy()
        elseif i5:IsA("BasePart") then
            i5.Anchored = false
            i5.CanCollide = false
            i5.CanQuery = false
            i5.CanTouch = false
            i5.Massless = true
            i5.LocalTransparencyModifier = 0
        end
    end
    local Humanoid = v3:FindFirstChildOfClass("Humanoid")
    if not Humanoid then
        return
    end
    for i8, i9 in u22 do
        v2 = Humanoid:FindFirstChild(i8)
        if v2 and v2:IsA("NumberValue") then
            v2.Value = i9
        end
    end
    Humanoid.AutoRotate = false
    Humanoid.EvaluateStateMachine = false
end

function u0.ClonePlayer(a1) -- Line: 90 -- upvalues: u0 (val) -- types: a1: userdata
    local Character = a1.Character
    if not Character then
        return nil, "Player has no character"
    end
    local Archivable = Character.Archivable
    Character.Archivable = true
    local success, result = pcall(function() -- Line: 99 -- upvalues: Character (val)
        return Character:Clone()
    end)
    Character.Archivable = Archivable
    if not success then
        return nil, (tostring(result))
    end
    if typeof(result) == "Instance" and result:IsA("Model") then
        local Humanoid = result:FindFirstChildOfClass("Humanoid")
        if Humanoid and Humanoid.RigType == Enum.HumanoidRigType.R15 then
            u0.PrepareModel(result)
            return result, nil
        end
        result:Destroy()
        return nil, "Character is not R15"
    end
    if typeof(result) == "Instance" then
        result:Destroy()
    end
    return nil, "Character clone was not a Model"
end

function u0.BindToRig(a1, a2) -- Line: 128 -- upvalues: u19 (val) -- types: a1: userdata, a2: userdata
    local AccessoryWeld, Handle, Part1, WeldConstraint, v1, v2
    for i, j in u19 do
        v1 = a1:FindFirstChild(j)
        v2 = a2:FindFirstChild(j)
        if v1 and v1:IsA("BasePart") then
            if v2 and v2:IsA("BasePart") then
                continue
            end
            return nil, nil, (("Appearance is missing %*"):format(j))
        end
        return nil, nil, (("Authored rig is missing %*"):format(j))
    end
    local v3 = nil
    local v4 = nil
    local v5, v6 = a2, a1
    for k, n in u19, v3, v4 do
        v1 = v6:FindFirstChild(n)
        v2 = v5:FindFirstChild(n)
        if n == "Head" then
            for m, i5 in v1:QueryDescendants("Decal") do
                if i5.Name == "face" then
                    i5:Destroy()
                end
            end
        end
        v2.CFrame = v1.CFrame
        v1.Transparency = 1
        WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Name = "CutsceneAppearanceWeld"
        WeldConstraint.Part0 = v1
        WeldConstraint.Part1 = v2
        WeldConstraint.Parent = v2
    end
    local v7 = 0
    for i6, i7 in v5:GetChildren() do
        if i7:IsA("Accessory") then
            Handle = i7:FindFirstChild("Handle")
            if Handle and Handle:IsA("BasePart") then
                AccessoryWeld = Handle:FindFirstChild("AccessoryWeld")
                Part1 = AccessoryWeld
                if Part1 then
                    Part1 = AccessoryWeld:IsA("Weld")
                    if Part1 then
                        Part1 = false
                        if AccessoryWeld.Part0 == Handle then
                            Part1 = AccessoryWeld.Part1
                            if Part1 then
                                Part1 = false
                                if AccessoryWeld.Part1.Parent == v5 then
                                    Part1 = table.find(u19, AccessoryWeld.Part1.Name) ~= nil
                                end
                            end
                        end
                    end
                end
                if Part1 then
                    v7 = v7 + 1
                end
            end
        end
    end
    v5.Name = ("%*_Appearance"):format(v6.Name)
    v5.Parent = v6
    return #u19, v7, nil
end

return u0