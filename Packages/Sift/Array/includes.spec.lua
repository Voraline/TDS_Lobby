-- Script path: ReplicatedStorage.Packages.Sift.Array.includes.spec
-- Decompile time: 0.26 ms

return function() -- Line: 1
    local includes = require(script.Parent.includes)
    it("should return true if the given array includes the given value", function() -- Line: 4 -- upvalues: includes (val)
        local v1 = includes({1, 2, 3}, 2)
        expect(v1).to.equal(true)
    end)
end