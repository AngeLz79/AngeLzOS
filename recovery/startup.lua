clear = function (x,y,b,t)
    term.setBackgroundColor(b)
    term.setTextColor(t)
    term.setCursorPos(x,y)
    term.clear()
    return true    
end
  
while running do
    term.clear()
    display()
    getInput()
end

local draw = function ()
    term.setCursorBlink(false)
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    term.clear()
    term.setCursorPos(1,1)
    
    clear(1,1,colors.blue,colors.white)
    term.clear()
    term.setCursorPos(1,1)
    write("Recovery")
    
    print("\n1) Shell\n2) Startup Repair\n3) Startup Settings\n4) System Restore\n5) System Image Recovery\n6) Reset This PC\n\n7) Return")        
end
local scan = true
draw()
while scan do
    local b, t = os.pullEventRaw("key")
    if b == "key" then
        if t ==2 then
            clear(1,1,colors.blue,colors.white)
            sleep(1)
            mounter.unChroot()
            clear(1,1,colors.black,colors.white)
            shell.run('shell')
            mounter.chroot('recovery')
            draw()
        elseif t == 3 then
            clear(1,1,colors.blue,colors.white)
            sleep(1)
            shell.run('/repair.lua')
        elseif t == 4 then
            clear(1,1,colors.blue,colors.white)
            sleep(1)
            shell.run('/settings.lua')
        elseif t == 5 then
            clear(1,1,colors.blue,colors.white)
            sleep(1)
            shell.run('/restores.lua')
        elseif t == 6 then
            clear(1,1,colors.blue,colors.white)
            sleep(1)
            shell.run('/imageflash.lua')
        elseif t == 7 then
            clear(1,1,colors.blue,colors.white)
            sleep(1)
            shell.run('/reset.lua')
        elseif t == 8 then
            clear(1,1,colors.blue,colors.white)
            sleep(1)
            os.reboot()
        end
    end
end

os.reboot()