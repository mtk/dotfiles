time rsync -avx \
     --delete \
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
     /home/mtk g/Backup/home 2>&1 | ts | tee -a google-drive-backup.log
