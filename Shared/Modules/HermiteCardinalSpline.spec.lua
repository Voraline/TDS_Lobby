-- Script path: ReplicatedStorage.Shared.Modules.HermiteCardinalSpline.spec
-- Decompile time: 0.23 ms

return function() -- Line: 1
    local HermiteCardinalSpline = require(script.Parent.HermiteCardinalSpline)
    it("Should not be in debug mode", function() -- Line: 4 -- upvalues: HermiteCardinalSpline (val)
        expect(HermiteCardinalSpline.DEBUG).to.equal(false)
    end)
end