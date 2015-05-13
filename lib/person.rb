class Person < ActiveRecord::Base
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
        return_array = []
        parents = []
        all_relations.each do |relation|
            if relation.child_id == self.id
                parent = parent.id
            end
        end
        all_relations.each do |relation|
            if relation.parent_id = parent.id
              if relation.child_id != self.id
                return_array.push(relation.child_id)
              end
            end
        return_array
        end
    end
end
