function calculerIMC() {

    const poidsInput = document.getElementById("imc-poids");
    const tailleInput = document.getElementById("imc-taille");

    const poids = Number(poidsInput.value);
    const taille = Number(tailleInput.value);

    if (
        poidsInput.value === "" ||
        tailleInput.value === "" ||
        !Number.isFinite(poids) ||
        !Number.isFinite(taille) ||
        poids <= 0 ||
        taille <= 0
    ) {
        alert("Veuillez entrer un poids et une taille valides.");
        return;
    }

    if (!poidsInput.checkValidity() || !tailleInput.checkValidity()) {
        alert("Le poids doit être entre 20 et 300 kg et la taille entre 0.5 et 2.5 m.");
        return;
    }

    const imc = poids / (taille * taille);

    document.getElementById("imc-valeur").textContent = imc.toFixed(1);

    let categorie;

    if (imc < 18.5) {
        categorie = "Sous-poids";
    } else if (imc < 25) {
        categorie = "Normal";
    } else if (imc < 30) {
        categorie = "Surpoids";
    } else {
        categorie = "Obésité";
    }

    document.getElementById("imc-categorie").textContent = categorie;
}

document.getElementById("imc-calculer")
    .addEventListener("click", calculerIMC);
