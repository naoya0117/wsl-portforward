# [wsl-portforward](https://github.com/naoya0117/wsl-portforward)

- wslとwindows間のポートフォワーディングを実行するスクリプトファイル
- wslとwindowsは別のIPアドレスで管理されているため、windowsと同ネットワーク下の端末であっても外部端末から直接wslにアクセスすることができない。
- powershellスクリプトを利用し、wslの3000番ポートとwindowsの3000番ポートを接続し、windowsの3000番ポートからwslのアプリケーションにアクセスできるようにした。(portforward)
  - このスクリプトはまず、古い3000番ポートのポートフォワードと関連するfirewallの設定を削除する。(wslのローカルipアドレスが動的であるため,ネットワークが変わるごとに設定(スクリプト実行)が必要)
  - 次に、3000番ポートのポートフォワードと関連するfirewallの設定を行う。
  
# notice

- powershellスクリプトには予め、実行ポリシーの設定とスクリプト自体の実行許可(常時)を行う必要がある。また、管理者権限が必要。(実行権限は通常ユーザでも可だが権限昇格がある。)
- 別のportで実行したい場合は、port変数を変更してください

## Contact

- Repository: [https://github.com/naoya0117/vim_runtime](https://github.com/naoya0117/wsl-portforward)
- GitHub: [https://github.com/naoya0117](https://github.com/naoya0117)
- Blog: [https://naoya0117.com](https://naoya0117.com)
