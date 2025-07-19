CoordMode, Mouse, Screen

ResizeWindow(TopSpace, RightSpace, BottomSpace, LeftSpace) {
    ; Get screen dimensions
    SysGet, Monitor, MonitorWorkArea
    
    ; Calculate new dimensions
    Width := MonitorRight - LeftSpace - RightSpace
    Height := MonitorBottom - TopSpace - BottomSpace
    X := LeftSpace
    Y := TopSpace
    
    ; Resize active window
    WinGet, activeWindow, ID, A
    WinMove, ahk_id %activeWindow%, , X, Y, Width, Height
}

SplitScreen(Position) {
    SysGet, Monitor, MonitorWorkArea
    HalfWidth := MonitorRight // 2
    HalfHeight := MonitorBottom // 2
    TopMargin := 40  ; Leave space for tab interaction

    if (Position = 1) {
        ResizeWindow(TopMargin, HalfWidth, HalfHeight - TopMargin, 0)  ; Top Left
    } else if (Position = 2) {
        ResizeWindow(TopMargin, 0, HalfHeight - TopMargin, HalfWidth)  ; Top Right
    } else if (Position = 3) {
        ResizeWindow(HalfHeight, HalfWidth, 0, 0)  ; Bottom Left (no change)
    } else if (Position = 4) {
        ResizeWindow(HalfHeight, 0, 0, HalfWidth)  ; Bottom Right (no change)
    } else if (Position = 5) {
        ; Left 50% of screen, with top margin
        ResizeWindow(TopMargin, HalfWidth, 0, 0)
    } else if (Position = 6) {
        ; Right 50% of screen, with top margin
        ResizeWindow(TopMargin, 0, 0, HalfWidth)
    }
}

; Define hotkeys with different margins
^#q::ResizeWindow(50, 30, 10, 30)  ; Win + Ctrl + Q
^#w::ResizeWindow(70, 100, 30, 100)  ; Win + Ctrl + W
^#e::ResizeWindow(90, 160, 50, 160)  ; Win + Ctrl + E
^#r::ResizeWindow(110, 220, 80, 220)  ; Win + Ctrl + R
^#t::ResizeWindow(130, 300, 100, 300)  ; Win + Ctrl + T
^#y::ResizeWindow(130, 400, 100, 400)  ; Win + Ctrl + Y


; Split screen into four quadrants
^#1::SplitScreen(1)  ; Win + Ctrl + 1 (Top Left)
^#2::SplitScreen(2)  ; Win + Ctrl + 2 (Top Right)
^#3::SplitScreen(3)  ; Win + Ctrl + 3 (Bottom Left)
^#4::SplitScreen(4)  ; Win + Ctrl + 4 (Bottom Right)
^#5::SplitScreen(5)  ; Win + Ctrl + 5 (Left)
^#6::SplitScreen(6)  ; Win + Ctrl + 6 (Right)

return
