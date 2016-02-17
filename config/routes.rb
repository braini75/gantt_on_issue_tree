# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
RedmineApp::Application.routes.draw do    
    match 'gantt_on_issue_tree/(:action)',via: [:get, :post], :controller => 'gantt_on_issue_tree'
end