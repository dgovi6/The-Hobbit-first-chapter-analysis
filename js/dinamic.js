function menuopen () {
    var elem=document.getElementById("menu");
    elem.style.marginLeft="0";
    var elem=document.getElementById("menuopener");
    elem.style.marginLeft="-400px";
}

function menuclose () {
    var elem=document.getElementById("menu");
    elem.style.marginLeft="-300px";
    var elem=document.getElementById("menuopener");
    elem.style.marginLeft="0";
}

function indexopen () {
    var elem=document.getElementById("index");
    elem.style.marginRight="0";
    var elem=document.getElementById("indexopener");
    elem.style.marginRight="-400px";
}

function indexclose () {
    var elem=document.getElementById("index");
    elem.style.marginRight="-300px";
    var elem=document.getElementById("indexopener");
    elem.style.marginRight="0";
}

var di=0;
function dialoghi () {
    var list=document.getElementsByClassName("said");
    var contr=document.getElementById("dialogueB");
    if (di==0) {
        di=1;
        contr.style.backgroundColor="#71b2fb";
        contr.style.color="white";
        contr.style.border="2px solid white";
        for (i=0; i<list.length; i++) {
            var who=list[i].getAttribute("who");
            if (who=="#Bil") {
                list[i].style.backgroundColor="#96ddea";
            }
            else if (who=="#Gan") {
                list[i].style.backgroundColor="#89BABE";
            }
            else if (who=="#Tho") {
                list[i].style.backgroundColor="#d3f1ff";
            }
            else {
                list[i].style.backgroundColor="#71b2fb";
            }
        }
    }
    else {
        di=0;
        contr.removeAttribute("style");
        for (i=0; i<list.length; i++) {
            list[i].removeAttribute("style");
        }
    }
}

var ca=0;
function canzoni () {
    var list=document.getElementsByClassName("song2");
    var contr=document.getElementById("songB");
    if (ca==0) {
        ca=1;
        contr.style.backgroundColor="#8E518E";
        contr.style.color="white";
        contr.style.border="2px solid white";
        for (i=0; i<list.length; i++) {
            list[i].style.backgroundColor="#8E518E";
        }
    }
    else {
        ca=0;
        contr.removeAttribute("style");
        for (i=0; i<list.length; i++) {
            list[i].removeAttribute("style");
        }
    }
}

var pe=0;
function person () {
    var list=document.getElementsByClassName("person");
    var contr=document.getElementById("personB");
    if (pe==0) {
        pe=1;
        contr.style.backgroundColor="#FF4D4D";
        contr.style.color="white";
        contr.style.border="2px solid white";
        for (i=0; i<list.length; i++) {
            list[i].style.backgroundColor="#FF4D4D";
        }
    }
    else {
        pe=0;
        contr.removeAttribute("style");
        for (i=0; i<list.length; i++) {
            list[i].removeAttribute("style");
        }
    }
}

var pl=0;
function place () {
    var list=document.getElementsByClassName("place");
    var contr=document.getElementById("placeB");
    if (pl==0) {
        pl=1;
        contr.style.backgroundColor="#7fbf7f";
        contr.style.color="white";
        contr.style.border="2px solid white";
        for (i=0; i<list.length; i++) {
            list[i].style.backgroundColor="#7fbf7f";
        }
    }
    else {
        pl=0;
        contr.removeAttribute("style");
        for (i=0; i<list.length; i++) {
            list[i].removeAttribute("style");
        }
    }
}

var rc=0;
function race () {
    var list=document.getElementsByClassName("race");
    var contr=document.getElementById("raceB");
    if (rc==0) {
        rc=1;
        contr.style.backgroundColor="#FFCC33";
        contr.style.color="white";
        contr.style.border="2px solid white";
        for (i=0; i<list.length; i++) {
            list[i].style.backgroundColor="#FFCC33";
        }
    }
    else {
        rc=0;
        contr.removeAttribute("style");
        for (i=0; i<list.length; i++) {
            list[i].removeAttribute("style");
        }
    }
}

var stato=0;
function apriLista () {
    var apri=this.getAttribute("ref");
    var elem=document.getElementById(apri);
    if (stato!=0) {
        var list=document.getElementsByClassName("list");
        for (i=0; i<list.length; i++) {
            if (list[i]!=elem) {
                list[i].removeAttribute("style");
            }
        }
        this.removeAttribute("style");
    }
    stato=1;
    elem.style.bottom="0";
    this.style.backgroundColor="#9f6b3f";
    this.style.color="white";
    this.style.border="2px solid white";
    this.onclick=chiudiLista;
    var bottoni=document.getElementsByClassName("listButton");
    for (i=0; i<bottoni.length; i++) {
        if (bottoni[i]!=this) {
         bottoni[i].removeAttribute("style");
         bottoni[i].onclick=apriLista;
        }
    }
    var capitoli=document.getElementsByClassName("chapter");
    for (i=0; i<capitoli.length; i++) {
         capitoli[i].className="chapter blur";
        }
}

function chiudiLista () {
    stato=0;
    var chiudi=this.getAttribute("ref");
    var elem=document.getElementById(chiudi);
    elem.style.bottom="-1000px";
    var bottoni=document.getElementsByClassName("listButton");
    for (i=0; i<bottoni.length; i++) {
        bottoni[i].removeAttribute("style");
        bottoni[i].onclick=apriLista;
    }
    var capitoli=document.getElementsByClassName("chapter");
    for (i=0; i<capitoli.length; i++) {
         capitoli[i].className="chapter";
        }
}

function sololettura () {
    menuclose();
    indexclose();
    di=0;
    ca=0;
    pe=0;
    pl=0;
    rc=0;
    stato=0;
    var list=document.getElementsByTagName("*");
    for (var i = list.length - 1; i >= 0; i--) {
        list[i].removeAttribute("style");
    }
    var capitoli=document.getElementsByClassName("chapter");
    for (i=0; i<capitoli.length; i++) {
         capitoli[i].className="chapter";
        }

}


function inizializza () {
    document.getElementById("menuopener").onclick=menuopen;
    document.getElementById("menucloser").onclick=menuclose;
    document.getElementById("indexopener").onclick=indexopen;
    document.getElementById("indexcloser").onclick=indexclose;
    document.getElementById("dialogueB").onclick=dialoghi;
    document.getElementById("songB").onclick=canzoni;
    document.getElementById("personB").onclick=person;
    document.getElementById("placeB").onclick=place;
    document.getElementById("raceB").onclick=race;
    document.getElementById("clean").onclick=sololettura;   
    var liste=document.getElementsByClassName("listButton");
    for (i=0; i<liste.length; i++) {
        liste[i].onclick=apriLista;
    }
    var l2=document.getElementsByClassName("listCloser");
    for (i=0; i<l2.length; i++) {
        l2[i].onclick=chiudiLista;
    }
    
}

window.onload=inizializza;