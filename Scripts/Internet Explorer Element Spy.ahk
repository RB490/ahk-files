#Persistent
SetBatchLines -1
OnExit("Cleanup")
ComObjError(False)
index := 1

width := 400
height := 200
Gui, +AlwaysOnTop +Resize +hwndHWND
Gui, Add, Edit, vGUI_InfoBox w500 h200
Gui, Add, Text, vGUI_HotkeyNote w400 h20, [F1]: Freeze display --- [F2]/[F3]: select next/previous element under mouse
Gui, Show, % "x" A_ScreenWidth-530 " y" 0, IE Window/Element Spy
;WinSet, Transparent, 200, ahk_id %HWND%

ActiveIeMon := Func("ActiveIeMonitor")
SetTimer, % ActiveIeMon, 100
Return

F1::
    frozen:=!frozen
Return
F2::
    index++
    ;TrayTip, Changed element selecting index, Element #%index% under the mouse will be shown.
Return
F3::
    If (index > 1)
        index--
    ;TrayTip, Changed element selecting index, Element #%index% under the mouse will be shown.
Return
ActiveIeMonitor(cleanup:=False) {
    Static lastIE, lastWindow, lastIndex
    Global index
    If (cleanup) {
        If (lastWindow.___id___) {
            EnableMouseMoveListener(lastIE,lastWindow,False)
        }
        Return
    }
    IE := IeGet()
    If (ComObjType(IE,"IID")) {
        window := ComObj(9,ComObjQuery(lastIE,"{332C4427-26CB-11D0-B483-00C04FD90119}","{332C4427-26CB-11D0-B483-00C04FD90119}"),1)
        If (!window.___id___ || window.___id___ != lastWindow.___id___) {
            If (!window.___id___)
                EnableMouseMoveListener(IE,window,True)
            If (lastWindow.___id___)
                EnableMouseMoveListener(lastIE,lastWindow,False)
        }
        If (index != lastIndex)
            OnMouseMove(IE, window, "")
    }
    ;msgbox % IE.document.uniqueID
    lastIE := IE
    lastWindow := window
    lastIndex := index
}
EnableMouseMoveListener(IE,window,enable:=True) {
    Static LastOnMouseMoveBound
    If (enable) {
        window.___id___ := A_TickCount
        window.eval("function ___injected_eventListenerHelperFuntion___(listener) { return function(e) { return listener(e); }; }")
        OnMouseMoveBound := Func("OnMouseMove").Bind(IE,window)
        window.addEventListener("mousemove", window.___injected_eventListenerHelperFuntion___(OnMouseMoveBound))
    } Else {
        window.___id___ := 0                            ;TODO: check which of these are actually necessary
        lastWindow.eval("___id___ = undefined;")        ;TODO: check which of these are actually necessary
        lastWindow.eval("window.___id___ = undefined;") ;TODO: check which of these are actually necessary
        window.eval("function ___injected_eventListenerHelperFuntion___(listener) { return function(e) { return listener(e); }; }")
        window.removeEventListener("mousemove", window.___injected_eventListenerHelperFuntion___(LastOnMouseMoveBound))
        window.eval("___injected_eventListenerHelperFuntion___ = undefined;")
        OnMouseMove("","","",True)
    }
    LastOnMouseMoveBound := OnMouseMoveBound
}
OnMouseMove(IE, window, e:="", cleanup:=False) {
    Static lastElement, lastElementOutline, lastE := {}
    Global frozen, index
    If (cleanup) {
        If (lastElement)
            lastElement.style.outline := lastElementOutline
        Return
    }
    If frozen
        Return
    If (!e)
        e := lastE
    
    If (e.pageX != lastE.pageX || e.pageY != lastE.pageY)
        index = 1
    
    document := IE.document
    x := e.pageX-window.pageXOffset
    y := e.pageY-window.pageYOffset
    If (lastElement)
        lastElement.style.outline := lastElementOutline
    
    ;MsgBox % AllElementsFromPoint(document,x,y)[1].innerHTML
    lastElement := GetElementFromPoint(document,x,y,index)
    ;lastElement := document.elementFromPoint(x,y)
    ;lastElement := document.elementsFromPoint(x,y)[1]
    lastElementOutline := lastElement.style.outline
    
    lastElement.style.outline := "2px solid red"
    
    comErrOriginal := ComObjError(False) ;prevent error msgs in case a property doesn't exist
    wb := "wb."
    
    title := document.title 
    url := IE.locationUrl
    tag := lastElement.tagName
    class := lastElement.className
    classes := StrSplit(class,[A_Tab, A_Space, "`n", "`r"])
    id := lastElement.id
    name := lastElement.name
    
    info :=          "---GENERAL INFO---"
    info .= "`r`n"   "Title: " title
    info .= "`r`n"   "Url: " url
    info .= "`r`n"   "Mouse position: x: " x " - y: " y
    info .= "`r`n"
    info .= "`r`n"   "---ELEMENT ACCESS INFO---"
    info .= "`r`n"   "tagName: " tag
    info .= "`r`n"   "classNames: " class
    info .= "`r`n"   "id: " id
    info .= "`r`n"   "name: " name
    info .= "`r`n"
    
    info .= "`r`n" "---ELEMENT ACCESS SUGGESTION---"
    info .= "`r`n"
    If (id)
        info .= wb "document.getElementById(""" id """)"
    Else If (name)
        info .= wb "document.getElementsByName(""" name """)"
    Else {
        info .= wb "document.querySelector(""" 
        info .= tag
        If (class)
            Loop % classes.MaxIndex()
                info .= "." classes[A_Index]
        info .= """)"
    }
    
    info .= "`r`n"
    info .= "`r`n"
    info .= "`r`n"   "---ELEMENT CONTENT INFO---"
    info .= "`r`n"   " value:" lastElement.value
    info .= "`r`n"
    info .= "`r`n"   " innerText:"
    info .= "`r`n"   lastElement.innerText
    info .= "`r`n"
    info .= "`r`n"   " textContent:"
    info .= "`r`n"   lastElement.textContent
    info .= "`r`n"
    info .= "`r`n"   " innerHTML:"
    info .= "`r`n"   lastElement.innerHTML
    
    ComObjError(comErrOriginal)
    GuiControl,, GUI_InfoBox, % info
    lastE := e
}
IeGet(hWnd:=0) {
    WinGetTitle, title, % (hWnd ? "ahk_id " hWnd : "A")
    For window in ComObjCreate("Shell.Application").windows
        If (InStr(window.fullName, "iexplore.exe") && window.document.title . " - Internet Explorer" = title)
            Return window
    Return {}
}

GuiSize(GuiHwnd, EventInfo, Width, Height) {
    GuiControl, Move, GUI_InfoBox, % "x" 0 " y" 0 " w" Width " h" Height-15
    GuiControl, Move, GUI_HotkeyNote, % "x" 0 " y" Height-15 " w" Width " h" 15
}
GuiClose() {
    ExitApp
}
Cleanup() {
    Global ActiveIeMon
    SetTimer, % ActiveIeMon, Off
    ActiveIeMonitor(true)
}

GetElementFromPoint(document, x, y, ByRef index) {
    If (!IsObject(document) || index <= 0) {
        Return []
    }
    If (index = 1)
        Return document.elementFromPoint(x, y)
    element := []
    elements := []
    old_visibility := []
    elementsOrdered := []
    Loop % index{
        element := document.elementFromPoint(x, y)
        If (!IsObject(element) || element.isSameNode(document.documentElement))
            Break
        elements[A_Index] := element
        old_visibility[A_Index] := element.style.visibility
        element.style.visibility := "hidden"
    }
    Loop % elements.MaxIndex()
        elements[A_Index].style.visibility := old_visibility[A_Index]
    Return elements[index]
    ;i := elements.MaxIndex()
    ;While (i > 0, i--) {
    ;    elementsOrdered[A_Index] := elements[i]
    ;}
    ;return elementsOrdered
}