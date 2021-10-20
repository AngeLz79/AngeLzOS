clear = function()
    term.clear()
    term.setCursorPos(1,1)
end

shutdown = function()
    clear()
    write('Are You Sure You want to Shutdown?')
    term.setCursorPos(5,8)
    write('No')
    term.setCursorPos(5,10)
    write('Yes')
    while true do
        local event, button, cx, cy = os.pullEventRaw()
        if event == "mouse_click" then
            term.setCursorPos(2,3)
            if cx >= 5 and cx < 7 and cy == 8 and button == 1 then
                shell.run('/.system/main')
            elseif cx >=5 and cx < 8 and cy == 10 and button == 1 then
                stop()
            end
        elseif event == "terminate" then
            stop()
        end
    end
end

stop = function()
    print('Shutting Down')
    sleep(2)
    os.shutdown()
end

shutdown()