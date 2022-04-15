document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllExpensiveStains')
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

    data.forEach(function ({description_taches, Prix, Rapports, Responsable}) {
        tableHtml += "<tr>";
        tableHtml += `<td>${description_taches}</td>`;
        tableHtml += `<td>${Prix}</td>`;
        tableHtml += `<td>${Responsable}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}