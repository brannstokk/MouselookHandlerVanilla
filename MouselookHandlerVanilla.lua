MouselookHandlerVanilla = {}

function MouselookHandlerVanilla:toggle()
   if IsMouselooking() == 1 then
      MouselookStop()
      SetBinding("BUTTON2", "TURNORACTION")
    else
      MouselookStart()
      SetBinding("BUTTON2", "TOGGLEAUTORUN")
    end
end

