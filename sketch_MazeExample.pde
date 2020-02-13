
int resX = 800;
int resY = 480;
PGraphics shadingOverlay;
PGraphics shadingOverlayInverted;
PGraphics shadingOverlayMask;

PGraphics centerBackWall;
PGraphics centerMiddleWall;
PGraphics centerFrontWall;

PGraphics leftFarBackWall;
PGraphics leftBackWall;
PGraphics leftMiddleWall;
PGraphics leftFrontWall;

PGraphics rightFarBackWall;
PGraphics rightBackWall;
PGraphics rightMiddleWall;
PGraphics rightFrontWall;

float x = 0;
float y = 0.5*resY;
final float dx = 1;
int seed = int(random(100));

void settings(){
    size(resX, resY*2);
}

void setup(){
    frameRate(60);
    background(0);

    setupPg();
    setupShadingOverlay();
    setupMazeWalls(seed);
}

void draw(){
    //updateBackground();
    //background(0);
    randomSeed();

    drawFps();
}

void drawFps() {
    noStroke();
    fill(0);
    rect(resX-46, 5, 46, 10);
    fill(200, 200, 0);
    text("fps: ", resX-46, 15);
    fill(180);
    text(frameRate, resX-26, 15);
}

void updateBackground() {
    noStroke();
    fill(0, 20);
    rect(0, 0, resX, resY*2);
}

void randomSeed() {
    if (frameCount % 60*100 == 0) {
        seed++;
    }
}

void setupPg() {
    
    shadingOverlay = createGraphics(800, 480);
    shadingOverlayInverted = createGraphics(800, 480);
    shadingOverlayMask = createGraphics(800, 480);

    centerBackWall = createGraphics(800, 480);
    centerMiddleWall = createGraphics(800, 480);
    centerFrontWall = createGraphics(800, 480);

    leftFarBackWall = createGraphics(800, 480);
    leftBackWall = createGraphics(800, 480);
    leftMiddleWall = createGraphics(800, 480);
    leftFrontWall = createGraphics(800, 480);

    rightFarBackWall = createGraphics(800, 480);
    rightBackWall = createGraphics(800, 480);
    rightMiddleWall = createGraphics(800, 480);
    rightFrontWall = createGraphics(800, 480);
}