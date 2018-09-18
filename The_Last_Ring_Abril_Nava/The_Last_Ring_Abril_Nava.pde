
final int INICIO = 0,
          SELECCION = 1,
          MUNDO     = 2,
          COMBATE   = 3,
          FIN       = 4; 
int       estado = -1;

Personaje personaje;
ArrayList <Enemigo> enemigos;
ArrayList <Vida> vidas;

Fondo     fondo;
PFont     fuente,fuentetitulo,
          fuentemundo,fuentescore,fuenteinstrucciones,
          fuentecombate;

Avatar    []avatarseleccion = {null,null,null,null,null};
String    []avatarnombre    = {"Gandalf","Gollum","Barbol","Gilraen","Sauron"};
Avatar      avatarselector  = null;
int         seleccion       = 0; 

float     []aparicionenemigotiempos = {2.0f,10.0f};
float       aparicionenemigotiempo  = 2.0f,
            tiempoenemigo           = 0.0f;
int         enemigosapariciones     = 5;

float     []aparicionvidatiempos         = {2.0f,10.0f};
float       aparicionvidatiempo          = 2.0f,
            tiempovida          = 0.0f;
int         vidaapariciones     = 10;

int         combateenemigo = 0;

float     []combateenemigotiempos = {2.0f,10.0f};
float       combateenemigotiempo  = 2.0f;


void setup(){
  size(818,460);
  
  personaje = new Personaje(0);
  fondo     = new Fondo(INICIO);   
  
  estado = INICIO;
  fuente         = createFont("fuente.ttf", 40);
  fuentetitulo   = createFont("fuente.ttf", 64);
  fuentemundo    = createFont("fuente.ttf", 12);
  fuentescore    = createFont("fuente.ttf", 20);  
  fuenteinstrucciones    = createFont("fuente.ttf", 15);
  fuentecombate  = createFont("fuente.ttf", 32);

  for(int i = 0;i<avatarseleccion.length;i++)
    avatarseleccion[i] = new Avatar(i);
  
  seleccion = 0;
  avatarselector = new Avatar(seleccion);
  
  enemigos = new ArrayList<Enemigo>();  
  vidas    = new ArrayList<Vida>();
  
  import ddf.minim.*;

Minim gestor;
AudioPlayer musica_fondo;

{
  gestor= new Minim(this);
  musica_fondo= gestor.loadFile("Lord of the Rings 8bits.mp3");
  musica_fondo.setGain(-10);
  musica_fondo.loop();
} 
  
}

void draw(){
  
  background(255);  
  fondo.display();
  
  switch(estado){
    case INICIO:
      InicioDraw();  
    break;
    case SELECCION:
      SeleccionDraw();  
    break;
    case MUNDO:
      MundoDraw();  
    break;
    case COMBATE:
      CombateDraw();  
    break;
    case FIN:
      FinDraw();  
    break;

  }
  
  
  
}

void setestado(int estado){

  if(this.estado == SELECCION)
      personaje.setseleccion(seleccion);
  
  this.estado = estado;
  fondo.setseleccion(estado);

  if(estado==MUNDO){    
    tiempoenemigo = tiempovida = 0;
    aparicionenemigotiempo = random(aparicionenemigotiempos[0],aparicionenemigotiempos[1]);
    aparicionvidatiempo = random(aparicionvidatiempos[0],aparicionvidatiempos[1]);
  }
  if(estado==COMBATE){    
    tiempoenemigo = 0;
    combateenemigotiempo = random(combateenemigotiempos[0],combateenemigotiempos[1]);
  }
    
}


void keyPressed(){
  
  switch(estado){
    
    case INICIO:
      InicioKey();
    break;
    case SELECCION:
      SeleccionKey();
    break;
    case MUNDO:
       MundoKeyPressed();
    break;
    case COMBATE:
       CombateKeyPressed();
    break;
  
  }
  
}
void keyReleased(){
 
   switch(estado){
    
    case INICIO:
 
    break;
    case SELECCION:
 
    break;
    case MUNDO:
       MundoKeyReleased();
    break;
    case COMBATE:
       CombateKeyReleased();
    break;
  
  }
 
}



void InicioDraw(){

    for(int i=0;i<100;i++){
            float x = random(32,256),
                  y = random(32,140);            
            fill(random(128,255));
            ellipse(x,y,32,32);            
    }
    delay(20);
  
    fill(color(255,255,255));
    textFont(fuentetitulo);       
    textAlign(CENTER);    
    text("THE LAST",width*0.5,height*0.25 + 8);
    text("RING"    ,width*0.5,height*0.25 + 70);
    
    float y = height*0.6f;
    
    fill(color(41,176,41));
    noStroke();
    rect(width*0.3f,y,width*0.4f,height*0.25f);
    
    fill(color(255)); 
    textFont(fuente);
    textAlign(CENTER);    
    text("PLAY",width*0.5f,y + height*0.125f + 8);
    fill(color(0));
    textFont(fuenteinstrucciones);
    textAlign(CENTER);    
    text("PRESIONA ENTER,ESPACIO PARA CONFIRMAR",width/2,height-4);
}
void InicioKey(){
     if(keyCode == ENTER || key==' ')
        setestado(SELECCION); 
}


void SeleccionDraw(){

    fill(color(255));
    textFont(fuentetitulo);       
    textAlign(CENTER);    
    text("SELECCIONA UN AVATAR",width*0.5,height*0.12 + 8);
  
    fill(color(255,255,255));
    textFont(fuente);       
    textAlign(CENTER); 
  
    tint(color(0,0,0));
    if(seleccion >= 0 && seleccion <3)      
      avatarselector.display(seleccion*width/3 + 54,height*0.25f - 10,160);    
    else if(seleccion >= 3 && seleccion < 5)     
      avatarselector.display((seleccion-3)*width/2 + 118,height*0.6f - 10,160);
        
    tint(255);  
    for(int i=0;i<3;i++){
      avatarseleccion[i].display(i*width/3 + 64,height*0.25f,140);
      text(avatarnombre[i],i*width/3 + 64 + 70,height*0.25f + 148);
    }
    for(int i=3;i<5;i++){
      avatarseleccion[i].display((i-3)*width/2 + 128,height*0.6f,140);
      text(avatarnombre[i],(i-3)*width/2 + 128 + 70,height*0.6f + 148);
    }
  
    
  fill(color(255));    
  textFont(fuenteinstrucciones);
  textAlign(LEFT); 
  text("PRESIONA W,A,S,D PARA SELECCIONAR"+personaje.enemigos,16,height-8);
  textAlign(RIGHT); 
  text("PRESIONA ENTER,ESPACIO PARA CONFIRMAR"+personaje.enemigos,width-16,height-8);
    
}
void SeleccionKey(){
     if(key == 'a')
         seleccion--;
     if(key == 'd')
         seleccion++;
     if(key == 'w' || key == 's' ){
         if(seleccion >= 0 && seleccion <3)
           seleccion = 3;
         else if(seleccion >= 3 && seleccion < 5)
           seleccion = 0;
     }
    if(keyCode == ENTER || key==' ')
        setestado(MUNDO);
    
    
     seleccion = min(seleccion,4);
     seleccion = max(seleccion,0);
     
     avatarselector.setseleccion(seleccion);
         
}

float t0 = 0;
void MundoDraw(){
 
  
  
  float dt = (float(millis())-t0)/1000;
  tiempoenemigo += dt;
  tiempovida    += dt;
  t0 = millis();
  
  for(int i=0;i<vidas.size();i++){
    Vida vida = vidas.get(i);
    vida.displayMundo();
    if(vida.colision(personaje.x +20,personaje.y +20,personaje.t - 40)){
      personaje.vida++;
      vidas.remove(i);
    }
  }
  
  for(int i=0;i<enemigos.size();i++){
    Enemigo enemigo = enemigos.get(i);
    enemigo.displayMundo();
    enemigo.movimiento();
    if(enemigo.colision(personaje.x + 40,personaje.y +40,personaje.t - 80)){
      combateenemigo = i;
      personaje.detenerse();
      setestado(COMBATE);
    }
  }
  
  personaje.displayMundo();
  personaje.movimiento();
  
     
  fill(color(0));
  textFont(fuentescore);       
  textAlign(RIGHT); 
  text("ENEMIGOS: "+personaje.enemigos,width-16,height-16);
  textFont(fuenteinstrucciones);
  textAlign(LEFT); 
  text("RECOLECTA VIDA USANDO [WASD] Y ENTRA AL COMBATE"+personaje.enemigos,16,height-16);
     
  if(tiempoenemigo >= aparicionenemigotiempo){      
      if(enemigos.size() < enemigosapariciones){
          int s = int(random(0,4));
          while(s == seleccion)
              s = int(random(0,4));
          enemigos.add(new Enemigo(random(0,width),random(0,height),s));
      }
      tiempoenemigo=0; 
      aparicionenemigotiempo = random(aparicionenemigotiempos[0],aparicionenemigotiempos[1]);
  }
  
  if(tiempovida >= aparicionvidatiempo){      
      if(vidas.size() < vidaapariciones){
          int s = int(random(0,4));
          while(s == seleccion)
              s = int(random(0,4));
          vidas.add(new Vida(random(16,width-32),random(16,height-32)));
      }
      tiempovida=0; 
      aparicionvidatiempo = random(aparicionvidatiempos[0],aparicionvidatiempos[1]);
  }
  
      
}
void MundoKeyPressed(){
   switch(key){
        case 'w':
          personaje.moverse(0);
        break;
        case 'a':
          personaje.moverse(2);
        break;
        case 's':
          personaje.moverse(3);
        break;
        case 'd':
          personaje.moverse(1);
        break;
      }     
}
void MundoKeyReleased(){      
  switch(key){
    case 'w':
      personaje.detenerse(0);
    break;
    case 'a':
      personaje.detenerse(2);
    break;
    case 's':
      personaje.detenerse(3);
    break;
    case 'd':
      personaje.detenerse(1);
    break;
  }
  
}
float dt = 0;
void CombateDraw(){
 
  
  
  dt += 0.01;
  background(255);
  noStroke();  
  for(int i= 0;i<width;i+=10){
    for(int j = 0; j<height;j+=10){
      fill(noise(i*0.01+dt,j*0.01,dt)*255,noise(i*0.01+dt*1,j*0.01+1,dt)*255,noise(i*0.01+dt*2,j*0.01*2,dt)*255);
      rect(i,j,10,10);
    }
  }
  
  fill(color(255));
  textFont(fuentetitulo);       
  textAlign(CENTER);    
  text("COMBATE",width*0.5,height*0.12 + 8);
    
  tiempoenemigo = (float(millis())-t0)/1000;
  t0 = millis();
  
  personaje.displayBatalla(108,height*0.3f,180);
  enemigos.get(combateenemigo).displayBatalla(width/2 + 108,height*0.3f,180);
 
   
  fill(color(255,255,255));  
  textFont(fuentescore);       
  textAlign(RIGHT); 
  text("ENEMIGOS: "+personaje.enemigos,width-16,height-16);
  textFont(fuenteinstrucciones);
  textAlign(LEFT); 
  text("PRESIONA ENTER-ESPACIO PARA COMBATIR"+personaje.enemigos,16,height-16);
   
  if(enemigos.get(combateenemigo).vida <= 0){
     setestado(MUNDO);
     personaje.enemigos++;
     enemigos.remove(combateenemigo);
     return;
  }
  if(personaje.vida <= 0){
     setestado(FIN);
     return;
  }  
  if(enemigos.get(combateenemigo).modataque(tiempoenemigo/combateenemigotiempo)){              
      personaje.vida--;           
      tiempoenemigo = 0; 
      combateenemigotiempo = random(combateenemigotiempos[0],combateenemigotiempos[1]);  
  }
     
}

boolean click = false; 
void CombateKeyPressed(){     
    if((key == ' ' || keyCode == ENTER) && !click){
      click = true;
      if(personaje.modataque(tiempoenemigo/combateenemigotiempo * 5)){
            enemigos.get(combateenemigo).vida--;            
        }
    }
}
void CombateKeyReleased(){     
    if(key == ' ' || keyCode == ENTER)
      click = false;
}
void FinDraw(){
 
  fill(color(255));
  textFont(fuentetitulo);       
  textAlign(CENTER);    
  text("GAME OVER",width*0.5,height*0.12 + 8);
      
  personaje.display(width*0.5 - 64,height*0.26,200);  
   
  fill(color(255,255,255));  
  textFont(fuente);       
  textAlign(CENTER); 
  text("ENEMIGOS: "+personaje.enemigos,width*0.5,height*0.8);
  textFont(fuenteinstrucciones);
  textAlign(LEFT); 
  text("PRESIONA A PARA CONTINUAR"+personaje.enemigos,16,height-16);
  
  keyPressed();
  if(key == 'a' || key== 'A'){
  setestado(SELECCION);
  }
}

void FinKey(){
     if(keyCode == ENTER || key==' ')
        setestado(SELECCION); 
}
