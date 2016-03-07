Redmine::Plugin.register :gantt_on_issue_tree do
  name 'Gantt On Issue Tree plugin'
  author 'Thomas Koch'
  description 'This Redmine-Plugin adds a "Show Gantt of Issue(s)" offers a tree view for browsing projects.'
  version '1.0'
  url 'https://github.com/braini75/gantt_on_issue_tree.git'
  author_url 'ttps://github.com/braini75'
  require 'gantt_on_issue_hooks'
end
