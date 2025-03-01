class Firework {
  PVector position;
  ArrayList<Particle> particles;
  boolean exploded;
  
  Firework(float x, float y) {
    position = new PVector(x, y);
    particles = new ArrayList<Particle>();
    exploded = false;
    explode();
  }
  
  void update() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isFinished()) {
        particles.remove(i);
      }
    }
  }
  
  void explode() {
    exploded = true;
    for (int i = 0; i < 70; i++) {
      particles.add(new Particle(position.x, position.y));
    }
  }
  
  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }
  
  boolean isFinished() {
    return exploded && particles.isEmpty();
  }
}

class Particle {
  PVector position;
  PVector velocity;
  float lifespan;
  color col;
  
  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.random2D().mult(random(1, 5));
    lifespan = 255;
    col = color(random(150, 255), random(50, 150), 0);
  }
  
  void update() {
    position.add(velocity);
    lifespan -= 4;
  }
  
  void display() {
    stroke(col, lifespan);
    strokeWeight(5);
    point(position.x, position.y);
  }
  
  boolean isFinished() {
    return lifespan < 0;
  }
}
class Ring {
  float x, y, r, g;
  int time;

  Ring(float x, float y, float r, float g, int time) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.time = time;
  }
}
class Circle {
    float x, y;
    float speedX, speedY;

    Circle(float x, float y) {
        this.x = x;
        this.y = y;
        speedX = random(-2, 2);
        speedY = random(-2, 2);
    }

    void move() {
        x += speedX;
        y += speedY;

        if (x < 0 || x > width) speedX *= -1;
        if (y < 0 || y > height) speedY *= -1;
    }

    void display() {
        fill(52, 152, 219);
        noStroke();
        ellipse(x, y, 20, 20);
    }
}
class Spark {
  PVector loc;
  PVector vel;
  PVector acc;
  
  float angle;
  
  int baseColor;
  
  Spark() {
    loc = new PVector(mouseX, mouseY);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    baseColor = (int) random(0, 360);
  }
  
  void update() {
    
    angle += random(0, TWO_PI);
   
    float magni = random(0, 3);
    
    acc.x += cos(angle) * magni;
    acc.y += sin(angle) * magni;
    
    acc.limit(3);
    
    vel.add(acc);
    vel.limit(6);
    
    loc.add(vel);
    
   
    if (loc.x > width)
      loc.x -= width;
    if (loc.x < 0)
      loc.x += width;
    if (loc.y > height)
      loc.y -= height;
    if (loc.y < 0)
      loc.y += height;
  }
  
  void display() {
   
    stroke((baseColor + millis() / 25.0) 
        % 360, 80, 80, 204);
    strokeWeight(15);
    
    point(loc.x, loc.y);
  }
}
