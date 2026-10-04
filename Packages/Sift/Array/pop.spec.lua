-- Script path: ReplicatedStorage.Packages.Sift.Array.pop.spec
-- Decompile time: 0.57 ms

return function() -- Line: 1
    local pop = require(script.Parent.pop)
    it("should remove the last element of the given array", function() -- Line: 4 -- upvalues: pop (val)
        local v1 = pop({1, 2, 3})
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).never.to.be.ok()
    end)
    it("should not modify the original array", function() -- Line: 14 -- upvalues: pop (val)
        local v1 = {1, 2, 3}
        pop(v1)
        expect(v1[3]).to.equal(3)
    end)
    it("should pop multiple elements from the array", function() -- Line: 22 -- upvalues: pop (val)
        local v1 = pop({1, 2, 3, 4, 5}, 2)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
        expect(v1[4]).never.to.be.ok()
    end)
end