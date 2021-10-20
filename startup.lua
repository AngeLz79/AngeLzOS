if pocket then
    print('Cannot Run')
    return
end

bsod = function()
    sleep(0.5)
    term.setBackgroundColor(colors.blue)
    term.clear()
    term.setCursorPos(1,1)
    print(':( Your PC has Ran into a Problem.')
    print('')
    print('Error Code: Critical Proccess Died')
    print('')
    sleep(0.5)
    print("Press Any Key to Restart. . .")
    os.pullEvent("key")
    os.reboot()
end

--function
startup = function()
    term.setCursorPos(22,2)
    print('Loading')
    term.setCursorPos(19,5)
    print('[             ]')
    term.setCursorPos(20,5)
    textutils.slowPrint("=============")
    term.clear()
    term.setCursorPos(1,1)
    shell.run('.system/main.lua')
    bsod()
end

term.clear()
settings.load("/.settings")
if fs.exists('/disk/startup') then
    diskfile = '/disk/startup'
elseif fs.exists('/disk2/startup') then
    diskfile = '/disk2/startup'
elseif fs.exists('/disk3/startup') then
    diskfile = '/disk3/startup'
elseif fs.exists('/disk4/startup') then
    diskfile = '/disk4/startup'
elseif fs.exists('/disk5/startup') then
    diskfile = '/disk5/startup'
elseif fs.exists('/disk/startup.lua') then
    diskfile = '/disk/startup.lua'
elseif fs.exists('/disk2/startup.lua') then
    diskfile = '/disk2/startup.lua'
elseif fs.exists('/disk3/startup.lua') then
    diskfile = '/disk3/startup.lua'
elseif fs.exists('/disk4/startup.lua') then
    diskfile = '/disk4/startup.lua'
elseif fs.exists('/disk5/startup.lua') then
    diskfile = '/disk5/startup.lua'
end

--Main
h = fs.open(".password", "r")
    if h then
        local event = os.pullEventRaw()
        term.setCursorPos(16,4)
        term.setBackgroundColor(colors.blue)
        print('   Enter Password  ')
        term.setCursorPos(16,5)
        print('                   ')
        term.setCursorPos(16,6)
        print('   OK    Cancel    ')
        term.setCursorPos(20,5)
        inputpass = read()
        term.setBackgroundColor(colors.black)
        while true do
            local event, button, x, y = os.pullEventRaw()
            if event == "mouse_click" then
                if x >= 19 and x < 21 and y == 6 and button == 1 then
                    h = fs.open(".password", "r")     
                    if h.readAll() == inputpass then
                        term.setCursorPos(16,1)
                        term.clear()
                        if diskfile then
                            term.setCursorPos(2,2)
                            term.setTextColor(colors.red)
                            write('Floppy Disk Detected!')
                            term.setCursorPos(2,4)
                            term.setTextColor(colors.white)
                            write('Continue to OS')
                            term.setCursorPos(2,6)
                            term.setTextColor(colors.red)
                            write('Boot To Disk')
                            term.setTextColor(colors.white)
                            while true do
                                local event, button, cx, cy = os.pullEventRaw()
                                if event == "mouse_click" then
                                    if cx >= 2 and cx < 15 and cy == 4 and button == 1 then  
                                        startup()
                                    elseif cx >= 2 and cx < 15 and cy == 6 and button == 1 then
                                        shell.run(diskfile)
                                    end
                                end
                            end
                        end                        
                        startup()
                    else
                        os.reboot()
                    end
                end
            end
        end
    else
        if diskfile then
            term.setCursorPos(2,2)
            term.setTextColor(colors.red)
            write('Floppy Disk Detected!')
            term.setCursorPos(2,4)
            term.setTextColor(colors.white)
            write('Continue to OS')
            term.setCursorPos(2,6)
            term.setTextColor(colors.red)
            write('Boot To Disk')
            term.setTextColor(colors.white)
            while true do
                local event, button, cx, cy = os.pullEventRaw()
                if event == "mouse_click" then
                    if cx >= 2 and cx < 15 and cy == 4 and button == 1 then  
                        startup()
                    elseif cx >= 2 and cx < 15 and cy == 6 and button == 1 then
                        shell.run(diskfile)
                    end
                end
            end
        end
                
        startup()
end