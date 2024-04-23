class TelaFinal {
  
  void displayCongratulationsMessage(int segundos, int milissegundos) {
    background(0);
    fill(0);// Clear the entire screen
    textSize(32);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Parabéns você ganhou!", width/2 , height/2 - 150);
    text("O seu tempo é de " + nf(segundos, 2) + ":" + nf(milissegundos, 3), width/2, height/2 + 50);
    clockRunning = false; // Stop the clock
  }
  
}
