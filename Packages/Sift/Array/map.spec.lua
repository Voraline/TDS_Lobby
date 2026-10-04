-- Script path: ReplicatedStorage.Packages.Sift.Array.map.spec
-- Decompile time: 0.62 ms

return function() -- Line: 1
    local map = require(script.Parent.map)
    it("should return an array where values are the result of the mapper function", function() -- Line: 4 -- upvalues: map (val)
        local v1 = map({1, 2, 3}, function(a1) -- Line: 5
            return a1 * 2
        end)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(2)
        expect(v1[2]).to.equal(4)
        expect(v1[3]).to.equal(6)
    end)
    it("should not modify the original array", function() -- Line: 17 -- upvalues: map (val)
        local v1 = {1, 2, 3}
        map(v1, function(a1) -- Line: 20
            return a1 * 2
        end)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
    end)
end