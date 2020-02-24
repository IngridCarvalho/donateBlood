//configurando o servidor
const express = require("express");
const server = express();

//configurar o servidor para apresentar arquivos estáticos

server.use(express.static('public'));

// habilitar body o form
server.use(express.urlencoded({ extended: true }))

//configurar a conexaão com o bd
const Pool = require('pg').Pool;
const db = new Pool({
    user: "postgres",
    password: "postgres",
    host: "localhost",
    port: 5432,
    database: "doe"
});

//configurando a template engine
const nunjucks = require("nunjucks");
nunjucks.configure("./", {
    express: server,
    noCache: true,
});

//configurar a apresentação da página
server.get("/", function(req, res){
    db.query("SELECT * FROM donors", function(err, result){
        if(err) return res.send("index.html", { donors });

        const donors = result.rows;
        return res.render("index.html", { donors });
    })
});

server.post("/", function(req, res){
    //PEGAR DADOS DO FORM
    const name = req.body.name;
    const email = req.body.email;
    const blood = req.body.blood;

    if(name == "" || email == "" || blood == ""){
        return res.send("Todos os campos são obrigatórios!")
    }

    // coloco valores dentro do bd
    const query = `
        INSERT INTO donors ("name", "email", "blood") 
        VALUES ($1, $2, $3)`;

    const values = [name, email, blood];
    db.query(query, values, function(err){
        if(err){
            console.log(err);
            return res.send("erro no bando de dados");  
        } 

        return res.redirect("/");
    });

})

//ligar o servidor e permitir o acesso a porta 3000
server.listen(3000, function(){
    console.log("iniciei o servidor");
});