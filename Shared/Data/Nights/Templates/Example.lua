-- Script path: ReplicatedStorage.Shared.Data.Nights.Templates.Example
-- Decompile time: 1.52 ms

local TweenService = game:GetService("TweenService")
local Parent = script.Parent.Parent
local Types = require(Parent.Types)
require(Parent.Timezone)
return Types({
    name = "Example",
    startsAt = DateTime.fromUniversalTime(2023, 1, 1),
    endsAt = DateTime.fromUniversalTime(2023, 12, 25),
    nights = {
        {map = "Crossroads", startsAt = DateTime.fromUniversalTime(2023, 8, 24)},
        {map = "Four Seasons", startsAt = DateTime.fromUniversalTime(2023, 8, 25)},
        {map = "Chess Board", startsAt = DateTime.fromUniversalTime(2023, 8, 26)},
        {map = "Candy Valley", startsAt = DateTime.fromUniversalTime(2023, 8, 27)},
    },
    init = function(a1) -- Line: 37
        a1.Character.Parent = nil
        a1.Model.Statue.Transparency = 0
        a1.Interaction.Enabled = false
    end,
    intro = function(a1) -- Line: 43 -- upvalues: TweenService (val)
        local v1 = TweenInfo.new(2)
        TweenService:Create(a1.Model.Lock.Tombstone, v1, {
            Position = a1.Model.Lock.Tombstone.Position - Vector3.new(0, 4, 0),
        }):Play()
        TweenService:Create(a1.Model.Lock.Lock, v1, {Position = a1.Model.Lock.Lock.Position - Vector3.new(0, 4, 0)}):Play()
        a1.Model.Lock.Tombstone.Sink:Play()
        a1.Model.Lock.Tombstone.Dirt.Enabled = true
        task.wait(v1.Time)
    end,
    unlock = function(a1) -- Line: 60
        a1.Model.Statue.Transparency = 1
        a1.Model.Statue.Break:Play()
        a1.Model.Statue.StoneParticle:Emit(50)
        a1.Model.Lock:Destroy()
        a1.Character.Parent = a1.Model
        a1.Interaction.Enabled = true
    end,
    countDown = function(a1, a2) -- Line: 70 -- types: a2: number
        local Lock = a1.Model:FindFirstChild("Lock")
        local Counter = Lock and Lock:FindFirstChild("Counter", true)
        if not Counter then
            return
        end
        Counter.Text = ("Days: %*, Hours: %*\nMinutes: %*, Seconds: %*"):format(
            math.floor(a2 / 86400),
            math.floor(a2 / 3600 % 24),
            math.floor(a2 / 60 % 60),
            (math.floor(a2 % 60))
        )
    end,
})