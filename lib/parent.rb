class Parent < ActiveRecord::Base
    belongs_to :poppa, :foreign_key => "parent_id", :class_name => "Person"
    belongs_to :child, :foreign_key => "child_id", :class_name => "Person"
end
