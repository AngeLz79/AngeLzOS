term.clear()
shell.run('/.system/boot.lua')
term.setCursorPos(1,1)
bsod = function(err, s)
    term.setBackgroundColor(colors.blue)
    term.clear()
    term.setCursorPos(1,1)
    print(':( Your PC has Ran into a Problem.')
    print('')
    print('Error Code: '..err)
    print('')
    if s then
        local button = os.pullEvent("key")
        term.setCursorPos(1,1)
        term.setBackgroundColor(colors.black)
        term.clear()
        shell.run('shell')
    else
        print('Press Any Key to Reboot')
        local button = os.pullEvent("key")
        os.reboot()
    end
end
if not fs.exists('/.system/boot.lua') then
    bsod("Critical File Missing", true)
end
bsod("Terminated Boot", false)