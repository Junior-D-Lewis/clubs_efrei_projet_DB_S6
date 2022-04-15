document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllStudentsToManyClubs')
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

    data.forEach(function ({numero_Et, nom, Club, Position}) {
        tableHtml += "<tr>";
        tableHtml += `<td>${numero_Et}</td>`;
        tableHtml += `<td>${nom}</td>`;
        tableHtml += `<td>${Club}</td>`;
        tableHtml += `<td>${Position}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}