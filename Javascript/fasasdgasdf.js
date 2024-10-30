var e = 1089371648; // This is the project id of the starting project
var h = 1; // This will be the next project's remix number.
var csrf = document.cookie.split('; ').find(row => row.startsWith('scratchcsrftoken=')).split('=')[1]; // your scratch X-CSRFToken
var xtoken = "2c0d98a347e84d83813ff43a36ce5733:6Hy3h6a2_6yhxPUsemlPI3M7nwU"; // your scratch x-token
var cookies = ``; // scratch browser cookies (don't edit)

jsbomb = async function() {

    // Share the original project
    await fetch("https://api.scratch.mit.edu/proxy/projects/" + e + "/share", {
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

    // Create the new project with a specific title format
    var projectTitle = "untitled-4 (" + h + ")"; // Updated title format
    var newProject = await fetch("https://projects.scratch.mit.edu/?is_remix=1&original_id=" + e + "&title=" + encodeURIComponent(projectTitle), {
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
        "body": '{"targets":[{"isStage":true,"name":"Stage","variables":{"`jEk@4|i[#Fk?(8x)AV.-my variable":["my variable",0]},"lists":{},"broadcasts":{},"blocks":{},"comments":{},"currentCostume":0,"costumes":[{"name":"backdrop1","dataFormat":"svg","assetId":"cd21514d0531fdffb22204e0ec5ed84a","md5ext":"cd21514d0531fdffb22204e0ec5ed84a.svg","rotationCenterX":240,"rotationCenterY":180}],"sounds":[{"name":"pop","assetId":"83a9787d4cb6f3b7632b4ddfebf74367","dataFormat":"wav","format":"","rate":44100,"sampleCount":1032,"md5ext":"83a9787d4cb6f3b7632b4ddfebf74367.wav"}],"volume":100,"layerOrder":0,"tempo":60,"videoTransparency":50,"videoState":"on","textToSpeechLanguage":null},{"isStage":false,"name":"Sprite1","variables":{},"lists":{},"broadcasts":{},"blocks":{},"comments":{},"currentCostume":0,"costumes":[{"name":"costume1","bitmapResolution":1,"dataFormat":"svg","assetId":"bcf454acf82e4504149f7ffe07081dbc","md5ext":"bcf454acf82e4504149f7ffe07081dbc.svg","rotationCenterX":48,"rotationCenterY":50},{"name":"costume2","bitmapResolution":1,"dataFormat":"svg","assetId":"0fb9be3e8397c983338cb71dc84d0b25","md5ext":"0fb9be3e8397c983338cb71dc84d0b25.svg","rotationCenterX":46,"rotationCenterY":53}],"sounds":[{"name":"Meow","assetId":"83c36d806dc92327b9e7049a565c6bff","dataFormat":"wav","format":"","rate":44100,"sampleCount":37376,"md5ext":"83c36d806dc92327b9e7049a565c6bff.wav"}],"volume":100,"layerOrder":1,"visible":true,"x":0,"y":0,"size":100,"direction":90,"draggable":false,"rotationStyle":"all around"}],"monitors":[],"extensions":[],"meta":{"semver":"3.0.0","vm":"4.8.32","agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36"}}',
        "method": "POST",
        "mode": "cors"
    });

    console.log(newProject);

    newProject = await newProject.json();
    e = newProject["content-name"]; // Get the project ID from the response

    h = h + 1; // Increment the remix number
    console.log(h - 1); // Log the project's remix number
    console.log(e); // Log the project's id

    // Update the project that was just shared with the new title
    fetch('https://api.scratch.mit.edu/projects/' + e, { // Use the ID of the newly created project
        method: 'PUT',
        headers: {
            "X-CSRFToken": csrf,
            "x-token": xtoken,
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            title: projectTitle, // Use the new title
            instructions: "New instructions",
            description: "New Notes and Credits"
        })
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error('Error:', error));

    jsbomb(); // Call jsbomb again for the next remix
}

jsbomb(); // Start the process
