require "spec_helper"

describe (Person) do
    it("tells you its parents") do
        test_person = Person.create(:name => "Jimmy Person", :living => true)
        test_parent1 = Person.create(:name => "James Person, Esq.", :living => true)
        test_parent2 = Person.create(:name => "Jed Person III", :living => true)
        test_relation1 = Parent.create(:child_id => test_person.id, :parent_id => test_parent1.id)
        test_relation2 = Parent.create(:child_id => test_person.id, :parent_id => test_parent2.id)

        expect(test_person.parents).to eq([test_parent1.id, test_parent2.id])
    end
    it("tells you its children") do
        test_person = Person.create(:name => "Jimmy Person", :living => true)
        test_person2 = Person.create(:name => "Jimmy2 Person", :living => true)
        test_parent = Person.create(:name => "James Person, Esq.", :living => true)
        test_relation = Parent.create(:child_id => test_person.id, :parent_id => test_parent.id)
        test_relation = Parent.create(:child_id => test_person2.id, :parent_id => test_parent.id)
        expect(test_parent.children).to eq([test_person.id, test_person2.id])
    end
    it("tells you its siblings") do
        test_sibling_1 = Person.create(:name => "Jimmy", :living => true)
        test_sibling_2 = Person.create(:name => "Susie", :living => true)
        test_sibling_3 = Person.create(:name => "Billy", :living => true)
        test_parent = Person.create(:name => "Rutherford", :living => true)
        test_relation = Parent.create(:child_id => test_sibling_1.id, :parent_id => test_parent.id)
        test_relation = Parent.create(:child_id => test_sibling_2.id, :parent_id => test_parent.id)
        test_relation = Parent.create(:child_id => test_sibling_3.id, :parent_id => test_parent.id)
        expect(test_sibling_1.siblings).to eq([test_sibling_2.id, test_sibling_3.id])
    end

end
