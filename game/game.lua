--@class Game
--@field [any] any

require("data.action")

local Game = {}
Game.__index = Game

local function getInput()
    io.write("> ")
    local input = io.read()
    io.write("\n")
    return input
end

function Game.run()
	local endGame = false

    --@type table<integer, action[]>
	local options = {
		Action:create("Thing", function()
			io.write("Thing callback\n")
		end),
		Action:create("Exit", function()
			io.write("Exiting...")
			endGame = true
		end),
	}

	print("game running")

	local choice = "-1"
	local idx = tonumber(choice)
	local selection = nil
	local error = false

	while not endGame do
        error = false

		io.write("\nChoose Option:\n")
		for i, v in ipairs(options) do
			io.write(i .. ". " .. v.label .. "\n")
		end
		io.write("\n")

		choice = getInput()
		idx = tonumber(choice)

		if idx and idx >= 1 and idx <= #options then
			selection = options[idx]

			if selection ~= nil then
				selection.callback()
			else
				error = true
			end
		else
			error = true
		end

		if error then
			io.write("Option not recognized. Please try again.\n")
		end
	end
end

return Game
