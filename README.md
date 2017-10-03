# README
#1
select min(u1.id), max(u2.id), u1.group_id 
from users u1 inner join users u2
where u2.group_id = u1.group_id
and (u2.id -u1.id) = 1
group by u1.group_id

#2
select count(id), group_id 
from users
group by group_id

#3
select min(id), group_id 
from users
group by group_id





describe Post do
it "locks optimistically" do
p1 = Post.create
p2 = Post.find(p1.id)

p1.rate = 250
p2.rate = 175

expect(p1.save).to be_true
expect { p2.save }.to raise_error(ActiveRecord::StaleObjectError)
end

rescue ActiveRecord::StaleObjectError
