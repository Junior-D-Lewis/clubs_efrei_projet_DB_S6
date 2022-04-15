document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllMemberNotSign')
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

    data.forEach(function ({Id_rapport, Membres, Classe, Niveau }) {
        tableHtml += "<tr>";
        tableHtml += `<td>${Id_rapport}</td>`;
        tableHtml += `<td>${Membres}</td>`;
        tableHtml += `<td>${Classe}</td>`;
        tableHtml += `<td>${Niveau}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}