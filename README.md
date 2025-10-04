DevContainer内にGitHub認証を連携する方法

## GitHub CLIのインストール

[.devcontainer/devcontainer-gh.json](.devcontainer/devcontainer-gh.json)

HTTPS経由にする

```
git remote set-url origin https://github.com/74th/devcontainer-book-2nd-sample-github-auth.git
```

```
devcontainer up --config .devcontainer/devcontainer-gh.json --workspace-folder .
```

```
devcontainer exec --config .devcontainer/devcontainer-gh.json --workspace-folder . bash

gh auth login

git config --global user.name "74th"
git config --global user.mail "74th.tech@gmail.com"
git commit -m 'test' --allow-empty
git push
```

## SSHエージェントのフォワーディング

```
git remote set-url origin git@github.com:74th/devcontainer-book-2nd-sample-github-auth.git
```