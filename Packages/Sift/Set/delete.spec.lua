-- Script path: ReplicatedStorage.Packages.Sift.Set.delete.spec
-- Decompile time: 0.37 ms

return function() -- Line: 1
    local delete = require(script.Parent.delete)
    it("should delete a value from a set", function() -- Line: 4 -- upvalues: delete (val)
        local v1 = {hello = true}
        local v2 = delete(v1, "hello")
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2.hello).to.equal(nil)
    end)
    it("should not modify the original set", function() -- Line: 15 -- upvalues: delete (val)
        local v1 = {hello = true}
        delete(v1, "hello")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
    end)
end