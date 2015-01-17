class DropCaseStudies < ActiveRecord::Migration
  def change
  	drop_table :case_studies
  end
end
