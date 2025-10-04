DevContainer内にGitHub認証を連携する方法

## GitHub CLIのインストール

[.devcontainer-gh/devcontainer.json](.devcontainer-gh/devcontainer.json)

- featureでGitHub CLIをインストールする

HTTPS経由にする

```bash
git remote set-url origin https://github.com/74th/devcontainer-book-2nd-sample-github-auth.git
```

```bash
devcontainer up --config .devcontainer-gh/devcontainer.json --workspace-folder .
```

```bash
devcontainer exec --config .devcontainer-gh/devcontainer.json --workspace-folder . bash

gh auth login

git config --global user.name "Atsushi Morimoto (74th)"
git config --global user.email "74th.tech@gmail.com"
git commit -m 'test' --allow-empty
git push
```

## SSHエージェントのフォワーディング

[.devcontainer-ssh_agent/devcontainer.json](.devcontainer-ssh_agent/devcontainer.json)

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
devcontainer up --config .devcontainer-ssh_agent/devcontainer.json --workspace-folder .
```

```bash
devcontainer exec --config .devcontainer-ssh_agent/devcontainer.json --workspace-folder . bash

git config --global user.name "Atsushi Morimoto (74th)"
git config --global user.email "74th.tech@gmail.com"
git commit -m 'test' --allow-empty
git push
```

## GitHub Tokenを環境変数で渡す

[.devcontainer-gh_token_with_env/devcontainer.json](.devcontainer-gh_token_with_env/devcontainer.json)

HTTPS経由にする

```bash
git remote set-url origin https://github.com/74th/devcontainer-book-2nd-sample-github-auth.git
```

トークンの出力

```bash
export GH_TOKEN=$(gh auth token)
```

```bash
devcontainer up --config .devcontainer-gh_token_with_env/devcontainer.json --workspace-folder .
```

ghコマンドをヘルパーに使う

```bash
devcontainer exec --config .devcontainer-gh_token_with_env/devcontainer.json --workspace-folder . bash

gh auth setup-git

git config --global user.name "Atsushi Morimoto (74th)"
git config --global user.email "74th.tech@gmail.com"
git commit -m 'test' --allow-empty
git push
```

ghコマンドなしでヘルパーを実現する場合

```bash
devcontainer exec --config .devcontainer-gh_token_with_env/devcontainer.json --workspace-folder . bash

git config --global credential.helper '!f() { echo username=x; echo password=${GH_TOKEN}; }; f'
git config --global credential.useHttpPath true

git config --global user.name "Atsushi Morimoto (74th)"
git config --global user.email "74th.tech@gmail.com"
git commit -m 'test' --allow-empty
git push
```

トークン変更の度に環境変数の変更が必要になり、DevContainerの再構築が必要になるため、あまり実用的ではない。

## GitHub Tokenをシークレットで渡す

[.devcontainer-gh_token_with_secret/devcontainer.json](.devcontainer-gh_token_with_secret/devcontainer.json)

HTTPS経由にする

```bash
git remote set-url origin https://github.com/74th/devcontainer-book-2nd-sample-github-auth.git
```

トークンの出力

```bash
export GH_TOKEN=$(gh auth token)
```

```bash
devcontainer up --config .devcontainer-gh_token_with_secret/devcontainer.json --workspace-folder .
```

ghコマンドをヘルパーに使う場合

```bash
devcontainer exec --config .devcontainer-gh_token_with_secret/devcontainer.json --workspace-folder . bash

export GH_TOKEN=$(cat /run/secrets/gh_token 2>/dev/null)
gh auth setup-git

git config --global user.name "Atsushi Morimoto (74th)"
git config --global user.email "74th.tech@gmail.com"
git commit -m 'test' --allow-empty
git push
```

ghコマンドなしでヘルパーを実現する場合

```bash
devcontainer exec --config .devcontainer-gh_token_with_secret/devcontainer.json --workspace-folder . bash

git config --global credential.helper '!f() { echo username=x; echo password=$(cat /run/secrets/gh_token 2>/dev/null); }; f'
git config --global credential.useHttpPath true

git config --global user.name "Atsushi Morimoto (74th)"
git config --global user.email "74th.tech@gmail.com"
git commit -m 'test' --allow-empty
git push
```
