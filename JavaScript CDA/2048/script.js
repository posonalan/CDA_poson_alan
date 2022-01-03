<<<<<<< HEAD
// document.getElementById("case1").innerHTML = "maison"; 

// function compareDiv() {

     var divClick1 =
        document.getElementById('case1').addEventListener(click, function(){})
          //  element
           var elt1 = this;
           // id de l'element
           var idElt1 = this.getAttribute('id');
        
        ;

        var divClick2 =
         document.getElementById('case3').addEventListener(click, function () {})
            // element
            var elt2 = this;
            // id de l'element
            var idElt2 = this.getAttribute('id');
        
        ;

=======
//Permet de gérer  les cases vides 
var tabCaseVide = ["case1", "case2", "case3", "case4", "case5", "case6", "case7", "case8", "case9", "case10", "case11", "case12", "case13", "case14", "case15", "case16"];

InitJeu();
compareDiv();

function InitJeu() {


  // On place des nombres aléatoires dans toutes les cases
  for (let i = 0; i < 16; i++) {
    aleatoire();
  }
>>>>>>> e78b815166b2f751431e41aa7e20ec341bcd76da

    //     var divClick1 = document.getElementById("case1");
    // var divClick2 = document.getElementById("case2");
    // var additionOk = true;

<<<<<<< HEAD
    document.getElementById("case2").innerHTML = (divClick1 + divClick2);


    // if (divClick1 == divClick2) {
    //     document.getElementById("case2").innerHTML = (divClick1 + divClick2);
    //     additionOk == true;
    // } else {
    //     additionOk = false;
    // }

// }

// function aleatoire() {

    var chiffreAleatoire = Math.random() * (4 - 2) + 2;

    var case1 = document.getElementById("case1");

    document.getElementById("case1").innerHTML = chiffreAleatoire;

// }

function random(min, max) {
    return Math.floor(Math.random() * (max - min) + min)

}

function score() {

    var scoreDebut = document.getElementById("score");

    scoreDebut.innerHTML++;

    document.getElementById("score").innerHTML = scoreDebut;
=======
function compareDiv() {

  var divClick1 = document.getElementById("case1");
  var divClick2 = document.getElementById("case2");
  var additionOk = true;
  if (divClick1.textContent == divClick2.textContent) {
    divClick2.textContent = (parseInt(divClick1.textContent) + parseInt(divClick2.textContent));
    additionOk == true;
  }
  else {
    additionOk = false;
  }
  alert(additionOk);
}

function aleatoire() {

  // math.random donne un nombre entre 0 et 1
  var chiffreAleatoire = Math.random() > 0.5 ? 2 : 4;
  //math.floor renvoi le nombre entier plus petit  (tronquer)
  var numCaseAleatoire = Math.floor(Math.random() * tabCaseVide.length);
  // On recupere la case associé au numero aleatoire
  var caseAlea = document.getElementById(tabCaseVide[numCaseAleatoire]);
  // on met le chiffre aleatoire dans la case
  caseAlea.textContent = chiffreAleatoire;
  // on retire la case du tableau des cases vides
  tabCaseVide.splice(numCaseAleatoire, 1);
}



function majScore() {

  var scoreDebut = document.getElementById("score");
  var score = scoreDebut.innerHTML;

  scoreDebut.innerHTML = ++ score ;
>>>>>>> e78b815166b2f751431e41aa7e20ec341bcd76da
}

function timer() {

<<<<<<< HEAD
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
=======
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
>>>>>>> e78b815166b2f751431e41aa7e20ec341bcd76da

}

function reinitTimer() {
<<<<<<< HEAD
    if (addiditionOk == true) {
        timer();
    } else {
        timer(0);
        console.log("Game over" + score);
    }
=======
  if (addiditionOk == true) {
    timer();
  }

  else {
    timer(0);
    console.log("Game over" + score);
  }
>>>>>>> e78b815166b2f751431e41aa7e20ec341bcd76da

}