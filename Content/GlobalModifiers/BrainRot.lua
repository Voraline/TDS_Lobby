-- Script path: ReplicatedStorage.Content.GlobalModifiers.BrainRot
-- Decompile time: 4.49 ms

local AssetService = game:GetService("AssetService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)

local function loadEnemyPack(a1, a2) -- Line: 15
    -- upvalues: ReplicatedStorage (val), AssetService (val)
    local Assets = ReplicatedStorage.Assets
    local BrainRotEnemies = Assets:FindFirstChild("BrainRotEnemies")
    if BrainRotEnemies then
        return BrainRotEnemies
    end
    local v1 = AssetService:LoadAssetAsync(117073480889144):GetChildren()[1]
    if not a2() then
        v1:Destroy()
        return nil
    end
    v1.Name = "BrainRotEnemies"
    v1.Parent = Assets
    a1:Mark(v1)
    return v1
end

local function getSortedEnemies(a1) -- Line: 36 -- types: a1: userdata
    local Children = a1:GetChildren()
    table.sort(Children, function(a1, a2) -- Line: 38
        return a1.Name < a2.Name
    end)
    return Children
end

local function hashName(a1) -- Line: 44 -- types: a1: string
    local v1 = 0
    local v2 = #a1
    for i = 1, v2 do
        v1 = v1 + string.byte(a1, i) * i
    end
    return v1
end

local function formatName(a1) -- Line: 52 -- types: a1: string
    local u1 = 1
    local u2 = nil
    return (a1:gsub(".", function(a1) -- Line: 56 -- upvalues: u1 (ref), u2 (ref)
        if u1 ~= 1 and a1 == a1:upper() and u2 ~= " " then
            a1 = " " .. a1
            u2 = " "
        end
        u1 = u1 + 1
        u2 = a1
        return a1
    end))
end

local function makePicker(a1, a2) -- Line: 72 -- types: a1: table, a2: number
    local u2 = {}
    return function(a1_2) -- Line: 75 -- upvalues: u2 (val), a2 (val), a1 (val) -- types: a1_2: string
        if u2[a1_2] then
            return u2[a1_2]
        end
        local new = Random.new
        local v1 = 0
        local v2 = #a1_2
        for i = 1, v2 do
            v1 = v1 + string.byte(a1_2, i) * i
        end
        local Name = a1[(new((v1 + a2) % 2147483647)):NextInteger(1, #a1)].Name
        u2[a1_2] = Name
        return Name
    end
end

local function hideOriginalModel(a1) -- Line: 88 -- types: a1: userdata
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = 1
        end
    end
end

local function attachReplacement(a1, a2, a3) -- Line: 96 -- types: a1: table, a2: userdata
    local Model = a1.Model
    local v1 = math.abs(Model.PrimaryPart.Node.CFrame.Y) / 1.35
    local v2 = a2:Clone()
    v2:PivotTo((Model:GetPivot()))
    v2:ScaleTo(v1)
    v2.Parent = Model
    local WeldConstraint = Instance.new("WeldConstraint")
    WeldConstraint.Part0 = v2.Body
    WeldConstraint.Part1 = Model.PrimaryPart
    WeldConstraint.Parent = v2.Body
    v2.Body.CanCollide = false
    v2.Body.CanTouch = false
    v2.Body.CanQuery = false
    local Attribute = v2:GetAttribute("Walk")
    if Attribute then
        a3.new({
            Target = v2.AnimationController.Animator,
            Id = Attribute:match("%d+"),
            Entity = a1,
        }):Play()
    end
end

return {
    displayName = "Brain Rot",
    description = "All mobs are replaced with a random brain-rot.",
    rewardMultiplier = 0,
    icon = 130712951891393,
    onEnableServer = function(a1, a2, a3) -- Line: 136 -- upvalues: loadEnemyPack (val), LegacyMiddleware (val), Enum (val)
        local u11 = Random.new(tick()):NextInteger(1, 2147483647)
        local u12 = true
        workspace:SetAttribute("BrainRotSeed", u11)
        a2:Mark(function() -- Line: 141 -- upvalues: u12 (ref)
            u12 = false
            workspace:SetAttribute("BrainRotSeed", nil)
        end)
        task.spawn(function() -- Line: 146
            -- upvalues: loadEnemyPack (upval), a2 (val), u12 (ref), u11 (val), a1 (val), LegacyMiddleware (upval)
            -- upvalues: Enum (upval)
            local v1 = loadEnemyPack(a2, function() -- Line: 147 -- upvalues: u12 (upval)
                return u12
            end)
            if not v1 then
                return
            end
            local Children = v1:GetChildren()
            table.sort(Children, function(a1, a2) -- Line: 38
                return a1.Name < a2.Name
            end)
            local u11_2 = u11
            local u12_2 = {}

            local function u13(a1) -- Line: 75
                -- upvalues: u12_2 (val), u11_2 (val), Children (val)
                if u12_2[a1] then
                    return u12_2[a1]
                end
                local new = Random.new
                local v1 = 0
                local v2 = #a1
                for i = 1, v2 do
                    v1 = v1 + string.byte(a1, i) * i
                end
                local Name = Children[(new((v1 + u11_2) % 2147483647)):NextInteger(1, #Children)].Name
                u12_2[a1] = Name
                return Name
            end

            a1.middleware(LegacyMiddleware:Hook(Enum.HookType.OnWaveMusicCreated, LegacyMiddleware.Boundedness.Outbound, function(a1, a2, a3) -- Line: 162
                return "BrainRot", a3
            end))
            a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 172 -- upvalues: u13 (val)
                if not a2 then
                    return nil
                end
                local v1 = u13(a2.Name)
                a2.Replicator:Set("BrainRotReplacement", v1)
                local u12 = 1
                local u13_2 = nil
                a2:SetDisplayName((v1:gsub(".", function(a1) -- Line: 56 -- upvalues: u12 (ref), u13_2 (ref)
                    if u12 ~= 1 and a1 == a1:upper() and u13_2 ~= " " then
                        a1 = " " .. a1
                        u13_2 = " "
                    end
                    u12 = u12 + 1
                    u13_2 = a1
                    return a1
                end)))
                return a2
            end))
        end)
    end,
    onEnableClient = function(a1, a2, a3) -- Line: 189
        -- upvalues: ReplicatedStorage (val), LegacyMiddleware (val), hideOriginalModel (val), attachReplacement (val)
        -- upvalues: Enum (val), SoundService (val)
        local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
        local BrainRotEnemies = ReplicatedStorage.Assets:WaitForChild("BrainRotEnemies")
        local u15 = {}
        local u16 = nil
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 199
            -- upvalues: u15 (val), BrainRotEnemies (val), hideOriginalModel (upval), attachReplacement (upval)
            -- upvalues: Animation (val)
            if a2 and not u15[a2.Model] then
                local v1 = a2.Replicator:Get("BrainRotReplacement")
                local u15_2 = v1
                if u15_2 then
                    u15_2 = BrainRotEnemies:FindFirstChild(v1)
                end
                if not u15_2 then
                    return a2
                end
                u15[a2.Model] = true
                task.defer(function() -- Line: 214
                    -- upvalues: hideOriginalModel (upval), a2 (val), attachReplacement (upval), u15_2 (val)
                    -- upvalues: Animation (upval)
                    hideOriginalModel(a2.Model)
                    attachReplacement(a2, u15_2, Animation)
                end)
                return a2
            end
            return a2
        end))
        a1.middleware(LegacyMiddleware:Hook(Enum.HookType.OnEnemyHovered, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 228 -- upvalues: u16 (ref), SoundService (upval)
            if not a2.Replicator:Get("BrainRotReplacement") then
                return a2
            end
            local BrainRotSound = a2.Model:FindFirstChild("BrainRotSound", true)
            if BrainRotSound then
                if u16 and u16.IsPlaying then
                    u16:Stop()
                end
                BrainRotSound.SoundGroup = SoundService:FindFirstChild("Enemy")
                BrainRotSound:Play()
                u16 = BrainRotSound
            end
            return a2
        end))
    end,
}