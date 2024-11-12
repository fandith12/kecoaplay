import java.util.ArrayList;
import processing.sound.*;

ArrayList<kecoa> cocroaches;
ArrayList<darah> blood;
SoundFile soundFX;
SoundFile soundBG;
int lastSpawnTime;
int spawnInterval = 5000;
PImage imgdarah;


void setup() {
  size(800, 600);
  cocroaches = new ArrayList<kecoa>();
  blood = new ArrayList<darah>();
  soundFX = new SoundFile(this, "hit.wav");
  soundBG = new SoundFile(this, "halloween.WAV");
  soundBG.loop();
}

void draw() {
  background(255);
  
  fill(51);  
  textSize(16); 
  textAlign(LEFT, TOP);  
  text("Nama : Mantri Kromo Fandith Fili\n" +
       "NIM : 24.66.1013\n" +
       "Kelas : Pertukaran Mahasiswa\n" +
       "Mata Kuliah : Media Interaktif", 50, 10);
  
  for (kecoa c : cocroaches) {
    c.live();
  }
  
  if (millis() - lastSpawnTime > spawnInterval) {
    cocroaches.add(new kecoa(random(width), random(height)));
    lastSpawnTime = millis();
  }
  
  for (int i = blood.size() - 1; i >= 0; i--) {
    darah b = blood.get(i);
    b.display();
    if (b.isFaded()) {
      blood.remove(i);   
    }
  }
 
}

void mousePressed() {
  for (int i = cocroaches.size() - 1; i >= 0; i--) {
    kecoa c = cocroaches.get(i);
    if (c.isHit(mouseX, mouseY)) {
      cocroaches.remove(i);
      soundFX.play();
      
      blood.add(new darah(imgdarah, c.pos.x, c.pos.y));
    }
  }
}
