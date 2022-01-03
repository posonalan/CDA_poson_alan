


function compareDiv(){

    var divClick1 = document.getElementById("case1"); 
    var divClick2 = document.getElementById("case2"); 
    var additionOk = true; 
    if ( divClick1 == divClick2 ) {
        document.getElementById("case2").textContent = (divClick1 + divClick2);
    additionOk == true; 
    }
    else{
        additionOk = false;
    }

}

function aleatoire(){

    var chiffreAleatoire =  Math.random() * (4 - 2) + 2 ;

    var case1 = document.getElementById("case1"); 

    document.getElementById("case1").textContent = chiffreAleatoire; 
    
}

function random(min, max){
    return Math.floor(Math.random() * (max - min) + min)
    
}

function score(){

    var scoreDebut = document.getElementById("score"); 
    
     scoreDebut.innerHTML++ ; 

    document.getElementById("score").innerHTML = scoreDebut; 
}

function timer(){

// const departMinutes = 5
// let temps = departMinutes * 60

const departSeconde = 10
let temps = departSeconde 
const timerElement = document.getElementById("timer")

setInterval(() => {
//   let minutes = parseInt(temps / 60, 10)
  let secondes = parseInt(temps % 60, 10)

//   minutes = minutes < 10 ? "0" + minutes : minutes
  secondes = secondes < 10 ? "0" + secondes : secondes

//   timerElement.innerText = `${minutes}:${secondes}`
  timerElement.innerText = `${secondes}`

  temps = temps <= 0 ? 0 : temps - 1
}, 1000)

}

function reinitTimer()
{
    if ( addiditionOk == true ){
      timer(); 
    }

    else {
        timer(0);
        console.log("Game over"+score); 
    }

}

