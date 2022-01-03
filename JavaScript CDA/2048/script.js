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


    //     var divClick1 = document.getElementById("case1");
    // var divClick2 = document.getElementById("case2");
    // var additionOk = true;

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
    } else {
        timer(0);
        console.log("Game over" + score);
    }

}