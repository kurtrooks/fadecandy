import processing.video.*;
Movie mov;

OPC opc;
PImage dot;

void setup()
{
  size(1920,1080);
  
  mov = new Movie(this,"/home/kurt/Downloads/bbb_sunflower_1080p_60fps_normal.mp4");
  mov.play();
  
  // Example of a static image
  /*
  dot = loadImage("dog.jpg");
  */
  
  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "127.0.0.1", 7890);
  
  int stripLen = 50;
  int numStrips = 24;
  
  for(int i = 0; i < numStrips; i++)
  {
    opc.ledStrip(i*stripLen,stripLen,width-((i+1)*(width/(numStrips))),height/2.0,height/stripLen,1.57,true);
  }
  
}

void draw()
{
 // background(0);
  image(mov,0,0);
  
 // float dotSize = (height/20.0)*(1.0*height/mouseY); 
  
  // Draw it centered at the mouse location
 // image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
}

void movieEvent(Movie m) {
  m.read();
}
