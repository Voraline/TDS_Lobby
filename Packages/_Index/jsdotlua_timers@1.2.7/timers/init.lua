-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_timers@1.2.7.timers
-- Decompile time: 0.25 ms

return (require((script.Parent:WaitForChild("collections")))).Object.assign(
    {},
    require(script:WaitForChild("makeTimerImpl"))(task.delay),
    require(script:WaitForChild("makeIntervalImpl"))(task.delay)
)