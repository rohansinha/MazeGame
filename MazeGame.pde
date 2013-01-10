int a, b, c, d, e, f, s, w, h, p, moveX, moveY, ctr = 0;
int scr = 0;
int[][] maze;
color [][] blacklist = new color[400][400];
int[] mz;
int[] path = new int [4];
int playSize = 10;
boolean done = false, play = false;
PImage bg;
color test = color(0);
boolean checkdone = false;
boolean intro = true;
//color [] blacklist = new color[6425];
PFont display, display2;
String intro1 = "WELCOME TO THE MAZE...";
String intro2 = "Press r to begin...";
boolean won = false;
import ddf.minim.*;
AudioPlayer gameAudio;
AudioInput input;
Minim minim;
boolean audioPlay = true;

void setup() 
{ 
  size(400, 400);
  background(0);
  noStroke();
  //frameRate(5);
  //noCursor();

  s = 25;
  w = s - 1;
  h = 2*s - 1;
  f = width/s;
  c = f/2;
  d = c;
  e = f-1;
  maze = new int [f][f];

  moveX = width/2 - 12;
  moveY = height/2 + 10;

  /*try
   {
   robot = new Robot();
   }
   catch (AWTEception e)
   {
   e.printStackTrace();
   }
   robot.mouseMove(moveX, moveY);*/
  display = loadFont("BlackmoorLetPlain-45.vlw");
  display2 = loadFont("Checkbook-48.vlw");

  minim = new Minim(this);
  gameAudio = minim.loadFile("gameAudio.mp3", 8);
  input = minim.getLineIn();
}

void draw()
{
  if (done)
  {
    play = false;
    background(0);
    textFont(display, 35);
    text("Game Over", 100, 100);
    if (won) text("Winner!", 100, 200);
    else text("Loser!!", 100, 200);
    noLoop();
  }
  if (intro)
  {
    //textSize(5);
    textFont(display2, 30);
    text(intro1, 50, 50);
    text(intro2, 25, 150);
  }

  if (play)
  {
    bg = loadImage("maze.png");
    if(audioPlay)
    {
      gameAudio = minim.loadFile("gameAudio.mp3", 1024);
      gameAudio.play();
      audioPlay = false;
    }
    image(bg, 0, 0);
    if (!checkdone)
    {
      loadPixels();
      for (int i = 0; i < width; i++)
      {
        for (int j = 0; j < height; j++)
        {
          int a = change1(ctr);
          //int b = change2(ctr);
          if (pixels[ctr] == test)
          {
            blacklist[i][j] = a;
            //println(red(pixels[ctr]));
            //println(blue(pixels[ctr]));
            //println(green(pixels[ctr]));
            //println(a);
          }
          ctr++;
        }
      }
      /*for(int i = 0; i < pixels.length; i++)
       {
       if(pixels[i] == test) 
       {
       blacklist[ctr] = pixels[i];
       ctr++;
       println(red(blacklist[ctr]));
       println(blue(blacklist[ctr]));
       println(green(blacklist[ctr]));
       }
       }*/
      //println(blacklist.length);
      checkdone = true;
    }
    fill(150);
    ellipse(moveX, moveY, playSize, playSize);
  }
}
