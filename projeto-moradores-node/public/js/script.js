function bloqueado(moderador){
    if(moderador == true){
        window.location.href = "./cadastro_demanda.html";
        console.log("moderador true")
    }
    else{
        alert("Você precisa ser moderador para fazer uma demanda!");
    }
}