-- Script path: ReplicatedStorage.Shared.Modules.HumanoidUtil
-- Decompile time: 1.59 ms

local function createBlankHumanoid() -- Line: 1
    local Humanoid = Instance.new("Humanoid")
    Humanoid.Name = "Humanoid"
    Humanoid.AutoJumpEnabled = false
    Humanoid.AutoRotate = false
    Humanoid.AutomaticScalingEnabled = false
    Humanoid.BreakJointsOnDeath = false
    Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    Humanoid.EvaluateStateMachine = false
    Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
    Humanoid.NameOcclusion = Enum.NameOcclusion.NoOcclusion
    Humanoid.RequiresNeck = false
    Humanoid.UseJumpPower = false
    Instance.new("Animator").Parent = Humanoid
    return Humanoid
end

return {
    createAnimationHost = function(a1, a2) -- Line: 43 -- upvalues: createBlankHumanoid (val) -- types: a1: userdata, a2: boolean
        local v1
        local AnimationController = a1:FindFirstChild("AnimationController")
        if not a2 then
            if AnimationController and not AnimationController:IsA("AnimationController") then
                AnimationController:Destroy()
                AnimationController = nil
            end
            if not AnimationController then
                AnimationController = Instance.new("AnimationController")
                AnimationController.Name = "AnimationController"
                AnimationController.Parent = a1
            end
            v1 = AnimationController:FindFirstChildOfClass("Animator")
            if not v1 then
                v1 = Instance.new("Animator")
                v1.Name = "Animator"
                v1.Parent = AnimationController
            end
            return AnimationController, v1
        end
        if AnimationController and AnimationController:IsA("Humanoid") then
            v1 = AnimationController:FindFirstChildOfClass("Animator")
            if not v1 then
                v1 = Instance.new("Animator")
                v1.Name = "Animator"
                v1.Parent = AnimationController
            end
            return AnimationController, v1
        end
        if AnimationController then
            AnimationController:Destroy()
        end
        local v2 = createBlankHumanoid()
        v2.Name = "AnimationController"
        v2.Parent = a1
        local Animator = v2:FindFirstChildOfClass("Animator")
        if not Animator then
            Animator = Instance.new("Animator")
            Animator.Name = "Animator"
            Animator.Parent = v2
        end
        return v2, Animator
    end,
    createBlankHumanoid = createBlankHumanoid,
    ensureAnimator = function(a1) -- Line: 21
        local Animator = a1:FindFirstChildOfClass("Animator")
        if not Animator then
            Animator = Instance.new("Animator")
            Animator.Name = "Animator"
            Animator.Parent = a1
        end
        return Animator
    end,
    findFirstRigBone = function(a1) -- Line: 33 -- types: a1: userdata
        for i, j in a1:GetDescendants() do
            if j:IsA("Bone") and not j:FindFirstAncestor("BoneVFX") then
                return j
            end
        end
        return nil
    end,
}