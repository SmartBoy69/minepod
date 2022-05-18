FROM gitpod/workspace-full-vnc:2022-05-08-14-31-53

RUN sudo apt-get update && \
    sudo apt-get install -y libgtk-3-dev && \
    sudo rm -rf /var/lib/apt/lists/

# blank
# Install novnc. Perhaps redundant now... Maybe doesn't actually affect anything. Maybe use root user?
RUN sudo rm -rf /opt/novnc \
    && sudo git clone --depth 1 --single-branch --branch pointer-lock-api https://github.com/mteam88/noVNC /opt/novnc \
    && sudo git clone --depth 1 https://github.com/novnc/websockify /opt/novnc/utils/websockify

RUN sudo apt-get update && \
    wget https://launcher.mojang.com/download/Minecraft.deb && \
    sudo dpkg -i Minecraft.deb; exit 0 && \
    sudo apt -y install -f 

RUN sudo apt-get update && \
   wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.4-35.0.18/forge-1.16.4-35.0.18-installer.jar -O ~/Downloads/forge-1.16.4-35.0.18-installer.jar && \
   cd ~/Downloads; exit 0 && \
   java -jar forge-1.16.4-35.0.18-installer.jar
