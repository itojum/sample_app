require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'

    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path

    
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
  end


  test "layout links when not logged in" do
    get root_path
    assert_template 'static_pages/home'

    assert_select "a[href=?]", login_path
    assert_select "a[id='account']", count: 0

    get login_path
    assert_select "title", full_title("Log in")
  end

  test "layout links when logged in" do
    user = users(:michael)
    log_in_as(user)

    get root_path
    assert_template 'static_pages/home'

    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[id='account']"
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path(user)
    assert_select "a[href=?]", edit_user_path(user)
    assert_select "a[href=?]", logout_path

    get users_path
    assert_select "title", full_title("All users")
    get user_path(user)
    assert_select "title", full_title(user.name)
    get edit_user_path(user)
    assert_select "title", full_title("Edit user")
    delete logout_path
    assert_not is_logged_in?
  end
end
