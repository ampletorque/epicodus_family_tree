class Person < ActiveRecord::Base
    #has_many :poppas, :foreign_key => "parent_id", :class_name => "Person", :through => :parents
    # has_many :parent_persons, :through => :parents, :source => :person
    #has_many :children, :foreign_key => "child_id", :class_name => "Person", :through => :parents
    # has_many :child_persons, :through => :children, :source => :person
    has_many :parents
    has_many :people, through: :parents
    def parents
        parents = Parent.all
        return_array = []
        parents.each do |parent|
            if parent.child_id == self.id
                return_array.push(parent.parent_id)
            end
        end
        return_array
    end

    def children
        children = Parent.all
        return_array = []
        children.each do |child|
            if child.parent_id == self.id
                return_array.push(child.child_id)
            end
        end
        return_array
    end
    def siblings
        all_relations = Parent.all
        parent = 0
        all_relations.each do |relation|
            if relation.child_id == self.id
                parent = relation.parent_id
            end
        end
        return_array = []
        all_relations.each do |relation|
            if relation.parent_id == parent
              if relation.child_id != self.id
                return_array.push(relation.child_id)
             end
            end
        end
        return_array
    end
end
