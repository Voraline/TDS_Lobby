-- Script path: ReplicatedStorage.EventCameraRig.Rig.Animate
-- Decompile time: 15.97 ms

local v1
local Parent = script.Parent
local Humanoid = Parent:WaitForChild("Humanoid")
local u6 = "Standing"

local function getRigScale() -- Line: 5 -- upvalues: Parent (val)
    return Parent:GetScale()
end

local ScaleDampeningPercent = script:FindFirstChild("ScaleDampeningPercent")
local success, result = pcall(function() -- Line: 14
    return UserSettings():IsUserFeatureEnabled("UserAnimateRemoveEmoteChatHook")
end)
local u19 = ""
local u20 = nil
local u21 = nil
local u22 = nil
local u23 = 1
local u24 = nil
local u25 = nil
local u26 = {}
local u27 = {}
local u28 = {
    idle = {
        {id = "http://www.roblox.com/asset/?id=507766666", weight = 1},
        {id = "http://www.roblox.com/asset/?id=507766951", weight = 1},
        {id = "http://www.roblox.com/asset/?id=507766388", weight = 9},
    },
    walk = {{id = "http://www.roblox.com/asset/?id=507777826", weight = 10}},
    run = {{id = "http://www.roblox.com/asset/?id=507767714", weight = 10}},
    swim = {{id = "http://www.roblox.com/asset/?id=507784897", weight = 10}},
    swimidle = {{id = "http://www.roblox.com/asset/?id=507785072", weight = 10}},
    jump = {{id = "http://www.roblox.com/asset/?id=507765000", weight = 10}},
    fall = {{id = "http://www.roblox.com/asset/?id=507767968", weight = 10}},
    climb = {{id = "http://www.roblox.com/asset/?id=507765644", weight = 10}},
    sit = {{id = "http://www.roblox.com/asset/?id=2506281703", weight = 10}},
    toolnone = {{id = "http://www.roblox.com/asset/?id=507768375", weight = 10}},
    toolslash = {{id = "http://www.roblox.com/asset/?id=522635514", weight = 10}},
    toollunge = {{id = "http://www.roblox.com/asset/?id=522638767", weight = 10}},
    wave = {{id = "http://www.roblox.com/asset/?id=507770239", weight = 10}},
    point = {{id = "http://www.roblox.com/asset/?id=507770453", weight = 10}},
    dance = {
        {id = "http://www.roblox.com/asset/?id=507771019", weight = 10},
        {id = "http://www.roblox.com/asset/?id=507771955", weight = 10},
        {id = "http://www.roblox.com/asset/?id=507772104", weight = 10},
    },
    dance2 = {
        {id = "http://www.roblox.com/asset/?id=507776043", weight = 10},
        {id = "http://www.roblox.com/asset/?id=507776720", weight = 10},
        {id = "http://www.roblox.com/asset/?id=507776879", weight = 10},
    },
    dance3 = {
        {id = "http://www.roblox.com/asset/?id=507777268", weight = 10},
        {id = "http://www.roblox.com/asset/?id=507777451", weight = 10},
        {id = "http://www.roblox.com/asset/?id=507777623", weight = 10},
    },
    laugh = {{id = "http://www.roblox.com/asset/?id=507770818", weight = 10}},
    cheer = {{id = "http://www.roblox.com/asset/?id=507770677", weight = 10}},
}
local u75 = {
    wave = false,
    point = false,
    dance = true,
    dance2 = true,
    dance3 = true,
    laugh = false,
    cheer = false,
}
local u76 = nil
local u77 = nil
local u78 = nil
local u79 = nil
local u80 = nil
local success_2, result_2 = pcall(function() -- Line: 122
    return UserSettings():IsUserFeatureEnabled("UserAnimationAbilityManagerFixed")
end)
local u86 = success_2 and result_2

function resetManagerListeners() -- Line: 129 -- upvalues: u76 (ref), u77 (ref), u78 (ref)
    if u76 then
        u76:Disconnect()
        u76 = nil
    end
    if u77 then
        u77:Disconnect()
        u77 = nil
    end
    if u78 then
        u78:Disconnect()
        u78 = nil
    end
end

function teardownManager() -- Line: 145 -- upvalues: u79 (ref), u80 (ref)
    resetManagerListeners()
    u79 = nil
    u80 = nil
end

function processIfManagerBelongsToCharacter(a1) -- Line: 154
    -- upvalues: Parent (val), u80 (ref), u79 (ref), u76 (ref), u77 (ref), u78 (ref)
    if a1.RootPart ~= Parent.PrimaryPart then
        return false
    end
    if u80 ~= a1 then
        resetManagerListeners()
        u79 = a1.GroundSensor
        u76 = (a1:GetPropertyChangedSignal("GroundSensor")):Connect(function() -- Line: 159 -- upvalues: a1 (val), u76 (upval)
            if processIfManagerBelongsToCharacter(a1) then
                u76:Disconnect()
                u76 = nil
            end
        end)
        u77 = (a1:GetPropertyChangedSignal("RootPart")):Connect(function() -- Line: 165 -- upvalues: a1 (val), u77 (upval)
            if processIfManagerBelongsToCharacter(a1) then
                u77:Disconnect()
                u77 = nil
            end
        end)
        u78 = a1.AncestryChanged:Connect(function(a1, a2) -- Line: 171
            if a2 == nil then
                resetManagerListeners()
                lookForControllerManager()
            end
        end)
        u80 = a1
    end
    return true
end

function setupManager(a1) -- Line: 186
    -- upvalues: u80 (ref), u79 (ref), u76 (ref), u77 (ref), Parent (val), u78 (ref)
    u80 = a1
    u79 = a1.GroundSensor
    u76 = (a1:GetPropertyChangedSignal("GroundSensor")):Connect(function() -- Line: 190 -- upvalues: u79 (upval), u80 (upval)
        u79 = u80.GroundSensor
    end)
    u77 = (a1:GetPropertyChangedSignal("RootPart")):Connect(function() -- Line: 194 -- upvalues: a1 (val), Parent (upval)
        if a1.RootPart ~= Parent.PrimaryPart then
            teardownManager()
            lookForControllerManager()
        end
    end)
    u78 = a1.AncestryChanged:Connect(function(a1, a2) -- Line: 201
        if a2 == nil then
            teardownManager()
            lookForControllerManager()
        end
    end)
end

function lookForControllerManager() -- Line: 212 -- upvalues: u86 (ref), Parent (val), u79 (ref), u80 (ref)
    local v1
    if not u86 then
        u79 = nil
        u80 = nil
        local ControllerManager_2 = Parent:FindFirstChildOfClass("ControllerManager")
        if ControllerManager_2 then
            processIfManagerBelongsToCharacter(ControllerManager_2)
        end
        if u80 == nil then
            local u41 = nil
            v1 = Parent.ChildAdded:Connect(function(a1) -- Line: 249 -- upvalues: u41 (ref)
                if a1:IsA("ControllerManager") and processIfManagerBelongsToCharacter(a1) then
                    u41:Disconnect()
                    u41 = nil
                end
            end)
        end
        return
    end
    local ControllerManager = Parent:FindFirstChildOfClass("ControllerManager")
    if not ControllerManager then
        local u22 = nil
        v1 = Parent.ChildAdded:Connect(function(a1) -- Line: 230 -- upvalues: u22 (ref)
            if a1:IsA("ControllerManager") then
                u22:Disconnect()
                lookForControllerManager()
            end
        end)
        return
    end
    if ControllerManager.RootPart == Parent.PrimaryPart then
        setupManager(ControllerManager)
        return
    end
    local u12 = nil
    v1 = (ControllerManager:GetPropertyChangedSignal("RootPart")):Connect(function() -- Line: 221 -- upvalues: ControllerManager (val), Parent (upval), u12 (ref)
        if ControllerManager.RootPart == Parent.PrimaryPart then
            u12:Disconnect()
            setupManager(ControllerManager)
        end
    end)
end

lookForControllerManager()
math.randomseed(tick())

function findExistingAnimationInSet(a1, a2) -- Line: 264
    if a1 ~= nil and a2 ~= nil then
        local count = a1.count
        for i = 1, count do
            if a1[i].anim.AnimationId == a2.AnimationId then
                return i
            end
        end
        return 0
    end
    return 0
end

function configureAnimationSet(a1, a2) -- Line: 278 -- upvalues: u27 (val), u26 (val), Humanoid (val)
    local count_2
    if u27[a1] ~= nil then
        for k, v in pairs(u27[a1].connections) do
            v:disconnect()
        end
    end
    u27[a1] = {}
    local v1 = u27[a1]
    v1.count = 0
    v1 = u27[a1]
    v1.totalWeight = 0
    v1 = u27[a1]
    v1.connections = {}
    local u39 = true
    if not (pcall(function() -- Line: 291 -- upvalues: u39 (ref)
        local v0, v1
        u39 = game:GetService("StarterPlayer").AllowCustomAnimations
        return
    end)) then
        u39 = true
    end
    local v2 = script:FindFirstChild(a1)
    if u39 and v2 ~= nil then
        local Value, Weight, count, v3
        table.insert(u27[a1].connections, (v2.ChildAdded:connect(function(a1_2) -- Line: 299 -- upvalues: a1 (val), a2 (val)
            configureAnimationSet(a1, a2)
        end)))
        table.insert(u27[a1].connections, (v2.ChildRemoved:connect(function(a1_2) -- Line: 300 -- upvalues: a1 (val), a2 (val)
            configureAnimationSet(a1, a2)
        end)))
        for k2, i in pairs(v2:GetChildren()) do
            if i:IsA("Animation") then
                Value = 1
                Weight = i:FindFirstChild("Weight")
                if Weight ~= nil then
                    Value = Weight.Value
                end
                v3 = u27[a1]
                v3.count = u27[a1].count + 1
                count = u27[a1].count
                v3 = u27[a1]
                v3[count] = {}
                u27[a1][count].anim = i
                u27[a1][count].weight = Value
                v3 = u27[a1]
                v3.totalWeight = u27[a1].totalWeight + u27[a1][count].weight
                table.insert(u27[a1].connections, (i.Changed:connect(function(a1_2) -- Line: 316 -- upvalues: a1 (val), a2 (val)
                    configureAnimationSet(a1, a2)
                end)))
                table.insert(u27[a1].connections, (i.ChildAdded:connect(function(a1_2) -- Line: 317 -- upvalues: a1 (val), a2 (val)
                    configureAnimationSet(a1, a2)
                end)))
                table.insert(u27[a1].connections, (i.ChildRemoved:connect(function(a1_2) -- Line: 318 -- upvalues: a1 (val), a2 (val)
                    configureAnimationSet(a1, a2)
                end)))
            end
        end
    end
    if u27[a1].count <= 0 then
        local v4
        for k3, j in pairs(a2) do
            v4 = u27[a1]
            v4[k3] = {}
            v4 = u27[a1][k3]
            v4.anim = Instance.new("Animation")
            u27[a1][k3].anim.Name = a1
            u27[a1][k3].anim.AnimationId = j.id
            v4 = u27[a1][k3]
            v4.weight = j.weight
            v4 = u27[a1]
            v4.count = u27[a1].count + 1
            v4 = u27[a1]
            v4.totalWeight = u27[a1].totalWeight + j.weight
        end
    end
    for k4, k5 in pairs(u27) do
        count_2 = k5.count
        for n = 1, count_2 do
            if u26[k5[n].anim.AnimationId] == nil then
                Humanoid:LoadAnimation(k5[n].anim)
                u26[k5[n].anim.AnimationId] = true
            end
        end
    end
end

function configureAnimationSetOld(a1, a2) -- Line: 349 -- upvalues: u27 (val), Humanoid (val)
    local count
    if u27[a1] ~= nil then
        for k, v in pairs(u27[a1].connections) do
            v:disconnect()
        end
    end
    u27[a1] = {}
    local v1 = u27[a1]
    v1.count = 0
    v1 = u27[a1]
    v1.totalWeight = 0
    v1 = u27[a1]
    v1.connections = {}
    local u39 = true
    if not (pcall(function() -- Line: 362 -- upvalues: u39 (ref)
        local v0, v1
        u39 = game:GetService("StarterPlayer").AllowCustomAnimations
        return
    end)) then
        u39 = true
    end
    local v2 = script:FindFirstChild(a1)
    if u39 and v2 ~= nil then
        local Weight, v3, v4
        table.insert(u27[a1].connections, (v2.ChildAdded:connect(function(a1_2) -- Line: 370 -- upvalues: a1 (val), a2 (val)
            configureAnimationSet(a1, a2)
        end)))
        table.insert(u27[a1].connections, (v2.ChildRemoved:connect(function(a1_2) -- Line: 371 -- upvalues: a1 (val), a2 (val)
            configureAnimationSet(a1, a2)
        end)))
        local v5 = 1
        for k2, i in pairs(v2:GetChildren()) do
            if i:IsA("Animation") then
                table.insert(u27[a1].connections, (i.Changed:connect(function(a1_2) -- Line: 375 -- upvalues: a1 (val), a2 (val)
                    configureAnimationSet(a1, a2)
                end)))
                v3 = u27[a1]
                v3[v5] = {}
                u27[a1][v5].anim = i
                Weight = i:FindFirstChild("Weight")
                if Weight ~= nil then
                    v4 = u27[a1][v5]
                    v4.weight = Weight.Value
                else
                    v4 = u27[a1][v5]
                    v4.weight = 1
                end
                v4 = u27[a1]
                v4.count = u27[a1].count + 1
                v4 = u27[a1]
                v4.totalWeight = u27[a1].totalWeight + u27[a1][v5].weight
                v5 = v5 + 1
            end
        end
    end
    if u27[a1].count <= 0 then
        local v6
        for k3, j in pairs(a2) do
            v6 = u27[a1]
            v6[k3] = {}
            v6 = u27[a1][k3]
            v6.anim = Instance.new("Animation")
            u27[a1][k3].anim.Name = a1
            u27[a1][k3].anim.AnimationId = j.id
            v6 = u27[a1][k3]
            v6.weight = j.weight
            v6 = u27[a1]
            v6.count = u27[a1].count + 1
            v6 = u27[a1]
            v6.totalWeight = u27[a1].totalWeight + j.weight
        end
    end
    for k4, k5 in pairs(u27) do
        count = k5.count
        for n = 1, count do
            Humanoid:LoadAnimation(k5[n].anim)
        end
    end
end

function scriptChildModified(a1) -- Line: 414 -- upvalues: u28 (val)
    local v1 = u28[a1.Name]
    if v1 ~= nil then
        configureAnimationSet(a1.Name, v1)
    end
end

script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)
local Animator = if not Humanoid then nil else Humanoid:FindFirstChildOfClass("Animator")
if Animator then
    for i, v in ipairs((Animator:GetPlayingAnimationTracks())) do
        v:Stop(0)
        v:Destroy()
    end
end
for k, i2 in pairs(u28) do
    configureAnimationSet(k, i2)
end
local u157 = "None"
local u158 = 0
local u159 = 0
local u160 = false

function stopAllAnimations() -- Line: 455
    -- upvalues: u19 (ref), u75 (val), u160 (ref), u20 (ref), u22 (ref), u21 (ref), u25 (ref), u24 (ref)
    local v1 = u19
    if u75[v1] ~= nil and u75[v1] == false then
        v1 = "idle"
    end
    if u160 then
        v1 = "idle"
        u160 = false
    end
    u19 = ""
    u20 = nil
    if u22 ~= nil then
        u22:disconnect()
    end
    if u21 ~= nil then
        u21:Stop()
        u21:Destroy()
        u21 = nil
    end
    if u25 ~= nil then
        u25:disconnect()
    end
    if u24 ~= nil then
        u24:Stop()
        u24:Destroy()
        u24 = nil
    end
    return v1
end

function getHeightScale() -- Line: 494 -- upvalues: Humanoid (val), getRigScale (val), ScaleDampeningPercent (ref)
    if not Humanoid or not Humanoid.AutomaticScalingEnabled then
        return getRigScale()
    end
    local v1 = Humanoid.HipHeight / 2
    if ScaleDampeningPercent == nil then
        ScaleDampeningPercent = script:FindFirstChild("ScaleDampeningPercent")
    end
    if ScaleDampeningPercent ~= nil then
        v1 = 1 + (Humanoid.HipHeight - 2) * ScaleDampeningPercent.Value / 2
    end
    return v1
end

local function rootMotionCompensation(a1) -- Line: 514
    return a1 * 1.25 / getHeightScale()
end

local function setRunSpeed(a1) -- Line: 522 -- upvalues: u21 (ref), u24 (ref)
    local v1 = a1 * 1.25 / getHeightScale()
    local v2 = 0.0001
    local v3 = 0.0001
    local v4 = 1
    if v1 <= 0.5 then
        v2 = 1
        v4 = v1 / 0.5
    elseif not (v1 < 1) then
        v4 = v1 / 1
        v3 = 1
    else
        local v5 = (v1 - 0.5) / 0.5
        v2 = 1 - v5
        v3 = v5
    end
    u21:AdjustWeight(v2)
    u24:AdjustWeight(v3)
    u21:AdjustSpeed(v4)
    u24:AdjustSpeed(v4)
end

function setAnimationSpeed(a1) -- Line: 548 -- upvalues: u19 (ref), setRunSpeed (val), u23 (ref), u21 (ref)
    if u19 == "walk" then
        setRunSpeed(a1)
        return
    end
    if a1 ~= u23 then
        u21:AdjustSpeed(a1)
    end
end

function keyFrameReachedFunc(a1) -- Line: 559
    -- upvalues: u19 (ref), u24 (ref), u21 (ref), u75 (val), u160 (ref), u23 (ref), Humanoid (val)
    if a1 == "End" then
        if u19 ~= "walk" then
            local v1 = u19
            if u75[v1] ~= nil and u75[v1] == false then
                v1 = "idle"
            end
            if u160 then
                if u21.Looped then
                    return
                end
                v1 = "idle"
                u160 = false
            end
            local v2 = u23
            playAnimation(v1, 0.15, Humanoid)
            setAnimationSpeed(v2)
        else
            if u24.Looped ~= true then
                u24.TimePosition = 0
            end
            if u21.Looped ~= true then
                u21.TimePosition = 0
                return
            end
        end
    end
end

function rollAnimation(a1) -- Line: 592 -- upvalues: u27 (val)
    local v1 = math.random(1, u27[a1].totalWeight)
    local v2 = 1
    while u27[a1][v2].weight < v1 do
        v1 = v1 - u27[a1][v2].weight
        v2 = v2 + 1
    end
    return v2
end

local function switchToAnim(a1, a2, a3, a4) -- Line: 603
    -- upvalues: u20 (ref), u21 (ref), u24 (ref), u23 (ref), u19 (ref), u22 (ref), u27 (val), u25 (ref)
    if a1 ~= u20 then
        if u21 ~= nil then
            u21:Stop(a3)
            u21:Destroy()
        end
        if u24 ~= nil then
            u24:Stop(a3)
            u24:Destroy()
            u24 = nil
        end
        u23 = 1
        u21 = a4:LoadAnimation(a1)
        u21.Priority = Enum.AnimationPriority.Core
        u21:Play(a3)
        u19 = a2
        u20 = a1
        if u22 ~= nil then
            u22:disconnect()
        end
        u22 = u21.KeyframeReached:connect(keyFrameReachedFunc)
        if a2 == "walk" then
            u24 = a4:LoadAnimation(u27.run[(rollAnimation("run"))].anim)
            u24.Priority = Enum.AnimationPriority.Core
            u24:Play(a3)
            if u25 ~= nil then
                u25:disconnect()
            end
            u25 = u24.KeyframeReached:connect(keyFrameReachedFunc)
        end
    end
end

function playAnimation(a1, a2, a3) -- Line: 652 -- upvalues: u27 (val), switchToAnim (val), u160 (ref)
    local v1 = rollAnimation(a1)
    switchToAnim(u27[a1][v1].anim, a1, a2, a3)
    u160 = false
end

function playEmote(a1, a2, a3) -- Line: 660 -- upvalues: switchToAnim (val), u160 (ref)
    switchToAnim(a1, a1.Name, a2, a3)
    u160 = true
end

local u183 = ""
local u184 = nil
local u185 = nil
local u186 = nil

function toolKeyFrameReachedFunc(a1) -- Line: 673 -- upvalues: u183 (ref), Humanoid (val)
    if a1 == "End" then
        playToolAnimation(u183, 0, Humanoid)
    end
end

function playToolAnimation(a1, a2, a3, a4) -- Line: 680
    -- upvalues: u27 (val), u185 (ref), u184 (ref), u183 (ref), u186 (ref)
    local v1 = rollAnimation(a1)
    local anim = u27[a1][v1].anim
    if u185 ~= anim then
        if u184 ~= nil then
            u184:Stop()
            u184:Destroy()
            a2 = 0
        end
        u184 = a3:LoadAnimation(anim)
        if a4 then
            u184.Priority = a4
        end
        u184:Play(a2)
        u183 = a1
        u185 = anim
        u186 = u184.KeyframeReached:connect(toolKeyFrameReachedFunc)
    end
end

function stopToolAnimations() -- Line: 707 -- upvalues: u183 (ref), u186 (ref), u185 (ref), u184 (ref)
    local v1 = u183
    if u186 ~= nil then
        u186:disconnect()
    end
    u183 = ""
    u185 = nil
    if u184 ~= nil then
        u184:Stop()
        u184:Destroy()
        u184 = nil
    end
    return v1
end

function onRunning(a1) -- Line: 729
    -- upvalues: u79 (ref), Humanoid (val), u80 (ref), u160 (ref), u6 (ref), u75 (val), u19 (ref)
    local v1 = getHeightScale()
    if u79 ~= nil and Humanoid.EvaluateStateMachine == false then
        local RootPart = Humanoid.RootPart
        local SensedPart = u79.SensedPart
        if SensedPart then
            local VelocityAtPosition = SensedPart:GetVelocityAtPosition(u79.HitFrame.Position)
            local AssemblyLinearVelocity = RootPart.AssemblyLinearVelocity
            local Magnitude = Vector3.new(AssemblyLinearVelocity.X - VelocityAtPosition.X, 0, AssemblyLinearVelocity.Z - VelocityAtPosition.Z).Magnitude
            local Magnitude_2 = u80.MovingDirection.Magnitude
            if Magnitude_2 < 0.1 then
                Magnitude = 0
                Magnitude_2 = 0
            elseif Magnitude_2 > 1 then
                Magnitude_2 = 1
            end
            a1 = Magnitude * Magnitude_2
        end
    end
    if (u160 and Humanoid.MoveDirection == Vector3.new(0, 0, 0) and Humanoid.WalkSpeed / v1 or 0.75) * v1 < a1 then
        playAnimation("walk", 0.2, Humanoid)
        setAnimationSpeed(a1 / 16)
        u6 = "Running"
        return
    end
    if u75[u19] == nil and not u160 then
        playAnimation("idle", 0.2, Humanoid)
        u6 = "Standing"
    end
end

function onDied() -- Line: 772 -- upvalues: u6 (ref)
    u6 = "Dead"
end

function onJumping() -- Line: 776 -- upvalues: Humanoid (val), u159 (ref), u6 (ref)
    playAnimation("jump", 0.1, Humanoid)
    u159 = 0.31
    u6 = "Jumping"
end

function onClimbing(a1) -- Line: 782 -- upvalues: Humanoid (val), u6 (ref)
    local v1 = a1 / getHeightScale()
    playAnimation("climb", 0.1, Humanoid)
    setAnimationSpeed(v1 / 5)
    u6 = "Climbing"
end

function onGettingUp() -- Line: 790 -- upvalues: u6 (ref)
    u6 = "GettingUp"
end

function onFreeFall() -- Line: 794 -- upvalues: u159 (ref), Humanoid (val), u6 (ref)
    if u159 <= 0 then
        playAnimation("fall", 0.2, Humanoid)
    end
    u6 = "FreeFall"
end

function onFallingDown() -- Line: 801 -- upvalues: u6 (ref)
    u6 = "FallingDown"
end

function onSeated() -- Line: 805 -- upvalues: u6 (ref)
    u6 = "Seated"
end

function onPlatformStanding() -- Line: 809 -- upvalues: u6 (ref)
    u6 = "PlatformStanding"
end

function onSwimming(a1) -- Line: 816 -- upvalues: Humanoid (val), u6 (ref)
    local v1 = a1 / getHeightScale()
    if not (v1 > 1) then
        playAnimation("swimidle", 0.4, Humanoid)
        u6 = "Standing"
        return
    end
    playAnimation("swim", 0.4, Humanoid)
    setAnimationSpeed(v1 / 10)
    u6 = "Swimming"
end

function animateTool() -- Line: 829 -- upvalues: u157 (ref), Humanoid (val)
    if u157 == "None" then
        playToolAnimation("toolnone", 0.1, Humanoid, Enum.AnimationPriority.Idle)
        return
    end
    if u157 == "Slash" then
        playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
        return
    end
    if u157 ~= "Lunge" then
        return
    end
    playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
end

function getToolAnim(a1) -- Line: 846
    for i, v in ipairs(a1:GetChildren()) do
        if v.Name == "toolanim" and v.className == "StringValue" then
            return v
        end
    end
    return nil
end

local u205 = 0

function stepAnimate(a1) -- Line: 857
    -- upvalues: u205 (ref), u159 (ref), u6 (ref), Humanoid (val), Parent (val), u157 (ref), u158 (ref), u185 (ref)
    local Tool, v1
    local v2 = a1 - u205
    u205 = a1
    if u159 > 0 then
        u159 = u159 - v2
    end
    if u6 == "FreeFall" and u159 <= 0 then
        playAnimation("fall", 0.2, Humanoid)
        Tool = Parent:FindFirstChildOfClass("Tool")
        if Tool and Tool:FindFirstChild("Handle") then
            v1 = getToolAnim(Tool)
            if v1 then
                u157 = v1.Value
                v1.Parent = nil
                u158 = a1 + 0.3
            end
            if u158 < a1 then
                u158 = 0
                u157 = "None"
            end
            animateTool()
            return
        end
        stopToolAnimations()
        u157 = "None"
        u185 = nil
        u158 = 0
        return
    end
    if u6 == "Seated" then
        playAnimation("sit", 0.5, Humanoid)
        return
    end
    if u6 == "Running" then
        playAnimation("walk", 0.2, Humanoid)
    elseif u6 == "Dead" or u6 == "GettingUp" or u6 == "FallingDown" or u6 == "Seated" or u6 == "PlatformStanding" then
        stopAllAnimations()
    end
    Tool = Parent:FindFirstChildOfClass("Tool")
    if Tool and Tool:FindFirstChild("Handle") then
        v1 = getToolAnim(Tool)
        if v1 then
            u157 = v1.Value
            v1.Parent = nil
            u158 = a1 + 0.3
        end
        if u158 < a1 then
            u158 = 0
            u157 = "None"
        end
        animateTool()
        return
    end
    stopToolAnimations()
    u157 = "None"
    u185 = nil
    u158 = 0
end

Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(onJumping)
Humanoid.Climbing:connect(onClimbing)
Humanoid.GettingUp:connect(onGettingUp)
Humanoid.FreeFalling:connect(onFreeFall)
Humanoid.FallingDown:connect(onFallingDown)
Humanoid.Seated:connect(onSeated)
Humanoid.PlatformStanding:connect(onPlatformStanding)
Humanoid.Swimming:connect(onSwimming)
if not success or not result then
    (game:GetService("Players")).LocalPlayer.Chatted:connect(function(a1) -- Line: 924 -- upvalues: u6 (ref), u75 (val), Humanoid (val)
        local v1 = ""
        if string.sub(a1, 1, 3) == "/e " then
            v1 = string.sub(a1, 4)
        elseif string.sub(a1, 1, 7) == "/emote " then
            v1 = string.sub(a1, 8)
        end
        if u6 == "Standing" and u75[v1] ~= nil then
            playAnimation(v1, 0.1, Humanoid)
        end
    end)
end
local PlayEmote = script:WaitForChild("PlayEmote")

function PlayEmote.OnInvoke(a1) -- Line: 939 -- upvalues: u6 (ref), u75 (val), Humanoid (val), u21 (ref)
    if u6 ~= "Standing" then
        return
    end
    if u75[a1] ~= nil then
        playAnimation(a1, 0.1, Humanoid)
        return true, u21
    end
    if typeof(a1) == "Instance" and a1:IsA("Animation") then
        playEmote(a1, 0.1, Humanoid)
        return true, u21
    end
    return false
end

if Parent.Parent ~= nil then
    playAnimation("idle", 0.1, Humanoid)
end
while Parent.Parent ~= nil do
    _, v1 = wait(0.1)
    stepAnimate(v1)
end