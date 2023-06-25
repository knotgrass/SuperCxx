#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"
#include <stdio.h>

using namespace cv;

static void help(char** argv)
{
    printf("\nThis program demonstrates OpenCV drawing and text output functions.\n"
    "Usage:\n"
    "   %s\n", argv[0]);
}
static Scalar randomColor(RNG& rng)
{
    int icolor = (unsigned)rng;
    return Scalar(icolor&255, (icolor>>8)&255, (icolor>>16)&255);
}

int main(int /* argc */, char** argv)
{
    help(argv);
    char wndname[] = "Drawing Demo";
    const int NUMBER = 100;
    const int DELAY = 5;
    int lineType = LINE_AA; // change it to LINE_8 to see non-antialiased graphics
    int i, width = 1000, height = 700;
    int x1 = -width/2, x2 = width*3/2, y1 = -height/2, y2 = height*3/2;
    RNG rng(0xFFFFFFFF);

    Mat image = Mat::zeros(height, width, CV_8UC3);
    imshow(wndname, image);
    waitKey(DELAY);

    for (i = 0; i < NUMBER * 2; i++) {
        Point pt1, pt2;
        pt1.x = rng.uniform(x1, x2);
        pt1.y = rng.uniform(y1, y2);
        pt2.x = rng.uniform(x1, x2);
        pt2.y = rng.uniform(y1, y2);

        int arrowed = rng.uniform(0, 6);

        if( arrowed < 3 )
            line( image, pt1, pt2, randomColor(rng), rng.uniform(1,10), lineType );
        else
            arrowedLine(image, pt1, pt2, randomColor(rng), rng.uniform(1, 10), lineType);

        imshow(wndname, image);
        if(waitKey(DELAY) >= 0)
            return 0;
    }

    for (i = 0; i < NUMBER * 2; i++) {
        Point pt1, pt2;
        pt1.x = rng.uniform(x1, x2);
        pt1.y = rng.uniform(y1, y2);
        pt2.x = rng.uniform(x1, x2);
        pt2.y = rng.uniform(y1, y2);
        int thickness = rng.uniform(-3, 10);
        int marker = rng.uniform(0, 10);
        int marker_size = rng.uniform(30, 80);

        if (marker > 5)
            rectangle(image, pt1, pt2, randomColor(rng), MAX(thickness, -1), lineType);
        else
            drawMarker(image, pt1, randomColor(rng), marker, marker_size );

        imshow(wndname, image);
        if(waitKey(DELAY) >= 0)
            return 0;
    }

    for (i = 0; i < NUMBER; i++) {
        Point center;
        center.x = rng.uniform(x1, x2);
        center.y = rng.uniform(y1, y2);
        Size axes;
        axes.width = rng.uniform(0, 200);
        axes.height = rng.uniform(0, 200);
        double angle = rng.uniform(0, 180);

        ellipse( image, center, axes, angle, angle - 100, angle + 200,
                 randomColor(rng), rng.uniform(-1,9), lineType );

        imshow(wndname, image);
        if(waitKey(DELAY) >= 0)
            return 0;
    }

    for (i = 0; i< NUMBER; i++) {
        Point pt[2][3];
        pt[0][0].x = rng.uniform(x1, x2);
        pt[0][0].y = rng.uniform(y1, y2);
        pt[0][1].x = rng.uniform(x1, x2);
        pt[0][1].y = rng.uniform(y1, y2);
        pt[0][2].x = rng.uniform(x1, x2);
        pt[0][2].y = rng.uniform(y1, y2);
        pt[1][0].x = rng.uniform(x1, x2);
        pt[1][0].y = rng.uniform(y1, y2);
        pt[1][1].x = rng.uniform(x1, x2);
        pt[1][1].y = rng.uniform(y1, y2);
        pt[1][2].x = rng.uniform(x1, x2);
        pt[1][2].y = rng.uniform(y1, y2);
        const Point* ppt[2] = {pt[0], pt[1]};
        int npt[] = {3, 3};

        polylines(image, ppt, npt, 2, true, randomColor(rng), rng.uniform(1,10), lineType);

        imshow(wndname, image);
        if(waitKey(DELAY) >= 0)
            return 0;
    }

    for (i = 0; i< NUMBER; i++) {
        Point pt[2][3];
        pt[0][0].x = rng.uniform(x1, x2);
        pt[0][0].y = rng.uniform(y1, y2);
        pt[0][1].x = rng.uniform(x1, x2);
        pt[0][1].y = rng.uniform(y1, y2);
        pt[0][2].x = rng.uniform(x1, x2);
        pt[0][2].y = rng.uniform(y1, y2);
        pt[1][0].x = rng.uniform(x1, x2);
        pt[1][0].y = rng.uniform(y1, y2);
        pt[1][1].x = rng.uniform(x1, x2);
        pt[1][1].y = rng.uniform(y1, y2);
        pt[1][2].x = rng.uniform(x1, x2);
        pt[1][2].y = rng.uniform(y1, y2);
        const Point* ppt[2] = {pt[0], pt[1]};
        int npt[] = {3, 3};

        fillPoly(image, ppt, npt, 2, randomColor(rng), lineType);

        imshow(wndname, image);
        if(waitKey(DELAY) >= 0)
            return 0;
    }

    for (i = 0; i < NUMBER; i++){
        Point center;
        center.x = rng.uniform(x1, x2);
        center.y = rng.uniform(y1, y2);

        circle(image, center, rng.uniform(0, 300), randomColor(rng),
               rng.uniform(-1, 9), lineType);

        imshow(wndname, image);
        if(waitKey(DELAY) >= 0)
            return 0;
    }

    for (i = 1; i < NUMBER; i++){
        Point org;
        org.x = rng.uniform(x1, x2);
        org.y = rng.uniform(y1, y2);

        putText(image, "Testing text rendering", org, rng.uniform(0,8),
                rng.uniform(0,100)*0.05+0.1, randomColor(rng), rng.uniform(1, 10), lineType);

        imshow(wndname, image);
        if(waitKey(DELAY) >= 0)
            return 0;
    }

    Size textsize = getTextSize("OpenCV forever!", FONT_HERSHEY_COMPLEX, 3, 5, 0);
    Point org((width - textsize.width)/2, (height - textsize.height)/2);

    Mat image2;
    for( i = 0; i < 255; i += 2 ){
        image2 = image - Scalar::all(i);
        putText(image2, "OpenCV forever!", org, FONT_HERSHEY_COMPLEX, 3,
                Scalar(i, i, 255), 5, lineType);

        imshow(wndname, image2);
        if(waitKey(DELAY) >= 0)
            return 0;
    }

    waitKey();
    return 0;
}

/*
Note use / don't use `-D_GLIBCXX_USE_CXX11_ABI=0` -flag
https://chat.openai.com/share/22b03035-383b-420a-8370-f0b5f53c08c4

Note compile cmd
/usr/bin/g++ -fdiagnostics-color=always -std=c++17 -g \
    /home/tz/Documents/programming/SuperCxx/examples/drawing_opencv.cpp \
    -o /home/tz/Documents/programming/SuperCxx/examples/bin/drawing_opencv \
    -I /home/tz/Documents/programming/SuperCxx/third_party/opencv_contrib/include/opencv4 \
    -L /home/tz/Documents/programming/SuperCxx/third_party/opencv_contrib/lib \
    -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -lgthread-2.0 -lglib-2.0


Note run cmd
sudo ldconfig
export LD_LIBRARY_PATH=/home/tz/Documents/programming/SuperCxx/third_party/opencv_contrib/lib:$LD_LIBRARY_PATH
*/
