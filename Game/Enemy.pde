// Verifica a colisão entre a bola e a nova bola
boolean ballCollisionWithNewBall() {
  float distance = dist(ball.getX(), ball.getY(), newBall.getX(), newBall.getY());
  return distance < (ball.getR() + newBall.getR());
}

// Verifica a colisão entre a bola e a plataforma inimigo 1
boolean ballCollisionWithE1() {
  float e1Left = e1.getX() -25 ;
  float e1Right = e1.getX() + e1.getW();
 float e1Top = e1.getY() - ball.getR();
  float e1Bottom = e1.getY() + 50;
  return ball.getX() >= e1Left && ball.getX() <= e1Right &&
         ball.getY() >= e1Top && ball.getY() <= e1Bottom;
}

// Verifica a colisão entre a bola e a plataforma inimigo 2
boolean ballCollisionWithE2() {
  float e2Left = e2.getX() - 25; 
  float e2Right = e2.getX() + e2.getW() + 28;
  float e2Top = e2.getY() - ball.getR();
  float e2Bottom = e2.getY() + 50; 
  return ball.getX() >= e2Left && ball.getX() <= e2Right &&
         ball.getY() >= e2Top && ball.getY() <= e2Bottom;
}
