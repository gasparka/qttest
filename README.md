Experiments to run QT in Docker. Spent much time with OpenGL errors, but on work computer which has Nvidia GPU. In the end i did not manage to get it running.

Now i tested with pyside2 instead of QT5 on my home computer (no NVIDIA) and got it working by figuring out missing libraries:
https://stackoverflow.com/questions/17106315/failed-to-load-platform-plugin-xcb-while-launching-qt5-app-on-linux-without

I am hoping i get it working on Nvidia aswell!

```
docker run -it --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --name qttest --rm qttest
```