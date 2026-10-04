-- Script path: ReplicatedStorage.Packages.Sift.Array.update.spec
-- Decompile time: 0.90 ms

return function() -- Line: 1
    local update = require(script.Parent.update)
    it("should update the value at the given index", function() -- Line: 4 -- upvalues: update (val)
        local v1 = update({1, 2, 3}, 2, function(a1) -- Line: 7
            return a1 + 1
        end)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(3)
        expect(v1[3]).to.equal(3)
    end)
    it("should create values using the callback", function() -- Line: 19 -- upvalues: update (val)
        local v1 = update({1, 2, 3}, 4, function(a1) -- Line: 22
            return a1 + 1
        end, function() -- Line: 24
            return 5
        end)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(4)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
        expect(v1[4]).to.equal(5)
    end)
    it("should not modify the original array", function() -- Line: 37 -- upvalues: update (val)
        local v1 = {1, 2, 3}
        update(v1, 2, function(a1) -- Line: 40
            return a1 + 1
        end)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
    end)
end