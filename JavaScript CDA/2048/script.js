//Permet de gérer  les cases vides 
var tabCaseVide = ["case1", "case2", "case3", "case4", "case5", "case6", "case7", "case8", "case9", "case10", "case11", "case12", "case13", "case14", "case15", "case16"];

InitJeu();
compareDiv();

function InitJeu() {


  // On place des nombres aléatoires dans toutes les cases
  for (let i = 0; i < 16; i++) {
    aleatoire();
  }

}

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
}

function timer() {

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

function reinitTimer() {
  if (addiditionOk == true) {
    timer();
  }

  else {
    timer(0);
    console.log("Game over" + score);
  }

}

