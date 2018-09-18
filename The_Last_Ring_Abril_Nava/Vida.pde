class Vida{

  float x,y; 
  float t;
  
  Vida(float x,float y){    
    this.x = x;
    this.y = y;
    
    this.t = 16;
    
  }    
   
  void displayMundo(){
     
     fill(color(0,255,0));
     ellipse(x,y,t,t);
     
  }  
   boolean colision(float x,float y,float t){
     return ((x+t) > this.x) && (x < (this.x+this.t)) && ((y+t) > this.y) && (y < (this.y+this.t));
   } 
  
  
}
