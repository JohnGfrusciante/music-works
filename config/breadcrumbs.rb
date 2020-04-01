# crumb :root do
#   link "Home", root_path
# end


# ルート
crumb :root do
  link "トップページ", root_path
end

# 会員マイページ
crumb :mypage do
  link "会員マイページ", mypages_path
end

# 会員情報編集ページ
crumb :edit_user do
  link "会員情報編集ページ", edit_user_path
  parent :mypage
end

# 会員情報編集完了ページ
crumb :update_user do
  link "会員情報編集完了", update_user_path
  parent :edit_user
end

# ブックマーク案件一覧ページ
crumb :likes_list do
  link "ブックマーク案件一覧", likes_path
  parent :mypage
end

# 応募案件一覧ページ
crumb :applications_list do
  link "応募案件一覧", applications_lists_path
  parent :mypage
end

# 会員チャット一覧ページ
crumb :user_chatslist do
  link "チャット一覧", user_chatslists_path
  parent :mypage
end

# 会員チャットメッセージページ
crumb :user_chatpage do
  link "チャットページ", matter_chat_messages_path
  parent :user_chatslist
end

# アーティストページ
crumb :musician do
  link "アーティストページ", musician_path(current_user.musician.id)
end

# 案件依頼作成ページ
crumb :new_matter do
  link "案件依頼作成", new_matter_path
  parent :musician
end

# 案件依頼作成完了ページ
crumb :create_matter do
  link "依頼作成完了", matters_path
  parent :new_matter
end

# 案件依頼編集ページ
crumb :edit_matter do
  link "案件依頼編集", edit_matter_path()
  parent :musician
end

# 案件依頼編集完了ページ
crumb :update_matter do
  link "案件依頼編集完了", matter_path()
  parent :edit_matter
end

# アーティストプロフィール編集ページ
crumb :edit_musician do
  link "プロフィール編集", edit_musician_path
  parent :musician
end

# アーティストプロフィール編集完了ページ
crumb :update_musician do
  link "編集完了", musician_path
  parent :edit_musician
end

# 応募結果一覧ページ
crumb :musician_matterslists do
  link "応募結果一覧ページ", musician_musician_matterslists_path
  parent :musician
end

# アーティスト用チャット一覧ページ
crumb :musician_chatslists do
  link "チャット一覧", musician_chatslists_path
  parent :musician
end

# アーティスト用チャットメッセージページ
crumb :musician_chatpage do
  link "チャットページ", matter_chat_reply_messages_path
  parent :musician_chatslists
end

# 案件検索結果ページ(キーワード検索)
crumb :search_matters do
  link "検索結果", search_matters_path
  parent :root
end

# 案件検索結果ページ(カテゴリ検索)
crumb :category_search_matters do
  link "検索結果", category_search_matters_path
  parent :root
end

# ユーザースキル検索結果ページ
crumb :user_search_tags do
  link "ユーザー検索", user_search_musician_tags_path(current_user.musician.id)
  parent :musician
end

# 案件オファーページ
crumb :offer do
  link "オファーページ", user_offers_path
  parent :user_search_tags
end

# オファーが届いた案件の一覧ページ
crumb :offered_list do
  link "オファー一覧ページ", user_offered_lists_path
  parent :mypage
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
