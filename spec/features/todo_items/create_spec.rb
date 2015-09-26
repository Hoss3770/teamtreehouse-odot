require 'spec_helper'

describe "creating todo_items" do 

	let!(:todo_list){TodoList.create(title:"My Todo list", description:"My Description")}

	def  visit_todo_list(list) 

		visit "/todo_lists"

		within "#todo_list_#{list.id}" do
			click_link "List Items"
		end
	end


	it "is successful with valid content" do
		visit_todo_list(todo_list) 
		click_link("New Todo Item")
		fill_in "Content", with: "Milk"
		click_button "Save"

		expect(page).to have_content("Added todo list item.")
		within("ul.todo_items") do
			expect(page).to have_content("Milk")
		end
	end

end