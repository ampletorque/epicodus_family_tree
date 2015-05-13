class Parent < ActiveRecord::Base
    #belongs_to :poppa, :foreign_key => "parent_id", :class_name => "Parent"
    #belongs_to :child, :foreign_key => "child_id", :class_name => "Parent"
    belongs_to :people
end
