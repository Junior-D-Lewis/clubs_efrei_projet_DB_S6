document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllPraiseRewards')
    .then(response => response.json())
    .then(data => loadHTMLTable(data['data']));
    
});

function loadHTMLTable(data) {
    //alert("loadHTMLTable");
    let table = document.querySelector('table tbody');

    if (data === undefined || data.length === 0) {  
        table.innerHTML = "<tr><td class='no-data' colspan='9 '>No Data</td></tr>";
        return;
    }

    let tableHtml = "";

    data.forEach(function ({libelle, Allouee_A, Provient_De}) {
        tableHtml += "<tr>";
        tableHtml += `<td>${libelle}</td>`;
        tableHtml += `<td>${Allouee_A}</td>`;
        tableHtml += `<td>${Provient_De}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}