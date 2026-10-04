-- Script path: ReplicatedStorage.Packages.Sift.Array.shuffle.spec
-- Decompile time: 0.25 ms

return function() -- Line: 1
    local shuffle = require(script.Parent.shuffle)
    it("should return a shuffled array", function() -- Line: 4 -- upvalues: shuffle (val)
        local v1 = {1, 2, 3}
        local v2 = shuffle(v1)
        expect(v2).to.be.a("table")
        expect(#v2).to.equal(3)
        expect(v2).never.to.equal(v1)
    end)
end