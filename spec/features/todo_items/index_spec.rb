require 'spec_helper'

describe "viewing todo_items" do 

	let!(:todo_list){TodoList.create(title:"My Todo list", description:"My Description")}


	it "displays the title of the todolist" do
		 visit_todo_list(todo_list) 
		within("h1") {expect(page).to have_content(todo_list.title)}
	end

	it "dispays no items when todo list i empty" do
		visit_todo_list(todo_list) 
		expect(page.all("ul.todo_items li").size).to eq(0)
	end

	it "displays items when the todolist has items" do
		todo_list.todo_items.create(content: "Milk")
		todo_list.todo_items.create(content: "Eggs")
		visit_todo_list(todo_list) 
		expect(page.all("ul.todo_items li").size).to eq(2)
		
		within("ul.todo_items") do
			expect(page).to have_content("Milk")
			expect(page).to have_content("Eggs")
		end

	end

end
