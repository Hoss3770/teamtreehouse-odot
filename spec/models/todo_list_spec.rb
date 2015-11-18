require 'spec_helper'

describe TodoList do
 it{should have_many(:todo_items)}

 describe "#has_complete_items?" do
 	let!(:todo_list){TodoList.create(title:"My Todo list", description:"My Description")}

 	it "returns true with completed todo_list items" do
 		todo_list.todo_items.create(content:"Eggs",completed_at: 1.minutes.ago)
 		expect(todo_list.has_completed_items?).to be_true
 	end

 	it "returns false with no completed todo_list items" do
 		todo_list.todo_items.create(content:"Eggs")
 		expect(todo_list.has_completed_items?).to be_false
 	end

 end

 describe "#has_incomplete_items?" do
 	let!(:todo_list){TodoList.create(title:"My Todo list", description:"My Description")}

 	it "returns true with incompleted todo_list items" do
 		todo_list.todo_items.create(content:"Eggs")
 		expect(todo_list.has_incompleted_items?).to be_true
 	end

 	it "returns false with no incompleted todo_list items" do
 		todo_list.todo_items.create(content:"Eggs",completed_at: 1.minutes.ago)
 		expect(todo_list.has_incompleted_items?).to be_false
 	end


 	
 end

end
