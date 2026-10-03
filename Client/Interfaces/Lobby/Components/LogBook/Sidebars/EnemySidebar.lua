-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LogBook.Sidebars.EnemySidebar
-- Decompile time: 6.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
require(ReplicatedStorage.Shared.Modules.SharedUniversalFunctions)
local useContentEnemy = require(ReplicatedStorage.Client.Interfaces.Hooks.useContentEnemy)
local useEnemyModel = require(ReplicatedStorage.Client.Interfaces.Hooks.useEnemyModel)
local memo = React.memo
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef

local function getWalkAnimation(a1) -- Line: 28 -- types: a1: userdata
    local LogbookCustomWalk = a1:FindFirstChild("LogbookCustomWalk") or a1:FindFirstChild("Walk")
    if not LogbookCustomWalk then
        return nil
    end
    if not LogbookCustomWalk:IsA("Folder") then
        if LogbookCustomWalk:IsA("Animation") then
            return LogbookCustomWalk
        end
        return nil
    end
    local v1 = {}
    for i, j in LogbookCustomWalk:GetChildren() do
        if j:IsA("Animation") then
            table.insert(v1, j)
        end
    end
    if #v1 == 0 then
        return nil
    end
    return v1[math.random(1, #v1)]
end

return memo(function(a1) -- Line: 58
    -- upvalues: useRef (val), useEnemyModel (val), useContentEnemy (val), useEffect (val), ReplicatedStorage (val)
    -- upvalues: getWalkAnimation (val), RunService (val), createElement (val)
    local u3 = useRef(nil)
    local u6 = useRef(nil)
    local u9 = useRef(nil)
    local transparency = a1.transparency
    local setIsLoading = a1.setIsLoading
    local selectedEnemy = a1.selectedEnemy
    local u22 = useEnemyModel(selectedEnemy.name, selectedEnemy.legacy == true)
    local u26 = useContentEnemy(selectedEnemy)
    local v1 = {u22, u26}
    useEffect(function() -- Line: 73
        -- upvalues: setIsLoading (val), u22 (val), u3 (val), u6 (val), u9 (val), ReplicatedStorage (upval), u26 (val)
        -- upvalues: getWalkAnimation (upval), RunService (upval)
        local u0 = nil
        local u1 = nil
        local u2 = nil
        local u5 = task.spawn(function() -- Line: 78
            -- upvalues: setIsLoading (upval), u22 (upval), u3 (upval), u6 (upval), u9 (upval)
            -- upvalues: ReplicatedStorage (upval), u2 (ref), u26 (upval), getWalkAnimation (upval), u0 (ref), u1 (ref)
            -- upvalues: RunService (upval)
            setIsLoading(true)
            if u22 and u3.current and u6.current then
                if not u9.current then
                    local v1 = ReplicatedStorage.Assets.Models.EnemyPreview:Clone()
                    v1.Parent = u3.current
                    u9.current = v1
                end
                setIsLoading(false)
                u2 = u22:Clone()
                u2:RemoveTag("ENEMY_STREAM")
                u2:RemoveTag("LEGACYENEMY_STREAM")
                u2.Parent = u3.current
                local ExtentsSize = u2:GetExtentsSize()
                local PrimaryPart = u2.PrimaryPart or u2:FindFirstChildWhichIsA("BasePart", true)
                local v2 = ExtentsSize.Magnitude / 1.2 / 0.5773502691896257
                u6.current.FieldOfView = 50
                u2:PivotTo((CFrame.new(0, 0, -v2)) * (CFrame.Angles(0, 3.141592653589793, 0)))
                local v3 = Vector3.new(-2, ExtentsSize.Y / 2, 0)
                u6.current.CFrame = CFrame.new(v3, if not PrimaryPart then Vector3.new(0, 0, 0) else PrimaryPart.Position)
                local Ground = u9.current:FindFirstChild("Ground")
                local Node = PrimaryPart and PrimaryPart:FindFirstChild("Node")
                if Ground and Ground:IsA("BasePart") and Node and Node:IsA("Attachment") then
                    Ground.Position = Node.WorldPosition
                end
                local AnimationController = u2:FindFirstChild("AnimationController")
                local Animations = u2:FindFirstChild("Animations")
                local u131 = tonumber(u26 and u26.Speed) or 0
                if Animations and AnimationController then
                    local Animator = AnimationController:FindFirstChild("Animator")
                    if not Animator then
                        Animator = Instance.new("Animator")
                        Animator.Parent = AnimationController
                    end
                    local v4 = getWalkAnimation(Animations)
                    if v4 then
                        u0 = Animator:LoadAnimation(v4)
                        local v5 = os.clock()
                        while u0.Length == 0 do
                            if not (os.clock() - v5 < 2) then
                                break
                            end
                            task.wait()
                        end
                        local v6 = v4:GetAttribute("Speed") or 1
                        u0:Play(0)
                        if 0 < u0.Length and u131 > 0 then
                            local v7 = u131 / (u0.Length * 2.7) * v6
                            u0:AdjustSpeed(v7)
                        end
                    end
                    local u191 = 0
                    u1 = RunService.Heartbeat:Connect(function(a1) -- Line: 159 -- upvalues: u9 (upval), u191 (ref), u131 (val), RunService (upval), Animator (ref)
                        if u9.current and u9.current.Parent then
                            u191 = u191 + a1 * 20
                            local Ground = u9.current:FindFirstChild("Ground")
                            local Texture = Ground and Ground:FindFirstChild("Texture")
                            if Texture and Texture:IsA("Texture") and u131 > 0 then
                                Texture.OffsetStudsV = Texture.OffsetStudsV - u131 * a1
                            end
                            if not RunService:IsRunning() then
                                Animator:StepAnimations(a1)
                            end
                            return
                        end
                    end)
                end
                return
            end
            setIsLoading(false)
        end)
        return function() -- Line: 179 -- upvalues: setIsLoading (upval), u5 (val), u1 (ref), u0 (ref), u2 (ref)
            setIsLoading(true)
            if u5 then
                task.cancel(u5)
            end
            if u1 then
                u1:Disconnect()
                u1 = nil
            end
            if u0 then
                u0:Destroy()
            end
            if u2 then
                u2:Destroy()
            end
        end
    end, v1)
    v1 = {u3}
    useEffect(function() -- Line: 201 -- upvalues: u3 (val), u9 (val), ReplicatedStorage (upval)
        if not u3.current or u9.current then
            return
        end
        local v1 = ReplicatedStorage.Assets.Models.EnemyPreview:Clone()
        v1.Parent = u3.current
        u9.current = v1
    end, v1)
    v1 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(16, 21, 30),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -16, 1, -16),
        CurrentCamera = u6,
        ImageTransparency = transparency,
    }
    local v2 = {uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(0, 6)})}
    local selectedEnemy_2 = a1.selectedEnemy and createElement("WorldModel", {ref = u3})
    v2.worldModel = selectedEnemy_2
    v2.camera = createElement("Camera", {ref = u6, CFrame = CFrame.new(0, 1, 0)})
    return createElement("ViewportFrame", v1, v2)
end)