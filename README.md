DevContainer内にGitHub認証を連携する方法

## GitHub CLIのインストール

[.devcontainer/devcontainer-gh.json](.devcontainer/devcontainer-gh.json)

- featureでGitHub CLIをインストールする

HTTPS経由にする

```bash
git remote set-url origin https://github.com/74th/devcontainer-book-2nd-sample-github-auth.git
```

```bash
devcontainer up --config .devcontainer/devcontainer-gh.json --workspace-folder .
```

```bash
devcontainer exec --config .devcontainer/devcontainer-gh.json --workspace-folder . bash

gh auth login

git config --global user.name "Atsushi Morimoto (74th)"
git config --global user.email "74th.tech@gmail.com"
git commit -m 'test' --allow-empty
git push
```

## SSHエージェントのフォワーディング

[.devcontainer/devcontainer-ssh_agent.json](.devcontainer/devcontainer-ssh_agent.json)

- SSH_AUTH_SOCKをマウントする
- 環境変数SSH_AUTH_SOCKに、マウントしたパスを設定する

```bash
git remote set-url origin git@github.com:74th/devcontainer-book-2nd-sample-github-auth.git
```

SSH Agentを起動する

```bash
# 起動
eval "$(ssh-agent -s)"

# 鍵の追加
ssh-add ~/.ssh/id_ed25519
```


```bash
devcontainer exec --config .devcontainer/devcontainer-gh.json --workspace-folder . bash

gh auth login

git config --global user.name "Atsushi Morimoto (74th)"
git config --global user.email "74th.tech@gmail.com"
git commit -m 'test' --allow-empty
git push
```

## GitHub Tokenを渡す
