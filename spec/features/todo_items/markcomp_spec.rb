require 'spec_helper'

describe "mark todo_items as complete" do 

	let!(:todo_list){TodoList.create(title:"My Todo list", description:"My Description")}
	let!(:todo_item){todo_list.todo_items.create(content:"Milk")}


	it "is successful when marking todo_item as complete " do
		expect(todo_item.completed_at).to be_nil
		visit_todo_list(todo_list)
		within dom_id_for(todo_item) do
			click_link "Mark Complete"
		end
		todo_item.reload
		expect(todo_item.completed_at).to_not be_nil
	end

end