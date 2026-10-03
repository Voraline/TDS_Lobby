-- Script path: ReplicatedStorage.Shared.Modules.Timer.spec
-- Decompile time: 0.60 ms

return function() -- Line: 1
    local TimerClass = require(script.Parent.TimerClass)
    it("Should return a Timer object", function() -- Line: 4 -- upvalues: TimerClass (val)
        local v1 = TimerClass.new(5)
        expect(v1).to.be.ok()
    end)
    it("Should clean up the Timer object", function() -- Line: 10 -- upvalues: TimerClass (val)
        local v1 = TimerClass.new(5)
        v1:Destroy()
        expect(v1.Maid).never.to.be.ok()
    end)
end