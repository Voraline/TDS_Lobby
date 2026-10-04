-- Script path: ReplicatedStorage.Client.Controllers.Lobby.DuckRewardsController
-- Decompile time: 10.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local Flags = Cache("Flags")
local u27 = Cache("Inventory.Troops")

local function timeLeft(a1) -- Line: 13 -- types: a1: number
    local v1 = math.max(0, a1 + 230400 - (os.time()))
    if v1 > 86400 then
        return (math.ceil(v1 / 86400)) .. " days"
    end
    if v1 > 3600 then
        return (math.ceil(v1 / 3600)) .. " hours"
    end
    return (math.ceil(v1 / 60)) .. " minutes"
end

local function updateText(a1, a2) -- Line: 25 -- types: a2: number?
    a1.Enabled = true
    if not a2 then
        a1.Status.TextLabel.Visible = false
        a1.Status.Banner.Visible = false
        a1.Status.TextLabel.Text = ""
        return
    end
    a1.Status.TextLabel.Visible = true
    a1.Status.Banner.Visible = true
    local TextLabel = a1.Status.TextLabel
    local v1 = math.max(0, a2 + 230400 - (os.time()))
    local v2 = if v1 > 86400 then (math.ceil(v1 / 86400)) .. " days" else if not (v1 > 3600) then (math.ceil(v1 / 60)) .. " minutes" else (math.ceil(v1 / 3600)) .. " hours"
    TextLabel.Text = v2
end

local function toggle(a1, a2) -- Line: 39 -- types: a1: userdata, a2: boolean
    local Highlight = a1:FindFirstChildOfClass("Highlight")
    if Highlight then
        Highlight.Enabled = not a2
    end
    a1:SetAttribute("Enabled", a2)
    if a1.PrimaryPart then
        a1.PrimaryPart.Prompt.Enabled = not a2
    end
    for i, j in a1:GetDescendants() do
        if j:IsA("Beam") or j:IsA("ParticleEmitter") or j:IsA("BillboardGui") or j:IsA("SurfaceGui") then
            j.Enabled = a2
        end
    end
end

local function update() -- Line: 63 -- upvalues: Flags (val), u27 (val), toggle (val)
    local v1, v2
    local Value = Flags:GetValue() or {}
    local Value_2 = u27:GetValue() or {}
    local Model = (workspace:WaitForChild("DuckRewards")):WaitForChild("Model")
    local Timers = Model:WaitForChild("Timers")
    local v3 = {Model:WaitForChild("First"), Model:WaitForChild("Second"), (Model:WaitForChild("Third"))}
    local FirstDuckHuntWin = Value.FirstDuckHuntWin
    local SecondDuckHuntWin = Value.SecondDuckHuntWin
    toggle(v3[2], false)
    toggle(v3[3], false)
    local Lock = Timers.Second.Lock
    Lock.Enabled = true
    Lock.Status.TextLabel.Visible = false
    Lock.Status.Banner.Visible = false
    Lock.Status.TextLabel.Text = ""
    local Lock_2 = Timers.Third.Lock
    Lock_2.Enabled = true
    Lock_2.Status.TextLabel.Visible = false
    Lock_2.Status.Banner.Visible = false
    Lock_2.Status.TextLabel.Text = ""
    v3[1].PrimaryPart.Prompt.Enabled = not Value_2.Biologist and FirstDuckHuntWin == nil
    if FirstDuckHuntWin then
        if not (os.time() - FirstDuckHuntWin < 230400) then
            Timers.Second.Lock.Enabled = false
            toggle(v3[2], true)
        else
            local Lock_3 = Timers.Second.Lock
            Lock_3.Enabled = true
            if not FirstDuckHuntWin then
                Lock_3.Status.TextLabel.Visible = false
                Lock_3.Status.Banner.Visible = false
                Lock_3.Status.TextLabel.Text = ""
            else
                Lock_3.Status.TextLabel.Visible = true
                Lock_3.Status.Banner.Visible = true
                local TextLabel = Lock_3.Status.TextLabel
                v1 = math.max(0, FirstDuckHuntWin + 230400 - (os.time()))
                v2 = if v1 > 86400 then (math.ceil(v1 / 86400)) .. " days" else if not (v1 > 3600) then (math.ceil(v1 / 60)) .. " minutes" else (math.ceil(v1 / 3600)) .. " hours"
                TextLabel.Text = v2
            end
        end
    end
    if SecondDuckHuntWin then
        if os.time() - SecondDuckHuntWin < 230400 then
            local Lock_4 = Timers.Third.Lock
            Lock_4.Enabled = true
            if not SecondDuckHuntWin then
                Lock_4.Status.TextLabel.Visible = false
                Lock_4.Status.Banner.Visible = false
                Lock_4.Status.TextLabel.Text = ""
                return
            end
            Lock_4.Status.TextLabel.Visible = true
            Lock_4.Status.Banner.Visible = true
            local TextLabel_2 = Lock_4.Status.TextLabel
            v1 = math.max(0, SecondDuckHuntWin + 230400 - (os.time()))
            v2 = if v1 > 86400 then (math.ceil(v1 / 86400)) .. " days" else if not (v1 > 3600) then (math.ceil(v1 / 60)) .. " minutes" else (math.ceil(v1 / 3600)) .. " hours"
            TextLabel_2.Text = v2
            return
        end
        Timers.Third.Lock.Enabled = false
        toggle(v3[3], true)
    end
end

task.spawn(function() -- Line: 105 -- upvalues: ViewController (val), NewNetwork (val), Flags (val), update (val), u27 (val)
    local Prompt
    local Model = (workspace:WaitForChild("DuckRewards")):WaitForChild("Model")
    local Timers = Model:WaitForChild("Timers")
    for i, j in {Model:WaitForChild("First"), Model:WaitForChild("Second"), (Model:WaitForChild("Third"))} do
        Prompt = j.PrimaryPart.Prompt
        local Lock = Timers:WaitForChild(j.Name):WaitForChild("Lock")
        Prompt.PromptShown:Connect(function() -- Line: 120 -- upvalues: Lock (val)
            Lock.Status.Visible = false
        end)
        Prompt.PromptHidden:Connect(function() -- Line: 124 -- upvalues: Lock (val)
            Lock.Status.Visible = true
        end)
        Prompt.Triggered:Connect(function() -- Line: 128 -- upvalues: i (val), ViewController (upval), NewNetwork (upval)
            if i ~= 1 then
                (NewNetwork.Channel("DuckRewards")):fireServer("Purchase", i)
                return
            end
            ;(ViewController:getEmitter("Shop")):Emit("Select", "Gamepasses")
            ViewController:setView("Shop")
        end)
    end
    Flags.Updated:Connect(update)
    u27.Updated:Connect(update)
    ;(Flags:Get()):andThen(update)
    ;(u27:Get()):andThen(update)
end)
return nil