document.addEventListener('DOMContentLoaded', function () {
    //alert("DOMContentLoaded");
    fetch('http://localhost:3000/getAllClubs')
    .then(response => response.json())
    .then(data => loadHTMLTable(data['data']));
    
});
async function btn_log() {  
    const numero_Et = ""+document.getElementById("numero_Et").value;
    fetch('http://localhost:3000/login/' + numero_Et)
    .then(response => response.json())
    .then(data => login(data['data']));
}
const login = (data) => {
//alert('-##################'+data.length);
    if(data.length > 0){
   //     console.log('data is present');
        var url= "http://localhost:3000/pages/home.html"; 
        window.location = url;
    }else{
        alert("Login ou mot de passe incorrect");
    }
}

const goToViews = () => {
    console.log("GO TO VIEWS");
    var url= "http://localhost:3000/views/views.html"; 
    window.location = url;
}

const goToRequetes = () => {
    console.log("GO TO REQUETES");
    var url= "http://localhost:3000/pages/requetes.html"; 
    window.location = url;
}

function loadHTMLTable(data) {
    //alert("loadHTMLTable");
    let table = document.querySelector('table tbody');

    if (data === undefined || data.length === 0) {  
        table.innerHTML = "<tr><td class='no-data' colspan='9 '>No Data</td></tr>";
        return;
    }

    let tableHtml = "";

    data.forEach(function ({id_Club, nom, description, Type_Club, numero_Et, President, classe, niveau }) {
        tableHtml += "<tr>";
        tableHtml += `<td>${id_Club}</td>`;
        tableHtml += `<td>${nom}</td>`;
        tableHtml += `<td>${description}</td>`;
        tableHtml += `<td>${Type_Club}</td>`;
        tableHtml += `<td>${numero_Et}</td>`;
        tableHtml += `<td>${President}</td>`;
        tableHtml += `<td>${classe}</td>`;
        tableHtml += `<td>${niveau}</td>`;
        tableHtml += "</tr>";
    });

    table.innerHTML = tableHtml;
}