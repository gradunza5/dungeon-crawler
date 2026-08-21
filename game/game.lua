local action = require("data.action");


local Game = {}
Game.__index = Game;

function Game:run()

    local options = {
        action.new(),
        action.new()
    }

    print ("game running")

    local endGame = false;
    local choice = "";

    while (not endGame) do
       io.write("Choose Option:\n") 
       io.write("1. status\n");
       io.write("2. explore\n");
       io.write("3. exit\n");

       choice = io.read();

       if (choice == "1" or choice == "explore") then
           io.write("exploring more\n");
       elseif (choice == "2" or choice == "exit") then
            io.write("exiting...\n");
            endGame = true;
        else
            io.write("Option unknown. Please try again\n")
        end

    end
end

return Game
