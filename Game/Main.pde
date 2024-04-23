float startTime = 0;
Ball ball = new Ball(100, 600, 150, 250, 200);
Platform p2 = new Platform(650, 500, 390, 20); 
Platform p1 = new Platform(0, 625, 1024, 100); 
Platform p3 = new Platform(250, 300, 300, 20); 
Platform p4 = new Platform(0, 300, 150, 20); 
Platform p5 = new Platform(650, 150, 450, 20);  
Platform e1 = new Platform(890, 450, 200, 50); 
Platform e2 = new Platform(150, 250, 100, 50); 
Ball newBall = new Ball(30, 600, 150, 250, 150); // Inimigo
Platform newPlatform = new Platform(880, 80, 50, 70); // Porta Final
boolean collisionOccurred = false;
boolean clockRunning = true;

void setup() {
  size(1024, 768);
  startTime = millis();
}

void draw() {
  float elapsedTime = (millis() - startTime) / 1000f;
  startTime = millis();

  if (telaInicial) {
    desenharTelaInicial();
  } else {
    background(0);
    update(elapsedTime);
    render();
    if (jogando) { 
      atualizarCronometro(); 
    }
  }
}


void update(float et) {
  
  // Checar Colisão entre bola e Inimigos e sair do jogo
  if (ballCollisionWithNewBall() || ballCollisionWithE1() || ballCollisionWithE2()) {
    exit();
  } 
  
  // Checar Colisão entre bola e Porta Final
if (ballCollisionWithNewPlatform()) {
  int segundos = tempoDecorrido / 1000;
  int milissegundos = tempoDecorrido % 1000;
  TelaFinal telaFinal = new TelaFinal(); 
  telaFinal.displayCongratulationsMessage(segundos, milissegundos); 
  clockRunning = false;
  } else {
    // Atualização dos objetos existentes apenas se não houver colisão
    ball.update(et);
    p1.update(et);
    p1.verifyCollision(ball);
    p2.update(et);
    p2.verifyCollision(ball);
    p3.update(et);
    p3.verifyCollision(ball);
    p4.update(et);
    p4.verifyCollision(ball);
    p5.update(et);
    p5.verifyCollision(ball);
    e1.update(et);
    e1.verifyCollision(ball);
    e2.update(et);
    e2.verifyCollision(ball);
    newBall.update(et);
    newPlatform.update(et);
    newPlatform.verifyCollision(newBall);
  }
}

void render() {
  fill(100, 40, 100);
  ball.render();
  fill(0, 255, 30);
  p1.render();
  fill(255);
  p2.render();
  p3.render();
  p4.render();
  p5.render();
  fill(255, 0, 0); 
  e1.render();
  e2.render();
  newBall.render();
  fill(92, 64, 51); 

  // Checa colsão entre bola e moeda e se sim, chama Porta Final
  if (ballCollidesWithEllipse() || (ball.getX() == 60 && ball.getY() == 270)) {
    if (!collisionOccurred) { 
      fill(100, 50, 0);
      newPlatform.render();
      fill(255);
      collisionOccurred = true; 
    } else { 
      fill(100, 50, 0);
      newPlatform.render();
      fill(255);
    }
  } else if (collisionOccurred) { 
    fill(100, 50, 0);
    newPlatform.render();
    fill(255);
  } else {
    fill(255, 255, 0); 
  }
  ellipse(60, 270, 25, 25); 
  fill(255);
}
