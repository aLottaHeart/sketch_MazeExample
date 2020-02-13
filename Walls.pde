int den = 16;
final int[][] farBackWall = { {6, 7, 7, 6}, {6, 7, 9, 10}, {7, 7, 9, 9} };
final int[][] backWall = { {5, 6, 6, 5}, {5, 6, 10, 11}, {6, 6, 10, 10} };
final int[][] middleWall = { {2, 5, 5, 2}, {2, 5, 11, 14}, {5, 5, 11, 11} };
final int[][] frontWall = { {-1, 2, 2, -1}, {-1, 2, 14, 17}, {2, 2, 14, 14} };

void setupMazeWalls(int seed) {
    randomSeed(seed);
    pushMatrix();
        translate(0, resY);
        stroke(120);
        strokeWeight(1);
        drawSideWall(leftFarBackWall, farBackWall, isWalkable()); 
        drawSideWall(leftBackWall, backWall, true); 
        drawSideWall(leftMiddleWall, middleWall, isWalkable()); 
        drawSideWall(leftFrontWall, frontWall, isWalkable()); 
        pushMatrix();
            translate(resX, resY);
            rotate(PI);
            drawSideWall(rightFarBackWall, farBackWall, isWalkable());
            drawSideWall(rightBackWall, backWall, isWalkable()); 
            drawSideWall(rightMiddleWall, middleWall, true); 
            drawSideWall(rightFrontWall, frontWall, isWalkable()); 
        popMatrix();
        drawCenterWall(backWall, true); 
        drawCenterWall(middleWall, true); 
        drawCenterWall(frontWall, true); 
    popMatrix();
}

void drawSideWall(PGraphics pg, int[][] wall, boolean isWalkable) {
    int k = 0;
    int l = 1;
    if (isWalkable)
        l = 2;
    shadingOverlayMask.beginDraw();
    shadingOverlayMask.clear();
    shadingOverlayMask.beginShape();
    for (int i = 0; i < wall[1].length; ++i) {
        shadingOverlayMask.vertex(resX*wall[k][i]/den, 
            resY*wall[l][i]/den);
    }
    shadingOverlayMask.endShape(CLOSE);
    shadingOverlayMask.endDraw();
    if (isWalkable) {
        pg = shadingOverlay;
        pg.fill(255);
        pg.mask(shadingOverlayMask);
        pushMatrix();
            image(pg, 0, 0);
        popMatrix();
    } else {
        //tint(255, 200);
        pg = shadingOverlay;
        pg.mask(shadingOverlayMask);
        image(pg, 0, 0);
    }
}

void drawCenterWall(int[][] wall, boolean isWalkable) {
    if (!isWalkable) {
        rect(resX*wall[0][1]/den, 
            resY*wall[1][1]/den, 
            resX*(16-2*wall[0][1])/den, 
            resY*(wall[1][2]-wall[1][1])/den);
    }
}

boolean isWalkable() {
    //return random(1) > 0.5;
    return false;
}

void setupShadingOverlay() {
    pushMatrix();
        translate(0, resY);
        strokeWeight(1);
        int hue = 110;
        shadingOverlay.beginDraw();
        float g = 255;
        float h = 800;
        for (int i = 0; i < resX; ++i) {
            h = map(i, 0, resX, 0, PI);
            g = (1-abs(sin(h)))*hue;
            shadingOverlay.stroke(g);
            shadingOverlay.line(i, 0, i, resY);
        }
        shadingOverlay.endDraw();
        //image(shadingOverlay, 0, 0);
        /*
        shadingOverlayInverted.beginDraw();
        for (int i = 0; i < resX; ++i) {
            g = map(pow(abs(i-resX/2),1/8), resX/2, 0, 0, hue);
            shadingOverlayInverted.stroke(g);
            shadingOverlayInverted.line(i, 0, i, resY);
        }
        shadingOverlayInverted.endDraw();
        */
    popMatrix();
}