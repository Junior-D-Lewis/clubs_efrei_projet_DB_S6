document.addEventListener('DOMContentLoaded', function () {
        //alert("DOMContentLoaded");
        fetch('http://localhost:3000/getAllTaDay')
    .then(response => response.json())
    .then(data => loadHTMLTable(data['data']));
        
    });
    
    function loadHTMLTable(data) {
        //alert("loadHTMLTable");
        let table = document.querySelector('table tbody');
    
        if (data === undefined || data.length === 0 ) {  
            table.innerHTML = "<tr><td class='no-data' colspan='9 '>No Data</td></tr>";
            return;
        }
    
        let tableHtml = "";
    
        data.forEach(function ({nom, Club_Responsable, heure_debut}) {
            tableHtml += "<tr>";
            tableHtml += `<td>${nom}</td>`;
            tableHtml += `<td>${Club_Responsable}</td>`;
            tableHtml += `<td>${heure_debut}</td>`;
            tableHtml += "</tr>";
        });
    
        table.innerHTML = tableHtml;
    }

function loadHTMLTable(data) {
    //alert("loadHTMLTable");
    let table = document.querySelector('table tbody');

    if (data === undefined || data.length === 0) {  
        table.innerHTML = "<tr><td class='no-data' colspan='9 '>No Data</td></tr>";
        return;
    }

    let tableHtml = "";

    data.forEach(function ({nom, Club_Responsable, heure_debut}) {
        tableHtml += "<tr>";
        tableHtml += `<td>${nom}</td>`;
        tableHtml += `<td>${Club_Responsable}</td>`;
        tableHtml += `<td>${heure_debut}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}