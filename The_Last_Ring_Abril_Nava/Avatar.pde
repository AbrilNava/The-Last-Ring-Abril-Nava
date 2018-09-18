class Avatar{
  
  int c;
  int seleccion;
  
  PGraphics imagen;
  public final float []vidamax = {10,10,10,10,10};
  
  Avatar(int seleccion){
    this.c = color(255,0,0);
    this.seleccion = seleccion;        
    crearavatar();
  }  
  private void crearavatar(){  
    imagen = createGraphics(100,100);
    
    imagen.beginDraw();
    imagen.noStroke();
    
    switch(seleccion){
      //gandalf      
      case 0:
//ropa               
        imagen.fill(90,90,90);            
        imagen.beginShape();
        imagen.vertex(40,40);
        imagen.vertex(60,40);
        imagen.vertex(68,80);
        imagen.vertex(32,80);
        imagen.endShape();
        
        
        imagen.beginShape();
        imagen.vertex(40,44);
        imagen.vertex(34,70);
        imagen.vertex(23,65);        
        imagen.endShape();
        
        
        imagen.beginShape();
        imagen.vertex(60,44);
        imagen.vertex(66,70);
        imagen.vertex(77,65);         
        imagen.endShape();
//palito        
        imagen.fill(0,0,0);
        imagen.rect(24,37,2,42);
        imagen.fill(0,255,0);
        imagen.beginShape();
        imagen.vertex(25,25);
        imagen.vertex(30,33);
        imagen.vertex(25,38);
        imagen.vertex(20,33);
        imagen.endShape();
//piel        
        imagen.fill(255,223,174);
        rectarc(33.5,13.3,33,30,5);        
//ojos      
        imagen.fill(0,0,0);      
        imagen.ellipse(38+3.5,22+3.5,7,7);
        imagen.ellipse(55+3.5,22+3.5,7,7);
//barba        
        imagen.fill(255,255,255);      
        imagen.rect(38,20,8,1.6);
        imagen.rect(54,20,8,1.6);
        
        imagen.beginShape();        
        imagen.vertex(33,32);
        imagen.vertex(50,36);
        imagen.vertex(67,32);
        imagen.vertex(66.5,44);
        imagen.vertex(33.5,44);
        imagen.endShape();
        
//nariz        
        imagen.fill(128,0,0);            
        imagen.beginShape();        
        imagen.vertex(50,29);
        imagen.vertex(52,32);
        imagen.vertex(48,32);
        imagen.endShape();
        
//sombrero        
        imagen.fill(90,90,90);
        
        imagen.beginShape();        
        imagen.vertex(50,0);
        imagen.vertex(70,16);
        imagen.vertex(30,16);        
        imagen.endShape();
        
        imagen.rect(25,16,50,3);
        
                
      break;
//gollum      
      case 1:
//cabello      
      imagen.fill(0,0,0);            
        imagen.beginShape();
        imagen.vertex(30,10);
        imagen.vertex(50,12);
        imagen.vertex(70,10);
        imagen.vertex(67,48);
        imagen.vertex(33,48);
        imagen.endShape();
//piel        
      imagen.fill(227,212,180);
      
      rectarc(33.5,13.3,33,30,5);
      imagen.rect(42,42.3,16,20);      
        imagen.beginShape();
        imagen.vertex(58,59.5);
        imagen.vertex(63,59);
        imagen.vertex(58.9,71);
        imagen.vertex(63.4,74);
        imagen.vertex(55.2,74);
        imagen.endShape();
        
        imagen.beginShape();
        imagen.vertex(42.7,59.5);
        imagen.vertex(37.7,59);
        imagen.vertex(41.8,71);
        imagen.vertex(37.4,74);
        imagen.vertex(45.5,74);
        imagen.endShape();
      
      imagen.rect(37,43,3,23);  
      imagen.rect(60,43,3,23);
      
      imagen.beginShape();
        imagen.vertex(66,22);
        imagen.vertex(77,20);
        imagen.vertex(66,28);
        imagen.endShape();
        
        imagen.beginShape();
        imagen.vertex(34,22);
        imagen.vertex(23,20);
        imagen.vertex(34,28);
        imagen.endShape();
//calzoncillo
      imagen.fill(87,29,1);
      imagen.beginShape();
        imagen.vertex(42,59);
        imagen.vertex(58,59);
        imagen.vertex(50,70);
        imagen.endShape();
//ojos        
        imagen.fill(255,0,0);
      imagen.ellipse(38+3.5,22+3.5,7,7);
      imagen.ellipse(55+3.5,22+3.5,7,7);
//cejas      
      imagen.fill(0,0,0);
      imagen.rect(38,20,8,1.6);
      imagen.rect(54,20,8,1.6);
//boca
      imagen.fill(42,5,5);
       imagen.beginShape();
        imagen.vertex(47,36);
        imagen.vertex(53,36);
        imagen.vertex(55,40);
        imagen.vertex(45,40);
        imagen.endShape();      
      
      break;
//barbol      
      case 2:
//tronco      
      imagen.fill(79,116,49);
      imagen.rect(40,42.3,20,20);
      imagen.ellipse(32.5+35/2,15+20,35,40);
      imagen.rect(40,60,8,20);      
      imagen.rect(52,60,8,20);
      imagen.rect(33,10,6,24);
      imagen.rect(61,14,6,20);
      imagen.rect(44,6,12,28);
      imagen.rect(30,33,6,31);
      imagen.rect(64,33,6,31);
      
//ojos      
      imagen.fill(0,0,0);
      imagen.ellipse(40+3.5,27+3.5,7,7);
      imagen.ellipse(53+3.5,27+3.5,7,7);
//boca      
      imagen.fill(0,0,0);
      imagen.rect(48.5,34,3,2);      
//barba      
      imagen.fill(95,75,36);      
       imagen.beginShape();
        imagen.vertex(33.4,35.4);
        imagen.vertex(42.2,41.1);
        imagen.vertex(50,37.6);
        imagen.vertex(58.7,41.4);
        imagen.vertex(65.1,37);
        imagen.vertex(63.7,46.7);
        imagen.vertex(59.2,51.2);
        imagen.vertex(50,53.9);
        imagen.vertex(40.8,51);
        imagen.vertex(36.6,46.9);        
        imagen.endShape();   
      
      break;
 //mama luchona (Gilraen)    
      case 3:
      
//cabello      
      imagen.fill(216,78,24);
      rectarc(31.5,9.5,37,40,10);
      
//ropa      
      imagen.fill(73,158,31);
       
      imagen.beginShape();
        imagen.vertex(40,40);
        imagen.vertex(60,40);
        imagen.vertex(68,80);
        imagen.vertex(32,90);     
        imagen.endShape();   
        
        imagen.beginShape();
        imagen.vertex(60,44);
        imagen.vertex(77,65);
        imagen.vertex(66,70);            
        imagen.endShape(); 
      
      imagen.beginShape();
        imagen.vertex(40,44);
        imagen.vertex(23,65);
        imagen.vertex(34,70);            
        imagen.endShape(); 
      
//piel      
      imagen.fill(255,223,174);
      rectarc(33.5,13.3,33,30,10);
      
//ojos      
      imagen.fill(0,0,0);
      imagen.ellipse(38+3.5,22+3.5,7,7);
      imagen.ellipse(55+3.5,22+3.5,7,7);
      
//nariz      
      imagen.fill(187,36,68);
      imagen.beginShape();
        imagen.vertex(50,29);
        imagen.vertex(52,32);
        imagen.vertex(48,32);            
        imagen.endShape(); 
        
   
//boca
      imagen.fill(252,24,19);
      imagen.beginShape();
        imagen.vertex(45,35.5);
        imagen.vertex(55,35.5);
        imagen.vertex(50,40);            
        imagen.endShape(); 
        
  //mechones        
      imagen.fill(216,78,24);   
      imagen.beginShape();
        imagen.vertex(32,11);
        imagen.vertex(45,11);
        imagen.vertex(32,30);            
        imagen.endShape(); 
        
      
      imagen.beginShape();
        imagen.vertex(68,11);
        imagen.vertex(55,11);
        imagen.vertex(68,30);            
        imagen.endShape();       
      
      break;
      
//torre sauron      
      case 4:
    
//torre      
      imagen.fill(122,122,122);
      imagen.beginShape();
        imagen.vertex(30,63);
        imagen.vertex(70,63);
        imagen.vertex(80,80);            
        imagen.vertex(20,80);
        imagen.endShape();      
      
      imagen.rect(34.7,23.4,30,40);

      imagen.beginShape();
        imagen.vertex(42,11);
        imagen.vertex(42,26);
        imagen.vertex(35,26);                   
        imagen.endShape();

      imagen.beginShape();
        imagen.vertex(58,11);
        imagen.vertex(65,26);
        imagen.vertex(58,26);                   
        imagen.endShape();

//ojo
      imagen.fill(255,232,74);
      imagen.ellipse(42.5+7.5,10+4,15,8);

//pupila      
      imagen.fill(0,0,0);
      imagen.ellipse(48+2,10+7.5/2,4,7.5);
      imagen.ellipse(38+4,29.7+25/2,8,25);
      imagen.ellipse(54+4,29.7+25/2,8,25);

      break;
    }  
    imagen.endDraw();
  }
  
  private void rectarc(float x,float y,float a,float l,float r){
      
      a -= 2*r; 
      l -= 2*r; 
      
      if(a<=0 || l<=0)
        return;              
      
      imagen.ellipse(x+r,y+r,2*r,2*r);
      imagen.ellipse(x+r+a,y+r,2*r,2*r);
      
      imagen.ellipse(x+r,y+r+l,2*r,2*r);
      imagen.ellipse(x+r+a,y+r+l,2*r,2*r);
        
      imagen.rect(x+r-1,y+r-1,a+2,l+2);  
      
      imagen.rect(x+r,y,a,r);
      imagen.rect(x+r,y+l+r,a,r);
      
      imagen.rect(x,y+r,r,l);
      imagen.rect(x+a+r,y+r,r,l);
           
      
      
  }
  
  void display(float x,float y,float t){
      image(imagen,x,y,t,t);              
  }
  
  void setseleccion(int seleccion){
    this.seleccion = seleccion;
    crearavatar();
  }
  float getvidamax(){
    return vidamax[seleccion];
  }
  
}
