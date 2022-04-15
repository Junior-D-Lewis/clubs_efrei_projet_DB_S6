document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllEventToManyClubs')
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

    data.forEach(function ({Id_Evenement, nom, Responsable, Poste, Durrée_Comite}) {
        tableHtml += "<tr>";
        tableHtml += `<td>${Id_Evenement}</td>`;
        tableHtml += `<td>${nom}</td>`;
        tableHtml += `<td>${Responsable}</td>`;
        tableHtml += `<td>${Poste}</td>`;
        tableHtml += `<td>${Durrée_Comite}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}