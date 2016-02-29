# Hooks for the Redmine-Plugin gantt_on_issue_tree
# 
# Author:: Thomas Koch

class GanttOnIssueHook < Redmine::Hook::ViewListener
  
  # Creates hook for redmine_issue_report at bottom of a project issue view
  def view_issues_show_details_bottom(context={})
    if !context[:issue].nil?
      ret_str = ''
      ret_str << '<p class="other-formats">' << l(:label_subtask_plural) << ": "
      ret_str << content_tag('span', link_to(l(:label_goi_hook_show),
                                            { :controller => 'gantt_on_issue_tree', :action => 'show_gant', :issue_id => context[:issue] },
                                            { :rel => 'nofollow', :title => l(:label_link_goi_tooltip) }))
      ret_str << content_tag('span', link_to(l(:label_goi_hook_list),
                                            { :controller => 'gantt_on_issue_tree', :action => 'show_list', :issue_id => context[:issue] },
                                            { :rel => 'nofollow', :title => l(:label_link_goi_tooltip) }))                                            
      ret_str << '</p>'
      return ret_str.html_safe
    end
  end
end