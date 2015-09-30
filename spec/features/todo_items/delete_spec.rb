require 'spec_helper'

describe "editing todo_items" do 

	let!(:todo_list){TodoList.create(title:"My Todo list", description:"My Description")}
	let!(:todo_item){todo_list.todo_items.create(content:"Milk")}
	

	it"deltes the todo_item  when clicking destroy" do
		visit_todo_list(todo_list)
		within"#todo_item_#{todo_list.id}" do
			click_link "Destroy"
		end
		expect(page).to have_content("Todo list item was deleted")
		expect(page).to_not have_content("Milk")
		expect(TodoItem.count).to eq(0)
	end
end