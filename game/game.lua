require("data.action");


local Game = {}
Game.__index = Game;

function Game.run()

    local options = {
        Action:create("Thing", function()
            io.write("Thing callback")
        end),
    }
    
    print ("game running")

    local endGame = false;

    while (not endGame) do
       io.write("Choose Option:\n") 
       for i,v in ipairs(options) do
           io.write(i .. ". " .. v.label)
       end
       io.write("\n")

       local choice = io.read();

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
