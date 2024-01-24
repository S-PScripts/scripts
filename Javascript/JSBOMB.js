// scratch jsbomb made by derv, not me (TS2021)
// execute the code in console

var e = 1 // id of starting project

var h = 1 // next remix number will be this

var csrf = "insert here" // scratch X-CSRFToken

var xtoken = "insert here" // scratch x-token

//var bodyjs = 'insert here' // project.json of what you want the remixes to look like.

var cookies = `` // scratch browser cookies

jsbomb = async function() {

fetch("https://api.scratch.mit.edu/proxy/projects/"+e+"/share", {

        "credentials": "include",

        "headers": {

            "Accept": "*/*",

            "Accept-Language": "en-US,en;q=0.5",

            "X-CSRFToken": csrf,

            "x-token": xtoken,

            "Sec-Fetch-Dest": "empty",

            "Sec-Fetch-Mode": "cors",

            "Sec-Fetch-Site": "same-site",

            "cookie":cookies

        },

        "referrer": "https://scratch.mit.edu/",

        "method": "PUT",

        "mode": "cors"

    });

e = await fetch("https://projects.scratch.mit.edu/?is_remix=1&original_id=" + e +"&title=Scratch%20Project", {

        "credentials": "include",

        "headers": {

            "Accept": "*/*",

            "Accept-Language": "en-US,en;q=0.5",

            "Content-Type": "application/json",

            "Sec-Fetch-Dest": "empty",

            "Sec-Fetch-Mode": "cors",

            "Sec-Fetch-Site": "same-site",

            "cookie":cookies

        },

        "referrer": "https://scratch.mit.edu/",

        "body": '{"targets":[{"isStage":true,"name":"Stage","variables":{"`jEk@4|i[#Fk?(8x)AV.-my variable":["my variable",0],")-!vSJtJqu~h?$d`L[%`":["REMIX","Hello, world!"]},"lists":{},"broadcasts":{},"blocks":{"V{e:`oxxJ{eIddlY1yM+":{"opcode":"sound_playuntildone","next":null,"parent":"SozDsz)(P9V$|)g1x`}v","inputs":{"SOUND_MENU":[1,"ESV;ZIZ-aeMefF$-+.8;"]},"fields":{},"shadow":false,"topLevel":false},"ESV;ZIZ-aeMefF$-+.8;":{"opcode":"sound_sounds_menu","next":null,"parent":"V{e:`oxxJ{eIddlY1yM+","inputs":{},"fields":{"SOUND_MENU":["The Amazing Digital Circus - Main Theme (Orchestral) (Earrape) [TubeRipper",null]},"shadow":true,"topLevel":false},"kn-C#](fwd6gc#Kj+zQd":{"opcode":"event_whenflagclicked","next":"t$*5@6VEfxuZdA~ezL)_","parent":null,"inputs":{},"fields":{},"shadow":false,"topLevel":true,"x":295,"y":302},"SozDsz)(P9V$|)g1x`}v":{"opcode":"control_forever","next":null,"parent":"/d0OF7(rP~nsU2(c5EDb","inputs":{"SUBSTACK":[2,"V{e:`oxxJ{eIddlY1yM+"]},"fields":{},"shadow":false,"topLevel":false},"/d0OF7(rP~nsU2(c5EDb":{"opcode":"sound_setvolumeto","next":"SozDsz)(P9V$|)g1x`}v","parent":"t$*5@6VEfxuZdA~ezL)_","inputs":{"VOLUME":[1,[4,"10"]]},"fields":{},"shadow":false,"topLevel":false},"t$*5@6VEfxuZdA~ezL)_":{"opcode":"data_setvariableto","next":"/d0OF7(rP~nsU2(c5EDb","parent":"kn-C#](fwd6gc#Kj+zQd","inputs":{"VALUE":[1,[10,"Hello, world!"]]},"fields":{"VARIABLE":["REMIX",")-!vSJtJqu~h?$d`L[%`"]},"shadow":false,"topLevel":false}},"comments":{},"currentCostume":0,"costumes":[{"name":"backdrop1","dataFormat":"svg","assetId":"cd21514d0531fdffb22204e0ec5ed84a","md5ext":"cd21514d0531fdffb22204e0ec5ed84a.svg","rotationCenterX":240,"rotationCenterY":180}],"sounds":[{"name":"pop","assetId":"83a9787d4cb6f3b7632b4ddfebf74367","dataFormat":"wav","format":"","rate":44100,"sampleCount":1032,"md5ext":"83a9787d4cb6f3b7632b4ddfebf74367.wav"},{"name":"The Amazing Digital Circus - Main Theme (Orchestral) (Earrape) [TubeRipper","assetId":"0a64b7a31752833b5755c4c3627706b4","dataFormat":"mp3","rate":44100,"sampleCount":2853446,"md5ext":"0a64b7a31752833b5755c4c3627706b4.mp3"}],"volume":10,"layerOrder":0,"tempo":60,"videoTransparency":50,"videoState":"on","textToSpeechLanguage":null}],"monitors":[{"id":")-!vSJtJqu~h?$d`L[%`","mode":"default","opcode":"data_variable","params":{"VARIABLE":"REMIX"},"spriteName":null,"value":"Hello, world!","width":0,"height":0,"x":5,"y":5,"visible":true,"sliderMin":0,"sliderMax":100,"isDiscrete":true}],"extensions":[],"meta":{"semver":"3.0.0","vm":"2.1.14","agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"}}',

        "method": "POST",

        "mode": "cors"

    });

    console.log(e);

    e = await e.json();

    e = e["content-name"];

h=h+1

console.log(h-1); // logs remix number

console.log(e) // logs project id

jsbomb();

}

jsbomb();

// how to get X-CSRFToken
// comment something
// go to network and find /session
// copy the token

// how to get x-token
// comment something
// go to scratch.mit.edu/session
// view the page's source
// copy the token

// how to get project.json
// download the project you want to use
// convert it to a zip 
// open the zip
// open the folder created by the zip
// copy the json file in it

// JSBOMB Places - These are the ONLY official links. Any other places are FAKE.
// GITHUB is the most updated, followed by Pastebin and Github Gist!

// Safe (only edited by me):
// Github: https://raw.githubusercontent.com/S-PScripts/scripts/main/Javascript/JSBOMB.js
// Github Gist: https://gist.githubusercontent.com/S-PScripts/f0ca6967c9cc14cd4d1a90935a630cc5/raw/4f8d95d72a193456450d8dc15ce849cf35bd543b/JSBOMB.js
// Pastebin: https://pastebin.com/raw/1vANhnPM
// Rentry: https://rentry.co/jsbomb/raw
// JustPasteIt: https://justpaste.it/aos1w
// aNotepad: https://anotepad.com/notes/x2ipdcmw

// Dangerous (can be edited by anyone):
// ProtectedText: https://www.protectedtext.com/jsbombt-101 - PASSWORD is myjsbomb123
// CodedPad: https://www.codedpad.com/ - the code is jsbombt-101
// Shrib: https://shrib.com/#Idris5M4E2Wq
