document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllPerf/')
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

    data.forEach(function ({numero_Et, nom, Club, date_Debut, POSTE}) {
        tableHtml += "<tr>";
        tableHtml += `<td>${numero_Et}</td>`;
        tableHtml += `<td>${nom}</td>`;
        tableHtml += `<td>${Club}</td>`;
        tableHtml += `<td>${date_Debut}</td>`;
        tableHtml += `<td>${POSTE}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}

document.querySelector('#input_search').addEventListener("input", () => {
        //alert("DOMContentLoaded");
        const nom_club = document.querySelector('#input_search').value;
        let url = 'http://localhost:3000/getOnePerf?nom_club=' + nom_club;
        //alert(url);
        fetch(url , {
            method: 'GET',
            headers:{'Authorization': 'Basic APIToken'} ,
        })
        .then(response => response.json())
        .then(data => loadHTMLTable(data['data']));
   
})
function testing(data){console.log(data);}