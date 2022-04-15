document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllFaineant/')
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

    data.forEach(function ({numero_Et, nom_membre, date_signature, nom_club}) {
        tableHtml += "<tr>";
        tableHtml += `<td>${numero_Et}</td>`;
        tableHtml += `<td>${nom_membre}</td>`;
        tableHtml += `<td>${date_signature.substr(0,10)}</td>`;
        tableHtml += `<td>${nom_club}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}

document.querySelector('#input_search').addEventListener("input", () => {
        //alert("DOMContentLoaded");
        const nom_club = document.querySelector('#input_search').value;
        let url = 'http://localhost:3000/getOneFaineant?nom_club=' + nom_club;
        //alert(url);
        fetch(url , {
            method: 'GET',
            headers:{'Authorization': 'Basic APIToken'} ,
        })
        .then(response => response.json())
        .then(data => loadHTMLTable(data['data']));
   
})
function testing(data){console.log(data);}