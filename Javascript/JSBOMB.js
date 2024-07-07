// I don't care what you do with this anymore

// This Scratch Javascript remix bomb was made by RCUTB, not me (TS2021).
// To use this, execute the code below into your console (Inspect Element - Console section)

// You will need to include the project.json (check the bottom of this page to see how to get this)

// Settings
var e = 1 // This is the project id of the starting project

var h = 1 // This will be the next project's remix number.

var csrf = "" // your scratch X-CSRFToken (check the bottom of this page to see how to get this)

var xtoken = "" // your scratch x-token (check the bottom of this page to see how to get this)

var cookies = `` // scratch browser cookies (don't edit)

// Code
jsbomb = async function() {

    fetch("https://api.scratch.mit.edu/proxy/projects/" + e + "/share", {

        "credentials": "include",

        "headers": {

            "Accept": "*/*",

            "Accept-Language": "en-US,en;q=0.5",

            "X-CSRFToken": csrf,

            "x-token": xtoken,

            "Sec-Fetch-Dest": "empty",

            "Sec-Fetch-Mode": "cors",

            "Sec-Fetch-Site": "same-site",

            "cookie": cookies

        },

        "referrer": "https://scratch.mit.edu/",

        "method": "PUT",

        "mode": "cors"

    });

    e = await fetch("https://projects.scratch.mit.edu/?is_remix=1&original_id=" + e + "&title=Scratch%20Project", {

        "credentials": "include",

        "headers": {

            "Accept": "*/*",

            "Accept-Language": "en-US,en;q=0.5",

            "Content-Type": "application/json",

            "Sec-Fetch-Dest": "empty",

            "Sec-Fetch-Mode": "cors",

            "Sec-Fetch-Site": "same-site",

            "cookie": cookies

        },

        "referrer": "https://scratch.mit.edu/",

        "body": 'text here', // the project.json will go here. this will be what the project will contain.

        "method": "POST",

        "mode": "cors"

    });

    console.log(e);

    e = await e.json();

    e = e["content-name"];

    h = h + 1

    console.log(h - 1); // this logs the project's remix number to your console

    console.log(e) // this logs the project's id to your console

    jsbomb();

}

jsbomb();


// YOU CAN DELETE EVERYTHING BELOW THIS LINE

// Instructions
// How to get your scratch X-CSRFToken
// 1. Comment something
// 2. Go to inspect element 
// 3. Go to the network section
// 4. Find /session
// 5. Copy the token
// Note: This X-CSRFToken will change so you'll need to do this every time you're JSBOMBing.

// How to get your scratch x-token
// 1. Comment something
// 2. Go to scratch.mit.edu/session
// 3. View the page's source
// 4. Copy the x-token
// Note: This x-token will always stay the same

// How to get the project.json
// 1. Download the project you want to use
// 2. Convert it to a zip 
// 3. Open the zip
// 4. Open the folder created by the zip
// 5. Open the json file.
// 6. Copy the text in it.
