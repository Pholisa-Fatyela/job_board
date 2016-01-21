class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :title
    	t.text :description
    	t.text :requirements
    	t.string :job_level
    	t.string :status
    	t.date :start_date
    	t.text :contact
    	
    	t.timestamps null: false
    end
  end
end
