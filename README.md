## cygwin

### pacman を使用可能にする（プロキシ設定されている場合`-x`オプションを使用）

- msys64/etc/pacman.conf
```
XferCommand = /usr/bin/curl -x proxy.example.com:port -C - -f %u > %o
```

### msysにてシンボリックリンクを作成できるようにする

- `msys64/msys2_shell.cmd`を修正
    - 変更前
    ```
    rem set MSYS=winsymlinks:nativestrict
    ```
    - 変更後
    ```
    set MSYS=winsymlinks:nativestrict
    ```
- 変更した`msys2_shell.cmd`から`ln`が実行できる

### msys conf

- pacman -S tar
- pacman -S global
- pacman -S zip
- pacman -S unzip
- pipを動かすためにcrypt.h (libcrypt-devel)が必要
    - errorからcrypt.hが存在しないことを確認。以下からlibcrypt-develであることを確認
    - http://d.hatena.ne.jp/perlcodesample/20180806/1533509897
    - pip3 install --upgrade neovim ※deoplete用に必要

- git プロキシ管理
    - git config --global http.proxy http://proxy.example.com:port
    - git config --global https.proxy http://proxy.example.com:port

- trans on vim
    - pacman -S make
    - git clone https://github.com/soimort/translate-shell/
    - cd translate-shell
    - make
    - make install
    - bashrc
        - export $MYPROXY='proxy.example.com:port'

### msys option

- フォントHGゴシック、太字、12pt

## kaoriya gvim

- `_vimrc`,`_gvimrc`を設置
