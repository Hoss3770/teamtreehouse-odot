require 'spec_helper'

describe "editing todo list" do 
	let!(:todo_list) {TodoList.create(title:"My Todo List",description:"My Description")}

	def update_todo_list(options={})
		
		visit "/todo_lists"

		options[:title] ||= "My Todo List"
		options[:desc]  ||= "My Description" 

		todo_list = options[:todo_list]

		within "#todo_list_#{todo_list.id}" do
			click_link "Edit"
		end




		fill_in "Title",with: options[:title]
		fill_in "Description", with: options[:description]

		click_button "Update Todo list"

		

	end
	
	it "updates todo list successfuly with correct info" do

		
		update_todo_list({todo_list:todo_list, title:"My Edit Todo", description:"My Edit Desc"})
		todo_list.reload
		expect(page).to have_content("Todo list was successfully updated.")
		expect(todo_list.title).to eq("My Edit Todo")
		expect(todo_list.description).to eq("My Edit Desc")
	end

	it "updates todo list successfuly with no title " do

		
		update_todo_list({todo_list:todo_list, title:"", description:"My Edit Desc"})
		todo_list.reload
		expect(page).to have_content("error")
		
	end

	it "updates todo list successfuly with no desc " do

		
		update_todo_list({todo_list:todo_list, title:"My Edit Todo", description:""})
		todo_list.reload
		expect(page).to have_content("error")
		
	end

	it "updates todo list successfuly with title less than 3 chars  " do

		
		update_todo_list({todo_list:todo_list, title:"My", description:"My Edit Desc"})
		todo_list.reload
		expect(page).to have_content("error")
		
	end


	it "updates todo list successfuly with desc less than 5 chars  " do

		
		update_todo_list({todo_list:todo_list, title:"My Edit Todo", description:"MDes"})
		todo_list.reload
		expect(page).to have_content("error")
		
	end





	
end