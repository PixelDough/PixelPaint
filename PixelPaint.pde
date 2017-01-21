//PIXELPAINT
//Created by: Adam Worrell
//Created Jul 28 2016
//Made with Display 1366 x 768
//V2.0 "The Tool Update"

          //-----------------------Presets-----------------------//
float paintShape = 1;
float picked = 0;
float nuked = 0;
float tool = 0;
float eraser = 0;
float bubbleWand = 0;
float paintbrush = 0;
boolean started = true;

float mousePos1x;
float mousePos1y;
float mousePos2x;
float mousePos2y;

boolean random = false;

//SprayCan - tool 4
float sprayCan = 0;
float sprayRangeX1 = 0;
float sprayRangeY1 = 0;

//Bubble Wand - tool 3
float bubbleSize = 1;
boolean blowingBubble = false;
boolean bubbleAllowed = true;

//how far does drawing start
float drawSpaceX = 0;
float drawSpaceY = 60;

boolean toolboxOpened = false;
float toolboxOff = 0;
PImage img; 
color colorChoice; 

//Spiral
PShape spiral;
PShape spiralLine;
PShape dotOne;
PShape dotTwo;

PShape ribbon;
PShape ribbonLine;
PShape rDotOne;
PShape rDotTwo;

//ADD NEW SoundFile HERE//
import processing.sound.*;
SoundFile splash;
SoundFile nuke;
SoundFile erase;
SoundFile brush;
SoundFile Windows98;
SoundFile open;
SoundFile close;
SoundFile bubble;
SoundFile spraycan;
SoundFile spray;



void mouseReleased() {
  //Cursors Load Here//
  if (tool==0) {
    img = loadImage("brush.png");
    cursor(img, 8, 1);
  }
  if (tool==1) {
    img = loadImage("Eraser.png");
    cursor(img, 8, 1);
  }
  if (tool==2) {
    img = loadImage("BubbleWand.png");
    cursor(img, 8, 3);
  }
  if (tool==3) {
    img = loadImage("SprayCan.png");
    cursor(img, 8, 3);
  }
  
  //Bubble Wand
  bubbleSize = 0;
  blowingBubble = false;
  bubbleAllowed = true;
}

          //-----------------------Setup-----------------------//
void setup() {
  fullScreen();
  if (started == true) {
    background(255);
  }
  //cursor(CROSS);
  rectMode(CORNER);
  stroke (#000000);
 
frameRate(1000);
 
  
  
  //IMPORT SFX HERE//
  splash = new SoundFile(this, "splash.wav"); //https://www.freesound.org/people/rombart/sounds/186746/
  nuke = new SoundFile(this, "nuke.wav"); //https://www.freesound.org/people/TristanLuigi/sounds/110818/
  erase = new SoundFile(this, "erase.wav"); //https://www.freesound.org/people/Corsica_S/sounds/43448/
  brush = new SoundFile(this, "brush.wav"); //https://www.freesound.org/people/15050_Francois/sounds/325761/
  Windows98 = new SoundFile(this, "Windows98.wav"); //https://www.youtube.com/watch?v=tajDxBaPBBM
  open = new SoundFile(this, "open.wav"); //https://www.freesound.org/people/GreekIrish/sounds/265311/
  close = new SoundFile(this, "close.wav"); //https://www.freesound.org/people/GreekIrish/sounds/265311/
  bubble = new SoundFile(this, "bubble.wav"); //https://www.freesound.org/people/kwahmah_02/sounds/261597/
  spraycan = new SoundFile(this, "spraycan.wav"); //https://www.freesound.org/people/Zabuhailo/sounds/234842/
  
  //Red
  fill (#FF0000);
  rect(0, 0, 100, 50);
  //Orange
  fill (#FF9100);
  rect(100, 0, 100, 50);
  //Yellow
  fill (#FFEA00);
  rect(200, 0, 100, 50);
  //Green
  fill (#1CFF00);
  rect(300, 0, 100, 50);
  //Blue
  fill (#00F4FF);
  rect(400, 0, 100, 50);
  //Indigo
  fill (#0006FF);
  rect(500, 0, 100, 50);
  //VIOLET
  fill (#9C00FF);
  rect(600, 0, 100, 50);
  //Pink
  fill (#FF64F8);
  rect(700, 0, 100, 50);
  //Black
  fill (#000000);
  rect(800, 0, 100, 50);
  
  //Divider 1
  if (started == true) {
  fill (#555555);
  rect(900, 0, 10, 50);
  }
  
  //Square Brush
  fill (#DEDEDE);
  rect(1110, 0, 50, 50);
  //Circle Brush
  fill (#DEDEDE);
  rect(1160, 0, 50, 50);
  
  //Nuke Box
  fill (#555555);
  rect(1210, 0, 50, 50);
  
  //Bottom Divider
  if (started == true) {
  fill (#555555);
  stroke (#000000);
  rect(0, 50, 1366, 10);
  }
  
  if (started == true) {
  fill (#FF0000);
  stroke (#FF0000);
  }
  
  if (paintShape == 1) {
    imageMode(CENTER);
    img = loadImage("circle.png");
    image(img, 1135, 25, 38, 38);
  }
  
  if (paintShape == 2) {
    imageMode(CENTER);
    img = loadImage("circle.png");
    image(img, 1185, 25, 38, 38);
  }

//Spiral//
rectMode(CENTER);
spiral = createShape(GROUP);
spiralLine = createShape(RECT, mouseX, mouseY, 50, 10);
dotOne = createShape(ELLIPSE, mouseX-25, mouseY, 10, 10);
dotTwo = createShape(ELLIPSE, mouseX+25, mouseY, 10, 10);
spiral.addChild(spiralLine);
spiral.addChild(dotOne);
spiral.addChild(dotTwo);

ribbon = createShape(GROUP);
ribbonLine = createShape(RECT, mouseX, mouseY, 50, 10);
rDotOne = createShape(ELLIPSE, mouseX-25, mouseY, 10, 10);
rDotTwo = createShape(ELLIPSE, mouseX+25, mouseY, 10, 10);
ribbon.addChild(spiralLine);
ribbon.addChild(dotOne);
ribbon.addChild(dotTwo);

colorChoice = #FF0000;
fill(colorChoice);
stroke(colorChoice);

  
}


          //-----------------------Draw-----------------------//
void draw() {
  rectMode(CORNER);
  imageMode(CORNER);
  strokeWeight(1);
            //COLORS//
  if (toolboxOpened == true) {
    stroke(#000000);
//Row One//
    //DARK RED
    fill (#A20000);
    rect(0, 50, 100, 50);
    //DARK ORANGE
    fill(#A25100);
    rect(100, 50, 100, 50);
    //DARK YELLOW
    fill(#A29500);
    rect(200, 50, 100, 50);
    //DARK GREEN
    fill(#07A200);
    rect(300, 50, 100, 50);
    //DARK BLUE
    fill(#00A299);
    rect(400, 50, 100, 50);
    //DARK INDIGO
    fill(#0017A2);
    rect(500, 50, 100, 50);
    //DARK VIOLET
    fill(#5000A2);
    rect(600, 50, 100, 50);
    //DARK PINK
    fill(#A200A0);
    rect(700, 50, 100, 50);
    //GRAY
    fill(#8B8A8B);
    rect(800, 50, 100, 50);
//Row Two//
    //Crimson #FF5500
    fill (#FF5500);
    rect(0, 100, 100, 50);
    //Mango #FFC505
    fill (#FFC505);
    rect(100, 100, 100, 50);
    //Laser Lemon #EEFF05
    fill (#EEFF05);
    rect(200, 100, 100, 50);
    //Lime #BEFF00
    fill (#BEFF00);
    rect(300, 100, 100, 50);
    //Mint #C4FFFF
    fill (#C4FFFF);
    rect(400, 100, 100, 50);
    //Electric Blue #00B0FF 
    fill (#00B0FF );
    rect(500, 100, 100, 50);
    //Lavender #CF4DFF
    fill (#CF4DFF);
    rect(600, 100, 100, 50);
    //Salmon #FF83D6
    fill (#FF83D6);
    rect(700, 100, 100, 50);
  }
  
            //TOOLS//
  //Brush
  imageMode(CORNER);
  img = loadImage("BrushTool.png");
  image(img, 910, 0);
  //Eraser
  img = loadImage("EraseTool.png");
  image(img, 1010, 0);
  //Bubble Wand
  if (toolboxOpened == true) {
    img = loadImage("BubbleWandTool.png");
    image(img, 910, 50);
    img = loadImage("SprayCanTool.png");
    image(img, 1010, 50);
    img = loadImage("random.png");
    image(img, 800, 100);
  }
  
  //Toolbox
  img = loadImage("Toolbox.png");
  image(img, 1260, 0);
  
  if (tool == 1) {
    fill(#FFFFFF);
    stroke(#FFFFFF);
  } else {
    fill(colorChoice);
    stroke(colorChoice);
  }

  
  
  //Brush Tools
  rectMode (CENTER);
  rect(1135, 25, 20, 20);
  ellipse(1185, 25, 20, 20);

  //Nuke
  img = loadImage("EraseAll.png");
  image(img, 1219, 9);
  
  //TASKS//
  paintShape();
  paint();
  pickChoices();
  sprayCan();
  spiral();
  randomColor();
  startOver();
  toolboxOpenToClose();
  

    fill(colorChoice);
    stroke(colorChoice);
    
    spiralLine.setFill(colorChoice);
    spiralLine.setStroke(colorChoice);
    dotOne.setFill(#000000);
    dotOne.setStroke(#000000);
    dotTwo.setFill(#000000);
    dotTwo.setStroke(#000000);

}


          //-----------------------Paint Shape-----------------------//
void paintShape() {
  //SQUARE
  if (mouseX > 1110) {
    if (mouseX < 1160) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            paintShape = 1;
            imageMode(CENTER);
            img = loadImage("circle.png");
            image(img, 1135, 25, 38, 38);
            img = loadImage("GraySquare.png");
            image(img, 1185, 25, 38, 38);
          }
        }
      }
    }
  }
  
  //CIRCLE
  if (mouseX > 1160) {
    if (mouseX < 1210) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            paintShape = 2;
            imageMode(CENTER);
            img = loadImage("circle.png");
            image(img, 1185, 25, 38, 38);
            img = loadImage("GraySquare.png");
            image(img, 1135, 25, 38, 38);
          }
        }
      }
    }
  }
}



          //-----------------------Paint-----------------------//
void paint() {
  //SQUARE  
  if (mouseX > drawSpaceX) {
    if (mouseY > (drawSpaceY + 10)) {
      if (mousePressed==true) {
        if (mouseButton==LEFT) {
          if (paintShape == 1) {
            if (tool < 2) {
              if (tool == 0) {
                noCursor();
              }
              rect(mouseX, mouseY, 20, 20);
              mousePos1x = (mouseX-pmouseX)/2;
              mousePos1y = (mouseY-pmouseY)/2;
              rect(pmouseX+mousePos1x, pmouseY+mousePos1y, 20, 20);
            }
          }
        }
      }
    }
  }
  //CIRCLE 
  if (mouseX > drawSpaceX) {
    if (mouseY > (drawSpaceY + 10)) {
      if (mousePressed==true) {
        if (mouseButton==LEFT) {
          if (paintShape == 2) {
            if (tool < 2) {
              if (tool == 0) {
                noCursor();
              }
              ellipse(mouseX, mouseY, 20, 20);
              mousePos1x = (mouseX-pmouseX)/2;
              mousePos1y = (mouseY-pmouseY)/2;
              ellipse(pmouseX+mousePos1x, pmouseY+mousePos1y, 20, 20);
            }
          }
        }
      }
    }
  }
           //-----------------------BUBBLE WAND-----------------------//
  if (mouseX > drawSpaceX) {
    if (mouseY > (drawSpaceY + 10)) {
      if (mousePressed==true) {
        if(mouseButton==LEFT) {
          if (tool==2) {
            paintShape = 2;
            tool = 2;
            blowingBubble = true;
            bubbleSize = (bubbleSize + 3);
            if (bubbleAllowed == true) {
              ellipse(mouseX, mouseY, bubbleSize, bubbleSize);
             
        rectMode(CORNER);      
  //Red
  fill (#FF0000);
  stroke(#000000);
  rect(0, 0, 100, 50);
  //Orange
  fill (#FF9100);
  rect(100, 0, 100, 50);
  //Yellow
  fill (#FFEA00);
  rect(200, 0, 100, 50);
  //Green
  fill (#1CFF00);
  rect(300, 0, 100, 50);
  //Blue
  fill (#00F4FF);
  rect(400, 0, 100, 50);
  //Indigo
  fill (#0006FF);
  rect(500, 0, 100, 50);
  //VIOLET
  fill (#9C00FF);
  rect(600, 0, 100, 50);
  //Pink
  fill (#FF64F8);
  rect(700, 0, 100, 50);
  //Black
  fill (#000000);
  rect(800, 0, 100, 50);
  
  //Divider 1
  if (started == true) {
  fill (#555555);
  rect(900, 0, 10, 50);
  }
  
  //Square Brush
  fill (#DEDEDE);
  rect(1110, 0, 50, 50);
  //Circle Brush
  fill (#DEDEDE);
  rect(1160, 0, 50, 50);
  
  //Nuke Box
  fill (#555555);
  rect(1210, 0, 50, 50);
  
  //Bottom Divider
  if (started == true) {
  fill (#555555);
  stroke (#000000);
  rect(0, 50, 1366, 10);
  }
  
  if (started == true) {
  fill (#FF0000);
  stroke (#FF0000);
  }
  
  if (paintShape == 1) {
    imageMode(CENTER);
    img = loadImage("circle.png");
    image(img, 1135, 25, 38, 38);
  }
  
  if (paintShape == 2) {
    imageMode(CENTER);
    img = loadImage("circle.png");
    image(img, 1185, 25, 38, 38);
  }

  //Toolbox
  imageMode(CORNER);
  img = loadImage("Toolbox.png");
  image(img, 1260, 0);
  

  fill(colorChoice);
  stroke(colorChoice);

  rectMode(CENTER);
  rect(1135, 25, 20, 20);
  rectMode(CORNER);
  ellipse(1185, 25, 20, 20);


  //Nuke
  img = loadImage("EraseAll.png");
  image(img, 1219, 9);
  
  imageMode(CORNER);
   //Brush
  img = loadImage("BrushTool.png");
  image(img, 910, 0);
  //Eraser
  img = loadImage("EraseTool.png");
  image(img, 1010, 0);
            }
          }
        }
      }
    }
  }
}







          //-----------------------Color Choice-----------------------//
void pickChoices() {
    //RED #FF0000
  if (mouseX > 0) {
    if (mouseX < 100) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            colorChoice = #FF0000;
            picked = 1;
            random = false;
          }
        }
      }
    }
  }
    //ORANGE #FF9100
  if (mouseX > 100) {
    if (mouseX < 200) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            colorChoice = #FF9100;
            picked = 1;
            random = false;
            }
          }
        }
      }
    }
    //YELLOW #FFEA00
  if (mouseX > 200) {
    if (mouseX < 300) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            colorChoice = #FFEA00;
            picked = 1;
            random = false;
          }
        }
      }
    }
  }
    //GREEN #1CFF00
  if (mouseX > 300) {
    if (mouseX < 400) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            colorChoice = #1CFF00;
            picked = 1;
            random = false;
          }
        }
      }
    }
  }
     //BLUE #00F4FF
  if (mouseX > 400) {
    if (mouseX < 500) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            colorChoice = #00F4FF;
            picked = 1;
            random = false;
          }
        }
      }
    }
  }
      //INDIGO #0006FF
  if (mouseX > 500) {
    if (mouseX < 600) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            colorChoice = #0006FF;
            picked = 1;
            random = false;
          }
        }
      }
    }
  }
    //VIOLET #9C00FF
  if (mouseX > 600) {
    if (mouseX < 700) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            colorChoice = #9C00FF;
            picked = 1;
            random = false;
          }
        }
      }
    }
  }
    //PINK #FF64F8
  if (mouseX > 700) {
    if (mouseX < 800) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            colorChoice = #FF64F8;
            picked = 1;
            random = false;
          }
        }
      }
    }
  }
    //BLACK #000000
  if (mouseX > 800) {
    if (mouseX < 900) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            colorChoice = #000000;
            picked = 1;
            random = false;
          }
        }
      }
    }
  }
  
  
        //TOOLBOX STUFF//
  if (toolboxOpened == true) {
    if (mousePressed==true) {
      if (mouseButton==LEFT) {
                  //Row 2//
          //DARK RED #A20000
        if (mouseX > 0) {
          if (mouseX < 100) {
            if (mouseY > 50) {
              if (mouseY < 100) {
                colorChoice = #A20000;
                picked = 1;
                random = false;
              }
            }
          }
        }
          //DARK ORANGE
       if (mouseX > 100) {
         if (mouseX < 200) {
           if (mouseY > 50) {
             if (mouseY < 100) {
               colorChoice = #A25100;
               picked = 1;
               random = false;
             }
           }
         }
       }
          //DARK YELLOW #A29500
       if (mouseX > 200) {
         if (mouseX < 300) {
           if (mouseY > 50) {
             if (mouseY < 100) {
               colorChoice = #A29500;
               picked = 1;
               random = false;
             }
           }
         }
       }
          //DARK GREEN #07A200
       if (mouseX > 300) {
         if (mouseX < 400) {
           if (mouseY > 50) {
             if (mouseY < 100) {
               colorChoice = #07A200;
               picked = 1;
               random = false;
             }
           }
         }
       }
          //DARK BLUE #00A299
       if (mouseX > 400) {
         if (mouseX < 500) {
           if (mouseY > 50) {
             if (mouseY < 100) {
               colorChoice = #00A299;
               picked = 1;
               random = false;
             }
           }
         }
       }
          //DARK INDIGO #0017A2
       if (mouseX > 500) {
         if (mouseX < 600) {
           if (mouseY > 50) {
             if (mouseY < 100) {
               colorChoice = #0017A2;
               picked = 1;
               random = false;
             }
           }
         }
       }
          //DARK VIOLET #5000A2
       if (mouseX > 600) {
         if (mouseX < 700) {
           if (mouseY > 50) {
             if (mouseY < 100) {
               colorChoice = #5000A2;
               picked = 1;
               random = false;
             }
           }
         }
       }
          //DARK PINK #A200A0
       if (mouseX > 700) {
         if (mouseX < 800) {
           if (mouseY > 50) {
             if (mouseY < 100) {
               colorChoice = #A200A0;
               picked = 1;
               random = false;
             }
           }
         }
       }
          //GRAY #8B8A8B
       if (mouseX > 800) {
         if (mouseX < 900) {
           if (mouseY > 50) {
             if (mouseY < 100) {
               colorChoice = #8B8A8B;
               picked = 1;
               random = false;
             }
           }
         }
       }
           //Row 3//
         //Crimson #FF5500
       if (mouseX > 0) {
         if (mouseX < 100) {
           if (mouseY > 100) {
             if (mouseY <  150) {
               colorChoice = #FF5500;
               picked = 1;
               random = false;
             }
           }
         }
       }
         //Mango #FFC505
       if (mouseX > 100) {
         if (mouseX < 200) {
           if (mouseY > 100) {
             if (mouseY < 150) {
               colorChoice = #FFC505;
               picked = 1;
               random = false;
             }
           }
         }
       }
         //Laser Lemon #EEFF05
       if (mouseX > 200) {
         if (mouseX < 300) {
           if (mouseY > 100) {
             if (mouseY < 150) {
               colorChoice = #EEFF05;
               picked = 1;
               random = false;
             }
           }
         }
       }
         //Lime #BEFF00
       if (mouseX > 300) {
         if (mouseX < 400) {
           if (mouseY > 100) {
             if (mouseY < 150) {
               colorChoice = #BEFF00;
               picked = 1;
               random = false;
             }
           }
         }
       }
         //Mint #C4FFFF
       if (mouseX > 400) {
         if (mouseX < 500) {
           if (mouseY > 100) {
             if (mouseY < 150) {
               colorChoice = #C4FFFF;
               picked = 1;
               random = false;
             }
           }
         }
       }
         //Electric Blue #00B0FF 
       if (mouseX > 500) {
         if (mouseX < 600) {
           if (mouseY > 100) {
             if (mouseY < 150) {
               colorChoice = #00B0FF;
               picked = 1;
               random = false;
             }
           }
         }
       }
         //Lavender #CF4DFF
       if (mouseX > 600) {
         if (mouseX < 700) {
           if (mouseY > 100) {
             if (mouseY < 150) {
               colorChoice = #CF4DFF;
               picked = 1;
               random = false;
             }
           }
         }
       }
         //Salmon #FF83D6
       if (mouseX > 700) {
         if (mouseX < 800) {
           if (mouseY > 100) {
             if (mouseY < 150) {
               colorChoice = #FF83D6;
               picked = 1;
               random = false;
             }
           }
         }
       }
       //Random
       if (mouseX > 800) {
         if (mouseX < 900) {
           if (mouseY > 100) {
             if (mouseY < 150) {
               random = true;
      }
    }
  }
       }
      }
    }
  }
  
 
 
 
          //-----------------------Tool Selection-----------------------//
    //BRUSH TOOL
  if (mouseX > 910) {
    if (mouseX < 1010) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            paintbrush = 1;
            tool = 0;
            //paintShape();
          }
        }
      }
    }
  }
    //ERASE TOOL
  if (mouseX > 1010) {
    if (mouseX < 1110) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            //colorChoice = #FFFFFF;
            eraser = 1;
            tool = 1;
            //paintShape();
          }
        }
      }
    }
  }
    //BUBBLE WAND TOOL
  if (toolboxOpened == true) {
    if (mousePressed==true) {
      if (mouseButton==LEFT) {
        if (mouseX > 910) {
          if (mouseX < 1010) {
            if (mouseY > 50) {
              if (mouseY < 100) {
                bubbleWand=1;
                tool = 2;
                random = false;
                fill(colorChoice);
                stroke(colorChoice);

              }
            }
          }
        }
    //SPRAY CAN TOOL
      if (mouseX > 1010) {
        if (mouseX < 1110) {
          if (mouseY > 50) {
            if (mouseY < 100) {
              sprayCan = 1;
              tool = 3;
              fill(colorChoice);
              stroke(colorChoice);

            }
          }
        }
      }
    //SPIRAL TOOL
      if (mouseX > 910) {
        if (mouseX < 1010) {
          if (mouseY > 100) {
            if (mouseY < 150) {
              //spiralTool = 1;
              tool = 4;
              fill(colorChoice);
              stroke(colorChoice);
            }
          }
        }
      }
    //RIBBON TOOL
      if (mouseX > 1010) {
        if (mouseX < 1110) {
          if (mouseY > 100) {
            if (mouseY < 150) {
              tool = 5;
              fill(colorChoice);
              stroke(colorChoice);
            }
          }
        }
      }

      }
    }
  }
}





          //-----------------------Spray Can-----------------------//
void sprayCan() {
  if (tool == 3) {
    if (mousePressed==true) {
      if (mouseButton==LEFT) {
        fill(colorChoice);
        stroke(colorChoice);
        
        sprayRangeX1 = (mouseX + random(-20, 20));
        sprayRangeY1 = (mouseY + random(-20, 20));

        ellipse(sprayRangeX1, sprayRangeY1, 1, 1);
    
        sprayRangeX1 = (mouseX + random(-20, 20));
        sprayRangeY1 = (mouseY + random(-20, 20));
    
        ellipse(sprayRangeX1, sprayRangeY1, 1, 1);
        
        
          rectMode(CORNER);
  stroke (#000000);
  //Red
  fill (#FF0000);
  rect(0, 0, 100, 50);
  //Orange
  fill (#FF9100);
  rect(100, 0, 100, 50);
  //Yellow
  fill (#FFEA00);
  rect(200, 0, 100, 50);
  //Green
  fill (#1CFF00);
  rect(300, 0, 100, 50);
  //Blue
  fill (#00F4FF);
  rect(400, 0, 100, 50);
  //Indigo
  fill (#0006FF);
  rect(500, 0, 100, 50);
  //VIOLET
  fill (#9C00FF);
  rect(600, 0, 100, 50);
  //Pink
  fill (#FF64F8);
  rect(700, 0, 100, 50);
  //Black
  fill (#000000);
  rect(800, 0, 100, 50);
  
  //Divider 1
  if (started == true) {
  fill (#555555);
  rect(900, 0, 10, 50);
  }
  
  //Square Brush
  fill (#DEDEDE);
  rect(1110, 0, 50, 50);
  //Circle Brush
  fill (#DEDEDE);
  rect(1160, 0, 50, 50);
  
  //Nuke Box
  fill (#555555);
  rect(1210, 0, 50, 50);
  
  //Bottom Divider
  if (started == true) {
  fill (#555555);
  stroke (#000000);
  rect(0, 50, 1366, 10);
  }
  
  if (started == true) {
  fill (#FF0000);
  stroke (#FF0000);
  }
  
  if (paintShape == 1) {
    imageMode(CENTER);
    img = loadImage("circle.png");
    image(img, 1135, 25, 38, 38);
  }
  
  if (paintShape == 2) {
    imageMode(CENTER);
    img = loadImage("circle.png");
    image(img, 1185, 25, 38, 38);
  }

  //Brush Tools
  rectMode (CENTER);
  fill(colorChoice);
  stroke(colorChoice);
  rect(1135, 25, 20, 20);
  ellipse(1185, 25, 20, 20);

  //Nuke
  imageMode(CORNER);
  img = loadImage("EraseAll.png");
  image(img, 1219, 9);

fill(colorChoice);
stroke(colorChoice);  
      }
      }
    }
  }



          //-----------------------Spiral/Ribbon-----------------------//
void spiral() {
  if (tool == 4) {
    if (mousePressed==true) {
      if (mouseButton==LEFT) {
        if (mouseY > 60) {
        
        spiral.rotate(0.1);
        shape(spiral, mouseX, mouseY);
        mousePos1x = (mouseX-pmouseX)/2;
        mousePos1y = (mouseY-pmouseY)/2;
        shape(spiral, pmouseX+mousePos1x, pmouseY+mousePos1y);
        
        
          rectMode(CORNER);
  stroke (#000000);
  //Red
  fill (#FF0000);
  rect(0, 0, 100, 50);
  //Orange
  fill (#FF9100);
  rect(100, 0, 100, 50);
  //Yellow
  fill (#FFEA00);
  rect(200, 0, 100, 50);
  //Green
  fill (#1CFF00);
  rect(300, 0, 100, 50);
  //Blue
  fill (#00F4FF);
  rect(400, 0, 100, 50);
  //Indigo
  fill (#0006FF);
  rect(500, 0, 100, 50);
  //VIOLET
  fill (#9C00FF);
  rect(600, 0, 100, 50);
  //Pink
  fill (#FF64F8);
  rect(700, 0, 100, 50);
  //Black
  fill (#000000);
  rect(800, 0, 100, 50);
  
  //Divider 1
  if (started == true) {
  fill (#555555);
  rect(900, 0, 10, 50);
  }
  
  //Square Brush
  fill (#DEDEDE);
  rect(1110, 0, 50, 50);
  //Circle Brush
  fill (#DEDEDE);
  rect(1160, 0, 50, 50);
  
  //Nuke Box
  fill (#555555);
  rect(1210, 0, 50, 50);
  
  //Bottom Divider
  if (started == true) {
  fill (#555555);
  stroke (#000000);
  rect(0, 50, 1366, 10);
  }
  
  if (started == true) {
  fill (#FF0000);
  stroke (#FF0000);
  }
  
  if (paintShape == 1) {
    imageMode(CENTER);
    img = loadImage("circle.png");
    image(img, 1135, 25, 38, 38);
  }
  
  if (paintShape == 2) {
    imageMode(CENTER);
    img = loadImage("circle.png");
    image(img, 1185, 25, 38, 38);
  }

  //Brush Tools
  rectMode (CENTER);
  fill(colorChoice);
  stroke(colorChoice);
  rect(1135, 25, 20, 20);
  ellipse(1185, 25, 20, 20);

  //Nuke
  imageMode(CORNER);
  img = loadImage("EraseAll.png");
  image(img, 1219, 9);

fill(colorChoice);
stroke(colorChoice);  
        }
      }
    }
  }
  if (tool == 5) {
    if (mousePressed==true) {
      if (mouseButton==LEFT) {
        if (mouseY > 65) {
        shape(ribbon, mouseX, mouseY);
        mousePos1x = (mouseX-pmouseX)/2;
        mousePos1y = (mouseY-pmouseY)/2;
        shape(ribbon, pmouseX+mousePos1x, pmouseY+mousePos1y);
        }
      }
    }
  }
}
  
        //-----------------------Random-----------------------//
void randomColor() {
  if (random == true) {
    if (tool != 2) {
    float R = random(255);
    float B = random(255);
    float G = random(255);
    color RandomColor = color(R, G, B);
    
    colorChoice = RandomColor;
  fill (colorChoice);
  noStroke();
}
}
}
  
  
  
          //-----------------------Nuke-----------------------//
void startOver() {
  if (mouseX > (1210)) {
    if (mouseX < 1260) {
      if (mouseY < 50) {
        if (mousePressed==true) {
          if (mouseButton==LEFT) {
            if (toolboxOpened != true) {
              rectMode(CORNER);
              fill(255);
              stroke(0);
              rect(0, 60, width, (height - 60));
              nuked = 1;
            }
            if (toolboxOpened == true) {
              close.play();
              rectMode (CORNER);
              fill(#555555);
              stroke(#000000);
              rect(0, 50, 1365, 10);
              imageMode(CORNER);
              img = loadImage("toolboxSpace.pdf.tif");
              image(img, 0, 60);
              drawSpaceX = 0;
              drawSpaceY = 60;
              toolboxOpened = false;
              
              
              rectMode(CORNER);
              fill(255);
              stroke(0);
              rect(0, 60, width, (height - 60));
              nuked = 1;
            }  
          }
        }
      }
    }
  }
}



          //-----------------------Sound Triggers-----------------------//
//SOUND TRIGGERS//
void mouseClicked() {
  if (picked == 1) {
    splash.play(.5);
    picked = 0;
  }
  if (nuked == 1) {
    nuke.play(.5);
    nuked = 0;
}
  if (eraser == 1) {
    tool = 1;
    erase.play();
    eraser = 0;
  }
  if (paintbrush == 1) {
    tool = 0;
    brush.play();
    paintbrush = 0;
  }
  if (bubbleWand == 1) {
    tool = 2;
    bubble.play();
    bubbleWand = 0;
    tool = 2;
  }
  if (sprayCan == 1) {
    spraycan.play();
    sprayCan = 0;
  }
  
  bubbleAllowed = true;
  
  toolboxOpenToClose();
  
  if (mouseX > 1260) {
    if (mouseX < 1366) {
      if (mouseY < 60) {
          if (mouseButton==LEFT) {
            if (toolboxOpened == false) {
              open.play();
              PImage partialSave = get(0,60,1366,171);
              partialSave.save("toolboxSpace.pdf.tif");
              rectMode(CORNER);
              fill(#670000);
              stroke(#460000);
              rect(0, 50, 1366, 180);
              fill (#555555);
              stroke (#000000);
              rect(900, 0, 10, 220);
              rect(0, 220, 1366, 10);
              drawSpaceY = 230;
              toolboxOpened = true;
            } else {
              close.play();
              rectMode (CORNER);
              fill(#555555);
              stroke(#000000);
              rect(0, 50, 1365, 10);
              imageMode(CORNER);
              img = loadImage("toolboxSpace.pdf.tif");
              image(img, 0, 60);
              drawSpaceX = 0;
              drawSpaceY = 60;
              toolboxOpened = false;
            }
            }
          }
      }
    }
  }



void mouseDragged() {
  if (blowingBubble == true) {
    blowingBubble = false;
    bubbleAllowed = false;
  }
}


void toolboxOpenToClose() {
  if (toolboxOpened==true) {
    if ((mouseX < 1260) || (mouseX > 1366)) {
      if (mouseY < 240) {
        if (mousePressed==true) {
          imageMode(CORNER);
          img = loadImage("toolboxSpace.pdf.tif");
          image(img, 0, 60);
          fill(#555555);
          stroke(#000000);
          rectMode(CORNER);
          rect(0, 50, 1365, 10);
          drawSpaceX = 0;
          drawSpaceY = 60;
          toolboxOpened = false;
          delay(150);
        }
      }
    }
  }
}
    