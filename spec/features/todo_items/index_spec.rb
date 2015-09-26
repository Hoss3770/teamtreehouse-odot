require 'spec_helper'

describe "viewing todo_items" do 

	let!(:todo_list){TodoList.create(title:"My Todo list", description:"My Description")}
	it "dispays no items when todo list i empty" do
		visit "/todo_lists"
		within "#todo_list_#{todo_list.id}" do
			click_link "List Items"
		end
		expect(page).to have_content("TodoItems#index")
	end


end