# 同人誌『DevContainer実践ガイド』サンプルコード - GitHubの認証情報の持ち込み方

<img src="./material/ebook.png" alt="DevContainer実践ガイド表紙" width="600"/>

このリポジトリは技術書典19にては [@74th](https://github.com/74th) が頒布した同人誌『DevContainer実践ガイド』のサンプルコードを収録しています。

販売先: Booth https://74th.booth.pm/items/7605652

## サンプルコードの内容

### 本紙掲載

- [.devcontainer/gh](.devcontainer/gh) : GitHub CLIを使ってGitHub認証を行う
- [.devcontainer/token_with_env](.devcontainer/token_with_env) : GitHub Tokenを環境変数で渡す
- [.devcontainer/gh_token_with_secret_mount](.devcontainer/gh_token_with_secret_mount) : GitHub Tokenをシークレットのファイルマウントで渡す

### 本紙掲載外

- [.devcontainer/ssh_agent](.devcontainer/ssh_agent) : SSHエージェントのフォワーディング
- [.devcontainer/token_with_secret](.devcontainer/token_with_secret) : GitHub Tokenをシークレットの環境変数で渡す
- [.devcontainer/gh_token_with_secret_mount_simple](.devcontainer/gh_token_with_secret_mount_simple) : GitHub Tokenをシークレットのファイルマウントで渡す
- [.devcontainer/credential_by_mount](.devcontainer/credential_by_mount) : GitHub Tokenをシークレットのファイルマウントで渡す

## LICENSE

CC-0

再掲する際は本書を一緒に紹介していただけると嬉しいです！

## 実装内容を示した調査メモ

[./MEMO.md](./MEMO.md)
