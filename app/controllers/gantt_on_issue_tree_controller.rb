class GanttOnIssueTreeController < ApplicationController
  unloadable
  helper :issues
  helper :gantt
  helper :queries
  helper :sort
  include SortHelper
  include QueriesHelper
  
  def get_query(issue_id)
    query=IssueQuery.new(:name => '_')
    query.add_filter('parent_id','~',[issue_id])
    query.save
    return query
  end
  
  def show_gant
    @query = get_query(params[:issue_id])

    redirect_to :controller => 'gantts', :action => 'show', :query_id => @query.id
  end    
  
  def show_list
    @query = get_query(params[:issue_id])
    redirect_to :controller => 'issues', :action => 'index', :query_id => @query.id
  end
end
