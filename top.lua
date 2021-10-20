f = function()
    while true do
        local event, button, x, y = os.pullEvent()
        for e=multishell.getCount(),1,-1 do
            if y then
                multishell.setFocus(y-2)
            end
        end
    end
end
 
d = function()
    while true do
        term.setTextColor(colors.gray)
        term.setBackgroundColor(colors.white)
        sleep(0.0)
        term.setCursorPos(1,1)
        term.clear()        
        term.setTextColor(colors.gray)
        term.setBackgroundColor(colors.white)
        print('PID\149Name            \149')
        local w, h = term.getSize()
        term.setCursorPos(1,2)
        write('\140\140\140\157\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\157\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140\140')
        for i=multishell.getCount(),1,-1 do
            term.setCursorPos(1,i+2)
            print(i)
            term.setCursorPos(4,i+2)
            print("\149")
            term.setCursorPos(5,i+2)
            print(multishell.getTitle(i)) 
            term.setCursorPos(20,i+2)
            print(' \149 ')
        end
    end
end
 
parallel.waitForAny(f,d)