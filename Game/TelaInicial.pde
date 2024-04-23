//Variáveis
String aluno = "Thomas Rempel";
String instrucao = "Para pular, use o botão do Mouse. Não encoste nos objetos vermelhos e para chegar ao final, será necessário pegar a moeda amarela.\nTente fazer no menor tempo possível. Boa sorte!!";
boolean telaInicial = true;
boolean jogando = false;
float botaoX = 437.5;
float botaoY = 300;
float botaoLargura = 150;
float botaoAltura = 80;
int tempoInicio;
int tempoDecorrido;
int segundosAnteriores = -1;
int milissegundosAnteriores = -1;


void desenharTelaInicial() {
  clockRunning = true; 
  background(0);
  textSize(32);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Aluno: " + aluno, width/2, 50);
  textSize(28);
  fill(255); 
  text("Instruções", width/2, height - 200); 
  textSize(18);
  fill(255);
  text(instrucao, width/2, height - 150);
  
  // Desenha o botão
  stroke(255);
  fill(0);
  rect(botaoX, botaoY, botaoLargura, botaoAltura);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Jogar", botaoX + botaoLargura/2, botaoY + botaoAltura/2);
}


void verificarCliqueBotaoJogar() {
  if (mouseX > botaoX && mouseX < botaoX + botaoLargura && mouseY > botaoY && mouseY < botaoY + botaoAltura) {
    telaInicial = false;
    jogando = true;
    background(0); 
  }
}

void atualizarCronometro() {
  if (clockRunning) { 
    tempoDecorrido = millis() - tempoInicio;
    int segundos = tempoDecorrido / 1000;
    int milissegundos = tempoDecorrido % 1000;
    if (segundos != segundosAnteriores || milissegundos != milissegundosAnteriores) {
      fill(0);
      noStroke();
      rect(width - 110, 0, 90, 40); 
      fill(255);
      textSize(20);
      textAlign(RIGHT, TOP);
      String tempoFormatado = nf(segundos, 2) + ":" + nf(milissegundos, 3);
      text(tempoFormatado, width - 20, 20); 
      segundosAnteriores = segundos;
      milissegundosAnteriores = milissegundos;
    }
  }
}

void mousePressed() {
  if (telaInicial && mouseX > botaoX && mouseX < botaoX + botaoLargura && mouseY > botaoY && mouseY < botaoY + botaoAltura) {
    telaInicial = false;
    jogando = true;
    tempoInicio = millis(); 
    background(0);
  } else if (jogando) {
    ball.jump();
  }
}
