#crumb :root do
#	link "Home", root_path
#end

#crumb :home do
#  link "Home", home_path
#end

#crumb :help do
#	link "Help", help_path
#end

#crumb :about do
#	link "About", about_path
#end

#crumb :contact do
#	link "Contact", contact_path
#end

#crumb :admt do
#	link "Admin tools", admintools_path
#end

#crumb :mainmenuindex do
#	link "Main menu list", genmenus_path
#	parent :admt
#end

#crumb :submenu do
#	link "Subs", submenu_path
#end

#crumb :content do
#	link "Content", sm_content_path
#	parent :submenu
#end


crumb :submenus do |submenu|
   link submenu.sm_contents, submenu_path(submenu)
   parent :submenus
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