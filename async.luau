local task = require("@lune/task")

return function(thread: thread, callback : () -> ()?)
	while coroutine.status(thread) ~= "dead" do
		task.wait()
	end

	if callback then
		callback()
	end
end
