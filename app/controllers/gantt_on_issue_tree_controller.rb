class GanttOnIssueTreeController < ApplicationController
  unloadable
  helper :issues
  helper :gantt
  helper :queries
  helper :sort
  include SortHelper
  include QueriesHelper    

  #directly show gantt of childs
  def show_gant
    set_query(params[:issue_id])
    @gantt = Redmine::Helpers::Gantt.new
    @gantt.query = @query if @query.valid?
    render :template => 'gantts/show'
  end    
  
  # open a filtered issues list view
  def show_list
    set_query(params[:issue_id])    
    sort_init(@query.sort_criteria.empty? ? [['id', 'desc']] : @query.sort_criteria)
    sort_update(@query.sortable_columns)
    @query.sort_criteria = sort_criteria.to_a
    @issue_count = @query.issue_count
    
    @limit = per_page_option
    @issue_pages = Paginator.new @issue_count, @limit, params['page']
    @offset ||= @issue_pages.offset
    
    @issues = @query.issues
       
    #@issue_count_by_group = @query.issue_count_by_group
    
    render :template => 'issues/index', :layout => !request.xhr?
  end
  
  private
  
  def set_query(issue_id)
    @query=IssueQuery.new(:name => '_')
    @query.add_filter('parent_id','~',[issue_id])
    @query.add_filter('id','=',[issue_id])
    @query.user=User.current        
  end
end
