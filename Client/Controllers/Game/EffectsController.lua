-- Script path: ReplicatedStorage.Client.Controllers.Game.EffectsController
-- Decompile time: 25.04 ms

local Debris = game:GetService("Debris")
game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local u25 = {}
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local EmitterUtil = require(ReplicatedStorage.Shared.Modules.EmitterUtil)
require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local MapManager = require(ReplicatedStorage.Shared.Modules.MapManager)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local ParticleLODController = require(ReplicatedStorage.Client.Modules.ParticleLODController)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TransientVFX = require(ReplicatedStorage.Client.Modules.TransientVFX)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
require(ReplicatedStorage.Shared.Modules.UserPolicies)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Effects = (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")
local Game = SettingsController.Game

local function scaledEmitCount(a1, a2) -- Line: 31 -- upvalues: math (val) -- types: a1: number, a2: number
    if not (a2 <= 0) and not (a1 <= 0) then
        return math.max(1, math.round(a1 * a2))
    end
    return 0
end

local u125 = {Normal = {}, Safe = {}}

local function ensureTrashFolder() -- Line: 45
    local Trash = workspace:FindFirstChild("Trash")
    if not Trash then
        Trash = Instance.new("Folder")
        Trash.Name = "Trash"
        Trash.Parent = workspace
    end
    return Trash
end

local function acquirePuddle(a1) -- Line: 55
    -- upvalues: u125 (val), table (val), ReplicatedStorage (val)
    local v1 = table.remove(u125[if a1 ~= "Safe" then "Normal" else "Safe"])
    local Trash = workspace:FindFirstChild("Trash")
    if not Trash then
        Trash = Instance.new("Folder")
        Trash.Name = "Trash"
        Trash.Parent = workspace
    end
    if v1 then
        v1.Parent = Trash
        v1.Transparency = 0
        v1.Size = Vector3.new(0, 0, 0)
        return v1
    end
    local v2 = ReplicatedStorage.Assets.Effects.Misc[("BloodPuddle%*"):format(a1)]:Clone()
    v2.Parent = Trash
    v2.Size = Vector3.new(0, 0, 0)
    v2.Transparency = 0
    return v2
end

local function releasePuddle(a1, a2) -- Line: 74 -- upvalues: table (val), u125 (val) -- types: a2: string
    if not a1 then
        return
    end
    a1.Transparency = 1
    a1:PivotTo((CFrame.new(0, -1000, 0)))
    table.insert(u125[if a2 ~= "Safe" then "Normal" else "Safe"], a1)
end

local function _ScaleSequence(a1, a2) -- Line: 85 -- upvalues: table (val)
    local v1 = {}
    for k, v in pairs(a1.Keypoints) do
        table.insert(v1, NumberSequenceKeypoint.new(v.Time, v.Value * a2, v.Envelope * a2))
    end
    return NumberSequence.new(v1)
end

local function linearTween(a1, a2) -- Line: 97 -- upvalues: TweenService (val) -- types: a1: number, a2: function
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = 0
    NumberValue.Changed:Connect(function() -- Line: 100 -- upvalues: a2 (val), NumberValue (val)
        a2(NumberValue.Value)
    end)
    local v1 = TweenService:Create(NumberValue, TweenInfo.new(a1, Enum.EasingStyle.Linear), {Value = 1})
    v1.Completed:Connect(function() -- Line: 106 -- upvalues: NumberValue (val)
        NumberValue:Destroy()
    end)
    v1:Play()
    return v1
end

local u134 = Random.new()
local u136 = RaycastParams.new()
u136.FilterType = Enum.RaycastFilterType.Include

local function onMap(a1) -- Line: 129 -- upvalues: u136 (val)
    if not a1 then
        return
    end
    u136.FilterDescendantsInstances = {
        workspace:WaitForChild("Ground"),
        workspace:WaitForChild("Cliff"),
        workspace:WaitForChild("Boundaries"),
        (a1:WaitForChild("Environment")),
    }
end

task.spawn(function() -- Line: 147 -- upvalues: MapManager (val), onMap (val)
    MapManager.MapChanged:Connect(function(a1) -- Line: 148 -- upvalues: onMap (upval)
        onMap(a1)
    end)
    onMap(MapManager.GetLoadedMapRaw())
end)

function u25.BloodDrop(a1) end

function u25.CreateVines(a1) -- Line: 268
    -- upvalues: ReplicatedStorage (val), u134 (val), math (val), table (val), Bezier (val), TransientVFX (val)
    -- upvalues: NewTween (val), Create (val), SoundService (val), EmitterManager (val)
    local u194 = ReplicatedStorage.Assets.Effects.Misc.Vines:Clone()
    u194:PivotTo(a1.cframe)
    local Root = u194.Root
    local u14 = false
    local u20 = u134:NextNumber(-100, 100)
    local v1 = {}
    for i = 0, 5 do
        table.insert(v1, (a1.cframe * CFrame.new(0, a1.radius / 2 * math.sin(i / 5 * math.pi), -(a1.radius * 2 * i / 5))).Position)
    end
    local u67 = Bezier.new(table.unpack(v1))
    u194.Parent = workspace.CurrentCamera
    TransientVFX.track(u194, {profileName = "Vines"})
    local Children = u194.Curve:GetChildren()

    local function update(a1) -- Line: 290
        -- upvalues: u14 (ref), Children (val), u67 (val), math (upval), u20 (val)
        local v1, v2, v3, v4
        if u14 then
            return
        end
        for i, v in ipairs(Children) do
            v3 = tonumber((string.gsub(v.Name, "Vine", "")))
            v3 = v3 and v3 - 1 or v3
            v4 = a1 - 1 / (#Children - 1) * (#Children - v3 - 1)
            if v3 ~= 0 then
                v1 = math.clamp(math.noise(v4 / 100 * 50, v4 / 100 * 50, u20), -0.5, 0.5)
                v2 = (CFrame.lookAt(u67:Get(v4), u67:Get(v4 + 0.1))) * CFrame.Angles(0, math.rad(180), 0) * CFrame.Angles(math.rad(90), 0, 0) * CFrame.Angles(0, math.rad(v1 * 360), 0)
                v.WorldCFrame = v2 * CFrame.new(v1 * 2, 0, 0)
            else
                v.WorldCFrame = CFrame.new(u67:Get(v4))
            end
        end
    end

    local u91 = TweenInfo.new(a1.growthTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
    NewTween(u194, u91, function(a1) -- Line: 328 -- upvalues: update (val) -- types: a1: number
        update(a1)
    end)
    u194.Destroying:Connect(function() -- Line: 332 -- upvalues: u14 (ref)
        u14 = true
    end)

    local function reverse(a1) -- Line: 336
        -- upvalues: u91 (ref), NewTween (upval), u194 (val), update (val), Create (upval), Root (val)
        -- upvalues: SoundService (upval)
        u91 = TweenInfo.new(a1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        NewTween(u194, u91, function(a1) -- Line: 338 -- upvalues: update (upval) -- types: a1: number
            update((1 - a1) * 1.5 + -0.5)
        end)
        Create("Sound", {
            SoundId = "rbxassetid://101670539040796",
            Parent = Root,
            SoundGroup = SoundService.Towers,
        }):Play()
    end

    if a1.baseColor then
        u194.Curve.Color = a1.baseColor
    end
    if a1.material then
        u194.Curve.Material = a1.material
    end
    local v2 = NumberRange.new(math.huge)
    for k, v in pairs(u194.Curve:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            if a1.thornsColor then
                v.Color = ColorSequence.new(a1.thornsColor)
            end
            if a1.brightness and 1 < a1.brightness then
                v.LightInfluence = 0
                v.LightEmission = 1
                v.Brightness = a1.brightness
            end
            v.Lifetime = v2
        end
    end
    EmitterManager.manualEmit(u194)
    local u144 = Create("Sound", {SoundId = "rbxassetid://88077928409742", Parent = Root, SoundGroup = SoundService.Towers})
    u144:Play()
    u144.Ended:Connect(function() -- Line: 381 -- upvalues: u144 (val)
        u144:Destroy()
    end)
    local u158 = Create("Sound", {SoundId = "rbxassetid://97289088545149", Parent = Root, SoundGroup = SoundService.Towers})
    u158:Play()
    u158.Ended:Connect(function() -- Line: 390 -- upvalues: u158 (val)
        u158:Destroy()
    end)
    return u194, reverse
end

function u25.ToggleModelTransparency(a1, a2) -- Line: 397 -- upvalues: Create (val)
    local Value
    local v1 = a2
    for k, v in pairs(a1:GetDescendants()) do
        if v:IsA("BasePart") then
            Value = if not v1 then 0 else 0.5
            if not v:FindFirstChild("TransparencyTag") then
                Create("NumberValue", {Name = "TransparencyTag", Value = v.LocalTransparencyModifier, Parent = v})
            end
            if not v1 and v:FindFirstChild("TransparencyTag") then
                Value = v.TransparencyTag.Value
            end
            v.LocalTransparencyModifier = Value
        end
    end
end

local u146 = Random.new()

function u25.NewDamageIndicator(a1, a2, a3) -- Line: 422
    -- upvalues: u146 (val), Create (val), math (val), Bezier (val), linearTween (val)
    local PrimaryPart, Size
    if not a1:IsA("Model") then
        PrimaryPart = a1
        Size = a1.Size
    else
        PrimaryPart = a1.PrimaryPart
        Size = a1:GetExtentsSize()
    end
    assert(a1, "BasePart not found")
    local u27 = a3
    if not u27 then
        u27 = Color3.new(1, 0, 0)
    end
    local v1 = PrimaryPart.CFrame + (Vector3.new(
        u146:NextNumber(-Size.X / 2, Size.X / 2),
        u146:NextNumber(-Size.Y / 2, Size.Y / 2),
        (u146:NextNumber(-Size.Z / 2, Size.Z / 2))
    ))
    local v2 = v1 + Vector3.new(u146:NextInteger(-2, 2), u146:NextNumber(1, 5), (u146:NextInteger(-2, 2)))
    local v3 = v2 + Vector3.new(0, -u146:NextNumber(5, 10), 0) + (v2.Position - v1.Position).Unit * u146:NextNumber(1.5, 2)
    local u178 = Create("Attachment", {
        Name = "DamageIndicator",
        WorldCFrame = v1,
        Parent = workspace.Terrain,
        (Create("BillboardGui", {
            Name = "Display",
            AlwaysOnTop = true,
            LightInfluence = 0,
            Size = UDim2.new(1, 0, 1, 0),
            [2] = Create("TextLabel", {
                Name = "Damage",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = tostring((math.round(a2 * 1000)) / 1000),
                TextColor3 = Color3.fromRGB(255, 0, 0),
                TextScaled = true,
                Create("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0)}),
                (Create("UIScale", {Scale = 1})),
            }),
        })),
    })
    local u184 = Bezier.new(v1.Position, v2.Position, v3.Position)
    linearTween(1, function(a1) -- Line: 495 -- upvalues: u184 (val), u178 (val), u27 (val), math (upval)
        u178.WorldCFrame = CFrame.new((u184:Get(a1)))
        if u178:FindFirstChild("Display") then
            u178.Display.Damage.UIScale.Scale = 1 - a1
            u178.Display.Damage.TextColor3 = u27:Lerp(Color3.new(1, 1, 1), (math.min(1, a1 + 0.2)))
        end
    end)
    task.delay(1, function() -- Line: 505 -- upvalues: u178 (val)
        u178:Destroy()
    end)
end

function u25.IndicateDamage(a1, a2) -- Line: 510
    -- upvalues: TweenService (val), TimescaleUtilities (val), Create (val), Bezier (val)
    local u3 = Random.new()

    local function fade(a1, a2, a3) -- Line: 513
        -- upvalues: TweenService (upval), TimescaleUtilities (upval)
        local v1 = if not a1 then {TextTransparency = 1, TextStrokeTransparency = 1} else {TextTransparency = 0, TextStrokeTransparency = 0.8}
        TweenService:Create(a2, TweenInfo.new(a3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), v1):Play()
        if not a1 then
            TimescaleUtilities.Delay(a3, function() -- Line: 523 -- upvalues: a2 (val)
                a2:Destroy()
            end)
        end
    end

    local function count(a1, a2, a3) -- Line: 529 -- upvalues: Create (upval), TweenService (upval)
        local u6 = Create("NumberValue", {Value = 0})
        ;(u6:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 531 -- upvalues: a3 (val), u6 (val)
            a3(u6.Value)
        end)
        TweenService:Create(u6, TweenInfo.new(a2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Value = tonumber(a1)}):Play()
        task.delay(a2 + 0.1, function() -- Line: 540 -- upvalues: u6 (val)
            u6:Destroy()
        end)
    end

    local function getBezierPoints() -- Line: 545 -- upvalues: u3 (val), a1 (val)
        local v1 = u3:NextNumber(-4, 4)
        local v2 = u3:NextNumber(-4, 4)
        local Position = a1.Position
        local v3 = Position + Vector3.new(v1, u3:NextNumber(2, 5), v2)
        return Position, v3, v3 + Vector3.new(v1 * u3:NextNumber(-1, 1.3), -6, v2 * (u3:NextNumber(-1, 1.3)))
    end

    local u16 = Create("BillboardGui", {
        AlwaysOnTop = true,
        LightInfluence = 0,
        Size = UDim2.new(2, 0, 2, 0),
        Adornee = a1,
        Parent = a1,
    })
    local u31 = Create("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        TextTransparency = 1,
        TextStrokeTransparency = 1,
        Font = Enum.Font.SourceSansSemibold,
        TextColor3 = Color3.fromRGB(255, 35, 35),
        TextStrokeColor3 = Color3.fromRGB(249, 0, 0),
        Parent = u16,
    })
    fade(true, u31, 0.4)
    count(a2, 1, function(a1) -- Line: 582 -- upvalues: u31 (val)
        u31.Text = a1
    end)
    local u46 = u3:NextNumber(0.02, 0.05)
    local u47 = false
    Bezier:bezierV3(getBezierPoints(), u46, function(a1, a2) -- Line: 589 -- upvalues: u16 (val), u47 (ref), u46 (val), fade (val), u31 (val)
        u16.StudsOffset = u16.StudsOffset:Lerp(a1, 0.75)
        if not u47 and 0.6 <= 1 - u46 then
            u47 = true
            fade(false, u31, 0.5)
        end
    end)
end

function u25.Impale(a1, a2, a3) -- Line: 599 -- upvalues: table (val), TransientVFX (val), TimescaleUtilities (val)
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Include
    local v2 = {a2}
    v1.FilterDescendantsInstances = v2
    if a2:IsA("Model") then
        v2 = {}
        for i, v in ipairs(a2:GetChildren()) do
            if v:IsA("BasePart") and v.Transparency < 1 then
                table.insert(v2, v)
            end
        end
        v1.FilterDescendantsInstances = v2
    end
    local Position = if not a2:IsA("Model") then a2.Position else a2:FindFirstChild("Torso") and a2.Torso.Position or a2:GetPivot().Position or a2.Position
    local v3 = workspace:Raycast(a1, (Position - a1) * 1.2, v1)
    if not v3 then
        return
    end
    local u84 = a3:Clone()
    if not v3 then
        u84:PivotTo((CFrame.lookAt(Position, a1)))
    else
        u84:PivotTo((CFrame.lookAt(v3.Position, a1)))
    end
    if not u84:IsA("BasePart") then
        for i2, i3 in ipairs(u84:GetDescendants()) do
            if i3:IsA("BasePart") then
                i3.Anchored = true
                i3.CanCollide = false
            end
        end
    else
        u84.Anchored = true
        u84.CanCollide = false
    end
    u84.Parent = workspace.Trash
    TransientVFX.track(u84, {profileName = "Impale"})
    local u137 = a2.Destroying:Once(function() -- Line: 645 -- upvalues: u84 (val)
        u84:Destroy()
    end)
    TimescaleUtilities.Delay(20, function() -- Line: 649 -- upvalues: u137 (val), u84 (val)
        u137:Disconnect()
        u84:Destroy()
    end)
    return u84
end

function u25.Explosion(a1) -- Line: 657
    -- upvalues: Game (val), u25 (val), Create (val), TransientVFX (val), TimescaleUtilities (val), SoundService (val)
    local v1 = Game:Get("HQ Explosions")
    local v2 = a1.Radius or 6
    local Position = a1.Position
    local v3 = a1.Sound or 2814354338
    if not v1 then
        local v4 = Create("Part", {
            Anchored = true,
            CastShadow = false,
            CanCollide = false,
            CanTouch = false,
            CanQuery = false,
            Transparency = 0.8,
            BrickColor = BrickColor.new("Bright orange"),
            Material = Enum.Material.Neon,
            Shape = Enum.PartType.Ball,
            Size = Vector3.new(1, 1, 1) * v2 * 2,
            Position = Position,
            Parent = workspace.CurrentCamera,
        })
        TransientVFX.track(v4, {ttl = 0.2, profileName = "ExplosionLow"})
        TimescaleUtilities.CleanUp(v4, 0.2)
    elseif not (v2 < 5) then
        u25.BigExplosion(Position, v2)
        v3 = v3 or 1452071798
    else
        u25.SmallExplosion(Position, v2)
    end
    local u54 = Create("Attachment", {Parent = workspace.Terrain, Position = a1.Position})
    if not a1.ignoreSound then
        local v5 = Create("Sound", {SoundGroup = SoundService.Towers, Parent = u54, SoundId = "rbxassetid://" .. v3})
        v5:Play()
        v5.Ended:Connect(function() -- Line: 703 -- upvalues: u54 (val)
            u54:Destroy()
        end)
    end
end

function u25.HolyExplosion(a1) -- Line: 709 -- upvalues: EmitterManager (val), Create (val), SoundService (val)
    local v1 = a1.Radius or 6
    EmitterManager.Emit("HolyClapback", CFrame.new(a1.Position), v1)
    local u18 = Create("Attachment", {Parent = workspace.Terrain, Position = a1.Position})
    if not a1.ignoreSound then
        local v2 = Create("Sound", {
            SoundId = "rbxassetid://76537715852614",
            Volume = 2.5,
            SoundGroup = SoundService.Towers,
            Parent = u18,
        })
        v2:Play()
        v2.Ended:Connect(function() -- Line: 728 -- upvalues: u18 (val)
            u18:Destroy()
        end)
    end
end

local u152 = {}
local u153 = {}

local function addRenderStepCallback(a1, a2) -- Line: 740 -- upvalues: u152 (val) -- types: a1: string, a2: function
    u152[a2] = a1
end

local function removeRenderStepCallback(a1) -- Line: 744 -- upvalues: u152 (val) -- types: a1: function?
    if a1 then
        u152[a1] = nil
    end
end

local function queueEffectPartMove(a1, a2) -- Line: 750 -- upvalues: u153 (val) -- types: a1: userdata, a2: userdata
    u153[a1] = a2
end

local function clearEffectPartMove(a1) -- Line: 754 -- upvalues: u153 (val) -- types: a1: userdata?
    if a1 then
        u153[a1] = nil
    end
end

local function flushEffectPartMoves() -- Line: 760 -- upvalues: u153 (val), table (val)
    debug.profilebegin("Effect_RenderFlushMoves")
    local v1 = 0
    for i in u153 do
        v1 = v1 + 1
    end
    if v1 == 0 then
        debug.profileend()
        return
    end
    debug.profilebegin("Effect_RenderBuildMoves")
    local u22 = table.create(v1)
    local u26 = table.create(v1)
    local v2 = 1
    for j, k in u153 do
        u22[v2] = j
        u26[v2] = k
        v2 = v2 + 1
    end
    table.clear(u153)
    debug.profileend()
    debug.profilebegin("Effect_RenderBulkMoveTo")
    local success, result = xpcall(function() -- Line: 788 -- upvalues: u22 (val), u26 (val)
        workspace:BulkMoveTo(u22, u26, Enum.BulkMoveMode.FireCFrameChanged)
    end, debug.traceback)
    debug.profileend()
    debug.profileend()
    if not success then
        error(result, 0)
    end
end

local function runRenderStepCallbacks(a1) -- Line: 799 -- upvalues: u152 (val) -- types: a1: number
    local result, success
    for i, j in u152 do
        debug.profilebegin((("Effect_Render_%*"):format(j)))
        success, result = xpcall(i, debug.traceback, a1)
        debug.profileend()
        if not success then
            error(result, 0)
        end
    end
end

Scheduler.add("Effect_Render", RunService.RenderStepped, function(a1) -- Line: 811 -- upvalues: runRenderStepCallbacks (val), flushEffectPartMoves (val)
    debug.profilebegin("Effect_RenderCallbacks")
    local success, result = xpcall(runRenderStepCallbacks, debug.traceback, a1)
    debug.profileend()
    if not success then
        error(result, 0)
    end
    flushEffectPartMoves()
end)

function u25.Cash(a1, a2, a3) -- Line: 823
    -- upvalues: ParticleLODController (val), Effects (val), TransientVFX (val), math (val), Bezier (val), u153 (val)
    -- upvalues: Debris (val), u152 (val)
    local u177
    local u176 = ParticleLODController.getOneShotMultiplier(a1)
    if u176 <= 0 then
        return
    end
    if not a3 then
        u177 = Effects.Client.Cash:Clone()
    else
        u177 = a3:Clone()
        if not u177 then
            u177 = Effects.Client.Cash:Clone()
        end
    end
    if u177:GetAttribute("Transparency") then
        u177.Transparency = u177:GetAttribute("Transparency")
    end
    for i, j in u177:GetDescendants() do
        if j:IsA("ParticleEmitter") and j:HasTag("CashEffect") then
            j.Enabled = true
        end
        if j:IsA("Trail") then
            j.Enabled = true
        end
    end
    u177.CFrame = CFrame.new(a1, a2)
    u177.Parent = workspace.CurrentCamera
    TransientVFX.track(u177, {profileName = "Cash"})
    local v1 = Random.new():NextNumber(-90, 90)
    local Magnitude = (a1 - a2).Magnitude
    Random.new():NextNumber(0.5, 2)
    if not (0.5 < Random.new():NextNumber()) then end
    local v2 = (CFrame.new(a1, a2)) * CFrame.Angles(0, math.rad(v1), 0) * CFrame.new(0, 2, -Magnitude / 2 * Random.new():NextNumber(0.8, 1.2))
    local v3 = 360 * Random.new():NextNumber(0.8, 1.5)
    Random.new():NextNumber(0.02, 0.05)
    local u130 = Bezier.new(a1, v2.p, a2)
    local Length = u130:GetLength(0.01)
    local u143 = 360 * Random.new():NextNumber(0.8, 1.5)
    task.spawn(function() -- Line: 882
        -- upvalues: Length (val), u177 (val), u153 (upval), u176 (val), math (upval), Debris (upval), u152 (upval)
        -- upvalues: u130 (val), u143 (val)
        local u2
        local u0 = 0

        function u2(a1) -- Line: 886
            -- upvalues: u0 (ref), Length (upval), u177 (upval), u153 (upval), u176 (upval), math (upval)
            -- upvalues: Debris (upval), u2 (ref), u152 (upval), u130 (upval), u143 (upval)
            local v1, v2, v3
            u0 = u0 + a1
            local v4 = u0 * 140 / Length
            if not (v4 > 1) and u177.Parent then
                debug.profilebegin("Effect_CashMove")
                v1 = u130:Get(v4)
                v2 = u177
                v3 = (CFrame.new(v1)) * CFrame.Angles(0, math.rad(u143 * u0), 0)
                u153[v2] = v3
                debug.profileend()
                return
            end
            debug.profilebegin("Effect_CashFinish")
            v1 = u177
            if v1 then
                u153[v1] = nil
            end
            u177.Transparency = 1
            if u177:FindFirstChild("Collect") then
                debug.profilebegin("Effect_CashCollectSound")
                u177.Collect.PlaybackSpeed = Random.new():NextNumber(0.8, 1.25)
                u177.Collect:Play()
                debug.profileend()
            end
            if u177:FindFirstChild("Center") and u177.Center:FindFirstChild("Sparks") then
                debug.profilebegin("Effect_CashSparksEmit")
                v2 = tonumber((u177.Center.Sparks:GetAttribute("EmitCount"))) or Random.new():NextInteger(6, 12)
                v3 = u176
                v1 = if v3 <= 0 then 0 else if not (v2 <= 0) then math.max(1, math.round(v2 * v3)) else 0
                if v1 > 0 then
                    u177.Center.Sparks:Emit(v1)
                end
                debug.profileend()
            end
            debug.profilebegin("Effect_CashDisableDescendants")
            for i, j in u177:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = false
                end
                if j:IsA("BasePart") then
                    j.Transparency = 1
                end
            end
            debug.profileend()
            Debris:AddItem(u177, 1)
            v1 = u2
            if v1 then
                u152[v1] = nil
            end
            debug.profileend()
        end

        local v1 = u2
        u152[v1] = "Cash"
    end)
end

function u25.IceExplosion(a1) -- Line: 947
    -- upvalues: ParticleLODController (val), Effects (val), TransientVFX (val), scaledEmitCount (val), math (val)
    -- upvalues: Debris (val)
    local v1 = ParticleLODController.getOneShotMultiplier(a1.Position)
    if v1 <= 0 then
        return
    end
    local v2 = Effects.Misc.FreezeExp:Clone()
    v2.Parent = workspace.Terrain
    v2.CFrame = CFrame.new(a1.Position)
    TransientVFX.track(v2, {ttl = 2, profileName = "IceExplosion"})
    v2.Effect.Effect:Emit((scaledEmitCount(math.random(1, 4), v1)))
    v2.Effect.Shards:Emit((scaledEmitCount(25, v1)))
    v2.Effect.Wave:Emit((scaledEmitCount(1, v1)))
    if a1.Sound ~= "" then
        local Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://" .. a1.Sound
        Sound.PlayOnRemove = true
        Sound.Parent = v2
        Sound:Destroy()
    end
    Debris:AddItem(v2, 2)
end

function u25.Projectile(a1) -- Line: 973 -- upvalues: TransientVFX (val)
    task.spawn(function() -- Line: 974 -- upvalues: a1 (val), TransientVFX (upval)
        local v1 = a1.Projectile:Clone()
        v1.Parent = workspace.CurrentCamera
        v1.CFrame = a1.Start
        local Duration_2 = if typeof(a1.Duration) ~= "number" then if typeof(a1.Decay) ~= "number" then 5 else a1.Decay else a1.Duration
        debug.profilebegin("VFX_EffectsProjectileTTL")
        TransientVFX.track(v1, {profileName = "EffectsProjectile", ttl = Duration_2})
        debug.profileend()
    end)
end

function u25.Tix(a1) -- Line: 990
    -- upvalues: ParticleLODController (val), ReplicatedStorage (val), TransientVFX (val), scaledEmitCount (val)
    -- upvalues: TimescaleUtilities (val)
    local v1 = ParticleLODController.getOneShotMultiplier(a1.Position)
    if v1 <= 0 then
        return
    end
    local u13 = ReplicatedStorage.Assets.Effects.Particles.TixVFX:Clone()
    u13:PivotTo(a1)
    u13.Parent = workspace
    TransientVFX.track(u13, {ttl = 8, profileName = "Tix"})
    u13.EmitPoint.Sparks:Emit((scaledEmitCount(50, v1)))
    u13.EmitPoint.Star:Emit((scaledEmitCount(2, v1)))
    u13.Pickup:Play()
    for i, j in u13:GetChildren() do
        if j:IsA("ParticleEmitter") then
            j.Enabled = true
            TimescaleUtilities.Delay(1.25, function() -- Line: 1010 -- upvalues: j (val)
                j.Enabled = false
            end)
        end
    end
    TimescaleUtilities.Delay(8, function() -- Line: 1016 -- upvalues: u13 (val)
        u13:Destroy()
    end)
end

function u25.StunRaidus(a1, a2) -- Line: 1021
    -- upvalues: ReplicatedStorage (val), TransientVFX (val), TweenService (val), TimescaleUtilities (val)
    local u10 = ReplicatedStorage.Assets.Effects.Particles.GroundSmash.Shock:Clone()
    u10.Parent = workspace.Terrain
    u10:PivotTo(a1)
    TransientVFX.track(u10, {ttl = 2, profileName = "StunRadius"})
    TweenService:Create(
        u10.Mesh,
        TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {Scale = Vector3.new(a2 * 1.8, 3, a2 * 1.8)}
    ):Play()
    TweenService:Create(u10.Decal, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Transparency = 1}):Play()
    TimescaleUtilities.Delay(2, function() -- Line: 1040 -- upvalues: u10 (val)
        u10:Destroy()
    end)
end

function u25.GroundSmash(a1, a2, a3) -- Line: 1045
    -- upvalues: ParticleLODController (val), ReplicatedStorage (val), EmitterUtil (val), TransientVFX (val)
    -- upvalues: EmitterManager (val), TweenService (val), TimescaleUtilities (val)
    local v1, v2
    if (ParticleLODController.getOneShotMultiplier(a1.Position)) <= 0 then
        return
    end
    local u15 = ReplicatedStorage.Assets.Effects.Particles.GroundSmash:Clone()
    local v3 = (a2 or 1) * (a3 or 1)
    for i, j in u15:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            v1 = EmitterUtil
            v2 = v3 / 20
            v1:scaleEmitter(j, v2, true)
        end
    end
    u15.Parent = workspace.Terrain
    u15:PivotTo(a1)
    TransientVFX.track(u15, {ttl = 7, profileName = "GroundSmash"})
    EmitterManager.manualEmit(u15)
    u15.GroundCrackMesh.Size = Vector3.new(0, 0, 0)
    u15.RockMesh.Size = Vector3.new(2, 1.628999948501587, 2)
    local RockMesh = u15.RockMesh
    RockMesh.CFrame = RockMesh.CFrame * CFrame.new(0, -1, 0)
    TweenService:Create(u15.RockMesh, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Size = Vector3.new(v3 * 0.3, 2, v3 * 0.3 + 3),
        CFrame = u15.RockMesh.CFrame * CFrame.new(0, 1, 0),
    }):Play()
    TweenService:Create(
        u15.GroundCrackMesh,
        TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {Size = Vector3.new(v3 * 0.3, 0.431, v3 * 0.3)}
    ):Play()
    TweenService:Create(
        u15.Shock.Mesh,
        TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {Scale = Vector3.new(v3 * 1.8, 3, v3 * 1.8)}
    ):Play()
    TweenService:Create(u15.Shock.Decal, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Transparency = 1}):Play()
    TimescaleUtilities.Delay(2, function() -- Line: 1098 -- upvalues: u15 (val), TweenService (upval), TimescaleUtilities (upval)
        local v1 = u15.GroundCrackMesh.Size * 0.9
        TweenService:Create(
            u15.GroundCrackMesh,
            TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Transparency = 1, Size = Vector3.new(v1.X, 0, v1.Z)}
        ):Play()
        TweenService:Create(
            u15.RockMesh,
            TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {
                Transparency = 1,
                CFrame = u15.RockMesh.CFrame * CFrame.new(0, -1, 0),
            }
        ):Play()
        TimescaleUtilities.Wait(4)
        u15:Destroy()
    end)
end

function u25.Radius(a1, a2, a3) -- Line: 1119
    -- upvalues: ParticleLODController (val), ReplicatedStorage (val), EmitterUtil (val), TransientVFX (val)
    -- upvalues: EmitterManager (val), TweenService (val), TimescaleUtilities (val)
    local v1, v2
    if (ParticleLODController.getOneShotMultiplier(a1.Position)) <= 0 then
        return
    end
    local u15 = ReplicatedStorage.Assets.Effects.Particles.GroundSmash:Clone()
    u15.RockMesh:Destroy()
    u15.GroundCrackMesh:Destroy()
    local v3 = (a2 or 1) * (a3 or 1)
    for i, j in u15:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            v1 = EmitterUtil
            v2 = v3 / 20
            v1:scaleEmitter(j, v2, true)
        end
    end
    u15.Parent = workspace.Terrain
    u15:PivotTo(a1)
    TransientVFX.track(u15, {ttl = 7, profileName = "Radius"})
    EmitterManager.manualEmit(u15)
    TweenService:Create(
        u15.Shock.Mesh,
        TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {Scale = Vector3.new(v3 * 1.8, 3, v3 * 1.8)}
    ):Play()
    TweenService:Create(u15.Shock.Decal, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Transparency = 1}):Play()
    TimescaleUtilities.Delay(2, function() -- Line: 1155 -- upvalues: TimescaleUtilities (upval), u15 (val)
        TimescaleUtilities.Wait(4)
        u15:Destroy()
    end)
end

function u25.SmallExplosion(a1, a2) -- Line: 1161 -- upvalues: EmitterManager (val) -- types: a1: vector, a2: number?
    EmitterManager.Emit("SmallExplosion", CFrame.new(a1), a2 or 6)
end

function u25.BigExplosion(a1, a2) -- Line: 1166
    -- upvalues: EmitterManager (val), ParticleLODController (val), math (val), ReplicatedStorage (val)
    -- upvalues: TransientVFX (val), ItemDrop (val), TimescaleUtilities (val)
    local v1, v2, v3
    local v4 = a2 or 8
    EmitterManager.Emit("BigExplosion", CFrame.new(a1), v4)
    local v5 = ParticleLODController.getOneShotMultiplier(a1)
    if v5 <= 0 then
        return
    end
    local v6 = Random.new()
    local v7 = v6:NextInteger(2, 4)
    for i = 1, if v5 <= 0 then 0 else if not (v7 <= 0) then math.max(1, math.round(v7 * v5)) else 0 do
        local u49 = ReplicatedStorage.Assets.Effects.Particles.ExplosionTrail:Clone()
        u49.Parent = workspace.Terrain
        TransientVFX.track(u49, {ttl = 8, profileName = "ExplosionTrail"})
        v3 = v4 * 1.2
        v1 = v4 * 1.8
        v2 = {
            dtMultiplier = 5,
            gravity = -2,
            start = CFrame.new(a1 + Vector3.new(0, v4 / 2, 0)),
            goal = (CFrame.new(a1)) * CFrame.Angles(0, v6:NextNumber(0, 2 * math.pi), 0) * CFrame.new(0, v4 * v6:NextNumber(0.25, 0.5), -v6:NextNumber(v3, v1)),
            velocity = v6:NextNumber(v4 * 0.3, v4 * 0.5),
        }
        ;(ItemDrop.Drop(v2.start, v2.goal, u49, v2.dtMultiplier, v2.gravity, v2.velocity, function() -- Line: 1204
            return CFrame.Angles(0, 0, 0)
        end)):andThen(function() -- Line: 1207 -- upvalues: u49 (val), TimescaleUtilities (upval)
            u49.Center.Smoke2.Enabled = false
            u49.Flames2.Enabled = false
            TimescaleUtilities.Delay(2.5, function() -- Line: 1210 -- upvalues: u49 (upval)
                u49:Destroy()
            end)
        end)
    end
end

return u25