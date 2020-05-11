html=
(`%
<!DOCTYPE html>
<html>
<body>

<h2>My First JavaScript</h2>

<button type="button"
onclick="document.getElementById('demo').innerHTML = Date()">
Click me to display Date and Time.</button>

<p id="demo"></p>

</body>
</html> 

)

Gui Add, ActiveX, vWB w800 h600, about:<!DOCTYPE html><meta http-equiv="X-UA-Compatible" content="IE=edge">
Gui, show
document := WB.Document
document.open()
document.write(html)
document.close()
msgbox
exitapp