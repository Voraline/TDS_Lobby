-- Script path: ReplicatedStorage.Content.Tower.Gatling Gun.Animator.CameraSpring
-- Decompile time: 0.84 ms

return {
    new = function(a1, a2, a3, a4, a5) -- Line: 5
        return {
            Target = Vector3.new(),
            Position = Vector3.new(),
            Velocity = Vector3.new(),
            Mass = a2 or 5,
            Force = a3 or 50,
            Damping = a4 or 4,
            Speed = a5 or 4,
            shove = function(a1, a2) -- Line: 17
                local X = a2.X
                local Y = a2.Y
                local Z = a2.Z
                if X ~= X or X == (1 / 0) or X == (-1 / 0) then
                    X = 0
                end
                if Y ~= Y or Y == (1 / 0) or Y == (-1 / 0) then
                    Y = 0
                end
                if Z ~= Z or Z == (1 / 0) or Z == (-1 / 0) then
                    Z = 0
                end
                a1.Velocity = a1.Velocity + Vector3.new(X, Y, Z)
            end,
            update = function(a1, a2) -- Line: 31
                local v1 = math.min(math.min(a2, 0.3) * a1.Speed / 8, 0.3)
                for i = 1, 8 do
                    a1.Velocity = a1.Velocity + ((a1.Target - a1.Position) * a1.Force / a1.Mass - a1.Velocity * a1.Damping) * v1
                    a1.Position = a1.Position + a1.Velocity * v1
                end
                return a1.Position
            end,
        }
    end,
}