#     --delete \
time rsync -avx \
     --exclude mtk/.purple/icons \
     --exclude mtk/.mozilla \
     --exclude mtk/.emacs.d/.cache \
     --exclude mtk/.ivy2 \
     --exclude mtk/.jdks \
     --exclude mtk/.emacs.d/elpy \
     --exclude mtk/.config \
     --exclude mtk/.azure* \
     --exclude .emacs.d/elpa \
     --exclude mtk/.local \
     --exclude mtk/.cache \
     --exclude mtk/.ccache \
     --exclude mtk/.gdfuse \
     --exclude mtk/g \
     --exclude mtk/.vscode \
     --exclude mtk/.ammonite \
     --exclude mtk/.azuredatastudio \
     --exclude mtk/.cargo \
     --exclude mtk/.emacs.d \
     --exclude mtk/.ivy2 \
     --exclude mtk/.java \
     --exclude mtk/.jdks \
     --exclude mtk/.kde \
     --exclude mtk/.local \
     --exclude mtk/.mill \
     --exclude mtk/.mozilla \
     --exclude mtk/.native-image \
     --exclude mtk/.pipe* \
     --exclude mtk/.sbt \
     --exclude mtk/.scala-build \
     --exclude mtk/.pydataset \
     --exclude mtk/.npm \
     --exclude '*.class' \
     /home/mtk g/Backup/home 2>&1 | ts | tee -a google-drive-backup.log
