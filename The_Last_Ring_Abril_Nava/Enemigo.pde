class Enemigo{

  float x , y,
        vx,vy;
  float v;        
  float t;
  float vida,vidamax;
  float ataque;
  Avatar avatar;  

  public float []tiempos = {1,10}; 
  public float tiempo,t0;
  
  Enemigo(float x,float y,int i){    
    this.x = x;
    this.y = y;
    this.v = 8;   
    this.avatar = new Avatar(i);
    this.t = 96;
    ataque = 0;
    setseleccion(i);
  }    
  void movimiento(){
  
    x += vx;
    y += vy; 
  
    this.x = constrain(this.x,0,width  - this.t);
    this.y = constrain(this.y,0,height - this.t);
  
    vida = max(vida,0);
    vida = min(vida,vidamax);

    
    if((millis()-t0)/1000 > tiempo){
        int rnx = int(random(0,3)),
            rny = int(random(0,3));
    
        if(rnx == 0){
          detenerse(0);
          detenerse(1);
        }
        else if(rnx == 1)
          moverse(0);
        else if(rnx == 2)
          moverse(1);

        if(rny == 0){
          detenerse(2);
          detenerse(3);
        }
        else if(rny == 1)
          moverse(2);
        else if(rny == 2)
          moverse(3);
          
        t0 = millis();
        tiempo = random(tiempos[0],tiempos[1]);
    
    }
  
  }
  
   
  void displayMundo(){
      avatar.display(x,y,t);
     
     
     fill(color(155,0,0));
     rect(x,y-t*0.2f,t,t*0.2f);     
     fill(color(255,0,0));
     rect(x,y-t*0.2f,t * vida/vidamax,t*0.2f);
     
     fill(color(255));
     textFont(fuentemundo);       
     textAlign(RIGHT);    
     text(""+vida,x + t,y - t*0.05f);
     
  }  
  
  void displayBatalla(float x,float y,float t){
      avatar.display(x,y,t);
     
     
     fill(color(155,0,0));
     rect(x,y+t,t,t*0.2f);     
     fill(color(255,0,0));
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
  
  void setseleccion(int seleccion){
    avatar.setseleccion(seleccion);
 
    vidamax = avatar.getvidamax();
    vida = vidamax;
    
  }
  boolean modataque(float mod){
    ataque+=mod;
    boolean atacar = ataque >= 1;    
    if(atacar)
      ataque = 0;
    return atacar;
  }
  
   boolean colision(float x,float y,float t){
     return ((x+t) > this.x) && (x < (this.x+this.t)) && ((y+t) > this.y) && (y < (this.y+this.t));
   } 
  
  
}
