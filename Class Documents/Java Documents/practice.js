window.addEventListener('DOMContentLoaded',init, false);

function init() {
    alert ('Did the script load? Yes. Yes it loaded.');
    
var buttons = document.getElementsByTag("button");
    
var button = buttons[0];
    button.addEventListener('click', show_hide, false);}
function show_hide(){
    var p = getElementById("paragraphToToggle");
    if(p.style.display == "none")
    {p.style.display = "block";}
    else 
    {p.style.display = "none";}
}