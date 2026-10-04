-- Script path: ReplicatedStorage.Packages.Sift.Array.push.spec
-- Decompile time: 0.57 ms

return function() -- Line: 1
    local push = require(script.Parent.push)
    it("should return an array with new value(s) added", function() -- Line: 4 -- upvalues: push (val)
        local v1 = push({1, 2, 3}, "Hello")
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(4)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
        expect(v1[4]).to.equal("Hello")
    end)
    it("should not modify the original array", function() -- Line: 16 -- upvalues: push (val)
        local v1 = {1, 2, 3}
        push(v1, "Hello")
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
        expect(v1[4]).never.to.be.ok()
    end)
end