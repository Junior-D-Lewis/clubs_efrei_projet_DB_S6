document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllTopPresident')
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

    data.forEach(function ({nom, description, Type_Club, President, annee}) {
        tableHtml += "<tr>";
        tableHtml += `<td>${nom}</td>`;
        tableHtml += `<td>${description}</td>`;
        tableHtml += `<td>${Type_Club}</td>`;
        tableHtml += `<td>${President}</td>`;
        tableHtml += `<td>${annee.substr(0,10)}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}