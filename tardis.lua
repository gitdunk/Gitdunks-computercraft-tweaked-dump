function drawdesk()
    local backgr = paintutils.loadImage("tardis/backgr.nfp")
    paintutils.drawImage(backgr, 2, 1)
    drawmenu
end
end
end
function drawmenu()
    term.setCursorPos(1,1)
    print('[menu]')
end
function main()
end


drawdesk