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
        $('#job span').html(value);  // Päivitetään työ ja arvo
    } else if (key == "grade") {
        $('#grade span').html(value);  // Päivitetään työarvo
    }
}

function setJobIcon(job) {
    var jobIcon = 'img/jobs/' + job.split(' ')[0].toLowerCase() + '.png';
    if ($('#job img').length) {  // Varmistetaan, että kuvaelementti on olemassa
        $('#job img').attr('src', jobIcon);
    }
}
