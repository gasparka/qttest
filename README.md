Experiments to run QT in Docker. Spent much time with OpenGL errors, but on work computer which has Nvidia GPU. In the end i did not manage to get it running.

Now i tested with pyside2 instead of QT5 on my home computer (no NVIDIA) and got it working by figuring out missing libraries:
https://stackoverflow.com/questions/17106315/failed-to-load-platform-plugin-xcb-while-launching-qt5-app-on-linux-without

I am hoping i get it working on Nvidia aswell!

```
docker run -it --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --name qttest --rm qttest
```
Later:
Nvidia tests failed even when i used the Nvidia OpenGL base - it only support EGL not GPX(or what ever)

Finally i found that i just need to set the QMLSCENE_DEVICE=softwarecontext env to disable opengl rendering - and get everything working. I googled for this ALOT and did not find it before, feel kind of stupid that i spent so much time on this...but oh well... in the end it works.
Credits to:
https://netvandal.org/2018/08/27/no-opengl-does-not-means-no-qt-quick-2/
https://doc.qt.io/QtQuick2DRenderer/

Note that you still need to install openGL stuff or:
```
Traceback (most recent call last):
  File "/src/main.py", line 1, in <module>
    from PySide2.QtWidgets import QApplication
ImportError: libGL.so.1: cannot open shared object file: No such file or directory
```


