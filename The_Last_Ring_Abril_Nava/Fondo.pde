class Fondo{

PGraphics fondo;

  int seleccion = 0;

  Fondo(int seleccion){
    this.seleccion = seleccion;
    fondo = createGraphics(width,height);
    crearFondo();
  }
  private void crearFondo(){
  
    float w = width,
          h = height;
    
  fondo.beginDraw();
      fondo.noStroke();
      fondo.fill(color(0,0,0));
      fondo.rect(0,0,width,height);

  switch(seleccion){

    case INICIO:
      
      fondo.fill(color(0,255,200));
      fondo.rect(0,0,width,height);
      
      w = float(width-32)/100.0f;
      h = float(height-32)/100.0f;
      
      //fondo.fill(color(255));
      //fondo.rect(16,16,width-32,height-32);
         
//fondo del cielo     
      for(int x=0;x<100;x++)
          for(int y=0;y<100;y++){
            fondo.noStroke();
            fondo.fill(color(130, 31, noise(x*w,y*h)*120 + 25));
            fondo.rect(x*w + 16,y*h + 16,w,h);
          }            

//color de volcan  
      fondo.fill(102, 57, 10);            
      fondo.beginShape();
        fondo.vertex(16,height - 16);
        fondo.vertex(16,height - 256);
        fondo.vertex(80,130);
        fondo.vertex(184,130);
        fondo.vertex(300,height-16);        
      fondo.endShape();
//montaña pequeña      
      fondo.fill(14, 51, 10);      
      fondo.beginShape();
        fondo.vertex(width-16,height- 16);
        fondo.vertex(width-16,height- 190);
        fondo.vertex(width-80,256);
        fondo.vertex(width-184,256);
        fondo.vertex(width-300,height-16);        
      fondo.endShape();
      
//puerta      
      fondo.fill(88,49,7);
      fondo.ellipse(width - 100,height - 140,80,80);        
//bajada  
      fondo.fill(105, 61, 14); 
      fondo.beginShape();
        fondo.vertex(width-16,height- 16);
        fondo.vertex(width-16,height- 105);
        fondo.vertex(width-80,height- 110);
        fondo.vertex(width-184,height-110);
        fondo.vertex(width-250,height-16);        
      fondo.endShape();
  
//sol     
      fondo.fill(255,255,0);
      fondo.ellipse(width - 90,90,108,108);    
               
      
      
    break;  
    
    case SELECCION:
      w = float(width)/50;
      h = float(height)/50;         
      for(int x=0;x<50;x++)
          for(int y=0;y<50;y++){
            fondo.noStroke();                        
            fondo.fill(color(86,noise(x*w,y*h)*40.0 + 60.0,44));
            fondo.rect(x*w,y*h,w,h);
          }
    break;
    case MUNDO:
      w = float(width)/50;
      h = float(height)/50;         
      for(int x=0;x<50;x++)
          for(int y=0;y<50;y++){
            fondo.noStroke();
            fondo.fill(color(64,noise(x*w,y*h)*128.0 + 128.0,64));
            fondo.rect(x*w,y*h,w,h);
          }
    break;
     case COMBATE:
      fondo.fill(255);
      fondo.rect(0,0,w,h);
    break;
     case FIN:
      w = float(width)/50;
      h = float(height)/50;         
      for(int x=0;x<50;x++)
          for(int y=0;y<50;y++){
            fondo.noStroke();                        
            fondo.fill(color(noise(x*w,y*h)*55.0,noise(x*w,y*h)*55.0,noise(x*w,y*h)*55.0));
            fondo.rect(x*w,y*h,w,h);
          }
    break;
  }
  fondo.endDraw();
    
    
  }
  
  public void setseleccion(int seleccion){
    this.seleccion = seleccion;
    crearFondo();
  }
  public void display(){
    image(fondo,0,0);
  }


}
