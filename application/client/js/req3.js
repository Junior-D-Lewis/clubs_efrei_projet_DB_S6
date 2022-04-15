document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllEtatRapports')
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

    data.forEach(function ({id_club, nom, Rapports, Etats}) {
        tableHtml += "<tr>";
        tableHtml += `<td>${id_club}</td>`;
        tableHtml += `<td>${nom}</td>`;
        tableHtml += `<td>${Rapports}</td>`;
        tableHtml += `<td>${Etats}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}