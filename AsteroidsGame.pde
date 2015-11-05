SpaceShip poop;
Star[] poops = new Star[200];
PImage bg;
boolean up, down, left, right;
public void setup() 
{
  size(1000, 1000);
  poop = new SpaceShip();
  for(int i=0 ; i<poops.length ;i++){
    poops[i] = new Star();
  }

  bg = loadImage("Stars1.jpg");
}
public void draw() 
{
  // imageMode(CENTER);
  // image(bg,500,500,1920,1000);
  background(0);
  for(int i=0;i<poops.length;i++){
    poops[i].show();
  }
  if(up==true) poop.accelerate(.3);
  if(down==true) poop.accelerate(-.3);
  if(left==true) poop.rotate(-10);
  if(right==true) poop.rotate(10);
  poop.move();
  poop.show();
}
public void keyPressed() {
  if (key=='a') left=true;
  if (key=='d') right=true;
  if (key=='s') down=true;
  if (key=='w') up=true;
  if (key=='h') {
    poop.setX((int)(Math.random()*1001));
    poop.setY((int)(Math.random()*1001));
    poop.setDirectionX(0);
    poop.setDirectionY(0);
    poop.setPointDirection((int)(Math.random()*361));
  }
}
  public void keyReleased() {
    if(key=='w') up=false;
    if(key=='a') left=false;
    if(key=='s') down=false;
    if(key=='d') right=false;
  }

class Star {
  private float x,y;
     public Star(){
        x=(float)Math.random()*1001;
        y=(float)Math.random()*1001;
    }

      public void show(){
        ellipse(x,y,1,1);
      }
}

class SpaceShip extends Floater
{  
    public SpaceShip() {
      corners = 4;
      int[] xS = {-8,16,-8,-2};
      int[] yS = {-8,0,8,0};
      xCorners = xS;
      yCorners = yS;
      myColor = 225;
      myCenterX = 500;
      myCenterY = 500;
      myDirectionX = 0;
    }
    public void setX (int x){
      myCenterX=x;
    }
    public int getX(){
      return (int)(myCenterX);
    }
    public void setY (int y){
      myCenterY=y;
    }
    public int getY(){
      return (int)(myCenterY);
    }
    public void setDirectionX(double x){
      myDirectionX=x;
    }
    public double getDirectionX(){
      return myDirectionX;
    }
    public void setDirectionY(double y){
      myDirectionY=y;
    }
    public double getDirectionY(){
      return myDirectionY;
    }
    public void setPointDirection(int degrees){
      myPointDirection=degrees;
    }
    public double getPointDirection(){
      return myPointDirection;
    }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{  
  protected float friction=1.008;
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)  
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move () //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    myDirectionX=myDirectionX/friction;
    myDirectionY=myDirectionY/friction;

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

