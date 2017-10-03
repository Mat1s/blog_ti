# README  
#1  
>select min(u1.id), max(u2.id), u1.group_id  
>from users u1 inner join users u2  
>where u2.group_id = u1.group_id  
>and (u2.id -u1.id) = 1  
>group by u1.group_id  
  
#2  
>select count(id), group_id  
>from users  
>group by group_id  
  
#3  
>select min(id), group_id  
>from users  
>group by group_id  
  


