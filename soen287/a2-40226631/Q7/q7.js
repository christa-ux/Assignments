function updateDateTime() {
    const now = new Date();
    const dateTimeString = now.toLocaleString();
    document.getElementById('date-time').innerText = dateTimeString;
}

setInterval(updateDateTime, 1000);
updateDateTime(); 
