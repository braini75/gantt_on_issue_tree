require File.expand_path('../../test_helper', __FILE__)

class GanttOnIssueTreeControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_generate
    get :generate, :issue_id => Issue.first.id
    assert_response :success
    assert_template 'generate'
  end
  
  def test_truth
    assert true
  end
end
