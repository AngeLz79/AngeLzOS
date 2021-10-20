term.clear()
term.setCursorPos(1, 1)
 
local h = fs.open(".password", "r")
if h then
    if h.readAll() then
        term.setCursorPos(16,4)
        term.setBackgroundColor(colors.blue)
        print('      Password     ')
        term.setCursorPos(16,5)
        print('                   ')
        term.setCursorPos(16,6)
        print('   OK    Cancel    ')
        term.setCursorPos(20,5)
        inputpass = io.read()
        term.setBackgroundColor(colors.black)
        while true do
            local event, button, x, y = os.pullEventRaw()
            if event == "mouse_click" then
                if x >= 19 and x < 21 and y == 6 and button == 1 then
                    if h.readAll() == inputpass then
						term.clear()
						term.setCursorPos(1,1)
                        shell.run('lua')
						os.close()
                    else 
                        h.close()
                        term.clear()
                        term.setCursorPos(16,1)
                        print('Password Incorrect')
                        sleep(3)
                        return
                    end
                elseif x >= 25 and x < 30 and y == 6 and button == 1 then
                    os.close()
                end
            end
        end
    end
else 
    shell.run('lua')
end