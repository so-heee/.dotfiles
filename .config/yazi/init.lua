-- yazi 内で移動したディレクトリも zoxide DB に登録する
require("zoxide"):setup({
  update_db = true,
})

-- ペインに枠線を表示
require("full-border"):setup()

-- ファイル一覧に Git ステータスを表示
require("git"):setup({
  order = 1500,
})
