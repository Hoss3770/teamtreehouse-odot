require 'spec_helper'

describe "creating todo lists" do 

	def create_todo_list(options={})
		options[:title] ||= "My Todo List"
		options[:desc]  ||= "My Description"

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title" , with: options[:title]
		fill_in "Description", with: options[:desc]

		click_button "Create Todo list"
	end
	
	it "redirects to todolists index page on success" do

		create_todo_list

		expect(page).to have_content("My Todo List")

	end

	it "displays an error when the todo list has no title" do
		expect(TodoList.count).to eq(0)

		create_todo_list({title:""})

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("My Description")

	end
	it "displays an error when the todo list has a title with less than 3 chars" do
		expect(TodoList.count).to eq(0)

		create_todo_list({title:"hi"})

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("My Description")

	end

	it "displays an error when the todo list has no Description" do
		expect(TodoList.count).to eq(0)

		create_todo_list({desc:""})

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("My Todo List")

	end

	it "displays an error when the todo list has a Description with less than 5 chars" do
		expect(TodoList.count).to eq(0)

		create_todo_list({desc:"desc"})

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("My Todo List")

	end
end