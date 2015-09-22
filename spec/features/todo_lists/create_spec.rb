require 'spec_helper'

describe "creating todo lists" do 
	
	it "redirects to todolists index page on success" do

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title" , with: "My Todo List"
		fill_in "Description", with: "My Description"

		click_button "Create Todo list"
		expect(page).to have_content("My Todo List")

	end

	it "displays an error when the todo list has no title" do
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title" , with: ""
		fill_in "Description", with: "My Description"

		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("My Description")

	end
	it "displays an error when the todo list has a title with less than 3 chars" do
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title" , with: "hi"
		fill_in "Description", with: "My Description"

		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("My Description")

	end
end