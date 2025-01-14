// main.js

window.addEventListener('message', function(event) {
    if (event.data.action == "setValue") {
        // Tarkistetaan, että tiedot tulevat oikeassa muodossa
        if (event.data.key == "job") {
            setJobIcon(event.data.value);
        } 
        setValue(event.data.key, event.data.value);
    } 
});

function setValue(key, value) {
    if (key == "cash") {
        if (value) {
            $('#money span').html(value);  // Päivitetään käteinen raha
        } else {
            $('#money span').html('$0');  // Jos arvo ei ole saatavilla, asetetaan $0
        }
    } else if (key == "bankmoney") {
        $('#bankmoney span').html(value);
    } else if (key == "job") {
        $('#job span').html(value);  // Päivitetään työ
    } else if (key == "gang") {
        $('#gang span').html(value);  // Jengi
    }
}

function setJobIcon(job) {
    var jobIcon = 'img/jobs/' + job + '.png';  // Oletetaan, että kuvat ovat kansiossa img/jobs
    $('#job img').attr('src', jobIcon);  // Päivitetään työn ikoni
}

window.addEventListener("message", function(event) {
    if (event.data.type === "PaivitaAlaVari") {
        document.documentElement.style.setProperty("--ala-color", hexToRgba(event.data.alaColor, event.data.alaOpacity));
    }

    if (event.data.type === "PaivitaYlaVari") {
        document.documentElement.style.setProperty("--yla-color", hexToRgba(event.data.ylaColor, event.data.ylaOpacity));
    }
});

function hexToRgba(hex, alpha) {
    const r = parseInt(hex.substring(1, 3), 16);
    const g = parseInt(hex.substring(3, 5), 16);
    const b = parseInt(hex.substring(5, 7), 16);
    return `rgba(${r}, ${g}, ${b}, ${alpha})`;
}
