-- Script path: ReplicatedStorage.Packages.Sift.Array.sort.spec
-- Decompile time: 0.84 ms

return function() -- Line: 1
    local sort = require(script.Parent.sort)
    it("should sort the given array", function() -- Line: 4 -- upvalues: sort (val)
        local v1 = sort({1, 2, 3}, function(a1, a2) -- Line: 7
            return a1 < a2
        end)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
    end)
    it("should sort the given array with a custom compare function", function() -- Line: 18 -- upvalues: sort (val)
        local v1 = sort({1, 2, 3}, function(a1, a2) -- Line: 21
            return a2 < a1
        end)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(3)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(1)
    end)
    it("should not modify the original array", function() -- Line: 32 -- upvalues: sort (val)
        local v1 = {1, 2, 3}
        sort(v1, function(a1, a2) -- Line: 35
            return a2 < a1
        end)
        expect(v1).to.be.a("table")
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
    end)
end