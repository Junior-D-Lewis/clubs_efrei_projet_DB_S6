const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const path = require("path");
const loginRouter=require("./routes/login.js");
const getAllClubs=require("./routes/clubs.js");
const getAllEvenements=require("./routes/evenement.js");
const getAllEtatRapports = require("./routes/etatRapport.js");
const getAllMemberNotSign = require("./routes/memberNotSign.js");
const getAllStudentsToManyClubs = require("./routes/studentsToManyClubs.js");
const getAllExpensiveStains = require("./routes/expensiveStains.js");
const getAllEventToManyClubs = require("./routes/eventToManyClubs.js");
const getAllPraiseRewards = require("./routes/praiseRewards.js");
const getTopClub = require("./routes/topClub.js");
const getOneFaineant = require("./routes/oneFaineant.js");
const getAllFaineant = require("./routes/allFaineant.js");
const getAllPerf = require("./routes/allPerf.js");
const getOnePerf = require("./routes/onePerf.js");
const getAllTroubleFete = require("./routes/troubleFete.js");
const getAllVautMieuxAcheter = require("./routes/vautMieuxAcheter.js");
const getAllTaDay = require("./routes/toDay.js");
const getAllTeachersPet = require("./routes/teachersPet.js");
const getAllTopPresident = require("./routes/topPresidents.js");

const con=require('./db_config/db');

const app=express();

app.use(cors());
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(express.static(path.resolve('client')))

app.get('/', (req, res) => {
    res.sendFile('/index.html')
})

app.use('/login/:numero_Et',(request, response) => {
    const { numero_Et } = request.params
    const result = loginRouter(numero_Et);
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
});

app.get('/getAllClubs', (request, response) => {
    console.log("getAllClubs");

    const result = getAllClubs();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllEtatRapports', (request, response) => {
    console.log("getAllEtatRapports");

    const result = getAllEtatRapports();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllEvenements', (request, response) => {
    console.log("getAllEvenements");

    const result = getAllEvenements();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllStudentsToManyClubs', (request, response) => {
    console.log("getAllStudentsToManyClubs");

    const result = getAllStudentsToManyClubs();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllEventToManyClubs', (request, response) => {
    console.log("getAllEventToManyClubs");

    const result = getAllEventToManyClubs();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllExpensiveStains', (request, response) => {
    console.log("getAllExpensiveStains");

    const result = getAllExpensiveStains();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllMemberNotSign', (request, response) => {
    console.log("getAllMemberNotSign");

    const result = getAllMemberNotSign();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllPraiseRewards', (request, response) => {
    console.log("getAllPraiseRewards");

    const result = getAllPraiseRewards();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getTopClub', (request, response) => {
    console.log("getTopClub");

    const result = getTopClub();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.use('/getAllFaineant/',(request, response) => {
    console.log("getAllFaineant");
    const result = getAllFaineant();
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
});


app.use('/getOneFaineant',(request, response) => {
    let  nom_club  = request.query.nom_club
    //console.log(request)
    console.log(request.query)
    console.log(request.query.nom_club)
    const result = getOneFaineant(nom_club);
    console.log(result)
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
});

app.use('/getAllPerf/',(request, response) => {
    console.log("getAllPerf");
    const result = getAllPerf();
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
});


app.use('/getOnePerf',(request, response) => {
    let  nom_club  = request.query.nom_club
    //console.log(request)
    console.log(request.query)
    console.log(request.query.nom_club)
    const result = getOnePerf(nom_club);
    console.log(result)
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
});

app.get('/getAllTroubleFete', (request, response) => {
    console.log("getAllTroubleFete");

    const result = getAllTroubleFete();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllVautMieuxAcheter', (request, response) => {
    console.log("getAllVautMieuxAcheter");

    const result = getAllVautMieuxAcheter();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllVautMieuxAcheter', (request, response) => {
    console.log("getAllVautMieuxAcheter");

    const result = getAllVautMieuxAcheter();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllTaDay', (request, response) => {
    console.log("getAllTaDay");

    const result =  getAllTaDay();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllTeachersPet',(request, response) => {
    console.log("getAllTeachersPet");
    const result =  getAllTeachersPet();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/getAllTopPresident',(request, response) => {
    console.log("getAllTopPresident");
    const result =  getAllTopPresident();
    
    result
    .then(data => response.json({data : data}))
    .catch(err => console.log(err));
})

app.get('/deconnexion',(req,res)=>{
    console.log(`${req.session.user.nom} vient de se deconnecter`);
    req.session.destroy();
    res.status(200).send("Deconnecté");
})

module.exports=app;