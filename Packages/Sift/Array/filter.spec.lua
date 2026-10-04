-- Script path: ReplicatedStorage.Packages.Sift.Array.filter.spec
-- Decompile time: 0.54 ms

return function() -- Line: 1
    local filter = require(script.Parent.filter)
    it("should return a copy of the given array with only the elements that match the predicate", function() -- Line: 6 -- upvalues: filter (val)
        local v1 = {1, 2, 3}
        local v2 = filter(v1, function(a1) -- Line: 9
            return a1 % 2 == 0
        end)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(#v2).to.equal(1)
        expect(v2[1]).to.equal(2)
    end)
    it("should not modify the original array", function() -- Line: 21 -- upvalues: filter (val)
        local v1 = {1, 2, 3}
        local v2 = filter(v1, function(a1) -- Line: 24
            return a1 % 2 == 0
        end)
        expect(v2).never.to.equal(v1)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
        expect(v2[1]).to.equal(2)
    end)
end