-- Script path: ReplicatedStorage.Content.NewEnemies.Null Guardian Clone.Animator.NullGuardianAnimatorStates
-- Decompile time: 0.33 ms

return {
    {
        name = "Walk",
        onEnter = function(a1) -- Line: 4
            a1.animations.WalkAnimation:Play()
        end,
    },
    {
        name = "Death",
        onEnter = function(a1) -- Line: 10
            if not a1._isDead then
                a1.animations.Death:Play()
                a1._isDead = true
                if a1._nullBubbleEffect then
                    a1._nullBubbleEffect:Destroy()
                end
            end
        end,
    },
}