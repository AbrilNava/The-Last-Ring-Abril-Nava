class Personaje{

  float x , y,
        vx,vy;
  float v;        
  float t;
  float vida,vidamax;
  float ataque;
  Avatar avatar;  
  int   enemigos;
  
  Personaje(int i){    
    this.x = width/2;
    this.y = height/2;
    this.v = 5;   
    this.avatar = new Avatar(i);
    this.t = 96;
    ataque = 0;
  }    
  void movimiento(){
  
    x += vx;
    y += vy; 
  
    this.x = constrain(this.x,0,width  - this.t);
    this.y = constrain(this.y,0,height - this.t);
  
    vida = max(vida,0);
    vida = min(vida,vidamax);
  
  }
  void displayMundo(){
     avatar.display(x,y,t);
     
     
     fill(color(0,155,0));
     rect(x,y-t*0.2f,t,t*0.2f);     
     fill(color(0,255,0));
     rect(x,y-t*0.2f,t * vida/vidamax,t*0.2f);
    
     fill(color(255));
     textFont(fuentemundo);       
     textAlign(RIGHT);    
     text(""+vida,x + t,y - t*0.05f);
     
  }
  void display(float x,float y,float t){
       avatar.display(x,y,t);
  }
  void displayBatalla(float x,float y,float t){
     avatar.display(x,y,t);
          
     fill(color(0,155,0));
     rect(x,y+t,t,t*0.2f);     
     fill(color(0,255,0));
     rect(x,y+t,t * vida/vidamax,t*0.2f);
     
     fill(color(255));
     textFont(fuentecombate);       
     textAlign(RIGHT);    
     text(""+vida,x + t,y+t+t*0.15f);
     
     
     fill(color(0,155,155));
     rect(x,y-t*0.2f,t,t*0.2f);     
     fill(color(0,255,255));
     rect(x,y-t*0.2f,t * ataque,t*0.2f);     
     
  }  
  
  void moverse(int n_){
    switch(n_){
      case 0:
        this.vy =- this.v;
      break;
      case 1:
        this.vx = this.v;
      break;
      case 2:
        this.vx = -this.v;
      break;
      case 3:
        this.vy = this.v;
      break;
    }
  }

  void detenerse(){
    vx=vy=0;
  }
  
  void detenerse(int n_){
    
    switch(n_){
      case 0:
        if(this.vy < 0)
          this.vy = 0;
      break;
      case 1:
        if(this.vx > 0)
          this.vx = 0;
      break;
      case 2:
        if(this.vx < 0)
          this.vx = 0;
      break;
      case 3:
        if(this.vy > 0)
          this.vy = 0;
      break;
    }
  }
  
  boolean modataque(float mod){
    ataque+=mod;
    boolean atacar = ataque >= 1;    
    if(atacar)
      ataque = 0;
    return atacar;
  }
  
  void setseleccion(int seleccion){
    avatar.setseleccion(seleccion);
 
    vidamax = avatar.getvidamax();
    vida = vidamax;    
  }
  

}
