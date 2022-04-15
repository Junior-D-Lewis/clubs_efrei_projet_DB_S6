document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllEvenements')
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

    data.forEach(function ({Id_evenement, nom, date_debut, Id_Comite_Organisation, budget, Montant_depenses, Membres_Comite }) {
        tableHtml += "<tr>";
        tableHtml += `<td>${Id_evenement}</td>`;
        tableHtml += `<td>${nom}</td>`;
        tableHtml += `<td>${date_debut}</td>`;
        tableHtml += `<td>${Id_Comite_Organisation}</td>`;
        tableHtml += `<td>${budget}</td>`;
        tableHtml += `<td>${Montant_depenses}</td>`;
        tableHtml += `<td>${Membres_Comite}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}