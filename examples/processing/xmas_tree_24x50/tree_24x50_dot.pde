OPC opc;
PImage dot;

void setup()
{
  size(1024,1024);

  dot = loadImage("dot.png");

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
  background(1);
  
  // Change the dot size as a function of time, to make it "throb"
  float dotSize = height * 0.6 * (1.0 + 0.2 * sin(millis() * 0.01));
  
  // Draw it centered at the mouse location
  image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
}
