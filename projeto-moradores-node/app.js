const express = require("express");
const app = express();

app.use(express.static(__dirname + '/public'));

app.set('view engine', 'ejs')

const mysql = require('mysql')

const bodyParser = require('body-parser')

app.use(bodyParser.urlencoded({extend:true}))
        app.use(bodyParser.json())
    
const connection = mysql.createConnection({
    host: 'localhost', 
    user: 'root',
    password: '',
    database: 'teste2-squad'
})  

app.get('/', function (req,res){

    res.render('home/index');   
    
});

app.get('/quemsomos', function (req,res){
    res.render('pages/quem-somos');   
    
});

app.get('/comoajudar', function (req,res){

    res.render('pages/como-ajudar');   
    
});

app.get('/moderadores', function (req,res){

    res.render('pages/moderadores');   
    
});

app.get('/demandas', function (req,res){

    // Comando SQL para manusear o BD
    connection.query("select * from demanda", (error, result) => {
        res.render("pages/demandas", { dados: result });
    
      });
 
});

app.get('/novademanda', function (req,res){

    res.render('pages/nova-demanda');   
    
});

// app.post('/novademanda', function (req,res){

//     let dadosNovaDemanda = []

//     dadosNovaDemanda.push({
//         nomemoderador: req.body.nomemoderador,
//         endereco: req.body.endereco,
//         telefone: req.body.telefone,
//         email: req.body.email,
//         senha: req.body.senha,
//         termos: req.body.termos
//     })
    
app.get('/detalhes-demanda', function (req,res){

    res.render('pages/detalhes-demanda');   
    
});


app.get('/cadastro-moderadores', function (req,res){

    res.render('pages/cadastro-modera');   
    
});

app.post('/cadastro-moderadores', function (req,res){

    let dados_modera = []

    dados_modera.push({
        nomemoderador: req.body.nomemoderador,
        endereco: req.body.endereco,
        telefone: req.body.telefone,
        email: req.body.email,
        senha: req.body.senha,
        termos: req.body.termos
    })


    // Comando SQL para manusear o BD
    connection.query("INSERT INTO moderador SET ?", dados_modera, () => {
        res.redirect("/");
        dados_modera = []

      });
    
});

app.get('/contato', function (req,res){

    res.render('pages/fale-conosco');   
    
});

app.post('/contato', function (req,res){

    let dados_mens = []

    dados_mens.push({
        cttnome: req.body.cttnome,
        cttemail: req.body.cttemail,
        cttassunto: req.body.cttassunto,
        textomensagem: req.body.textomensagem
    })


    // Comando SQL para manusear o BD
    connection.query("INSERT INTO mensagens SET ?", dados_mens, () => {
        res.redirect("/");
        dados = []
    
      });
    
});


app.listen(1910, () => {
  console.log("O servidor subiu na porta 1910");
});





