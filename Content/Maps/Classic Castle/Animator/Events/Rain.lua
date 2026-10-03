-- Script path: ReplicatedStorage.Content.Maps.Classic Castle.Animator.Events.Rain
-- Decompile time: 0.17 ms

local u0 = {}

function u0.start(a1) -- Line: 5 -- upvalues: u0 (val)
    u0.map.Rain.Effect.Enabled = true
end

function u0.rewind(a1) -- Line: 9 -- upvalues: u0 (val)
    u0.map.Rain.Effect.Enabled = false
end

return u0