s = LOAD '/user/training/student.txt' USING PigStorage(',') as (id:int,name:chararray);

1,balaji
2,Pradeep
3,adarsh

STORE s INTO'user/traininr/training/pig_Output/ ' USING PigStorage (',');
Dump s;
describe s;
explain s;
illustrate s;
group = GROUP s BY name;
group_multiple = GROUP s by (name, id);
Dump group_multiple;
group_all = GROUP s All;
CO-group operator
stud = LOAD '/user/training/student.txt' USING PigStorage(',')as (id:int, firstname:chararray, lastname:chararray, age:int, phone:chararray, city:chararray);
emp = LOAD '/user/training/employee.txt' USING PigStorage(',')as (id:int, name:chararray, age:int, city:chararray);
join operator--
1,Balaji,32,Chennai,2000.00  
3,kaushik,23,Kota,2000.00 
4,Chaitali,25,Mumbai,6500.00 
5,Hardik,27,Bhopal,8500.00 
6,Komal,22,MP,4500.00 
7,Muffy,24,Indore,10000.00



102,2009-10-08 00:00:00,3,3000 
100,2009-10-08 00:00:00,3,1500 
101,2009-11-20 00:00:00,2,1560 
103,2008-05-20 00:00:00,4,2060


customers = LOAD 'hdfs://localhost:9000/pig_data/customers.txt' USING PigStorage(',')as (id:int, name:chararray, age:int, address:chararray, salary:int); 
orders = LOAD 'hdfs://localhost:9000/pig_data/orders.txt' USING PigStorage(',')as (oid:int, date:chararray, customer_id:int, amount:int);
Inner Join
grunt> coustomer_orders = JOIN customers BY id, orders BY customer_id;

Self join

customers1 = LOAD 'hdfs://localhost:9000/pig_data/customers.txt' USING PigStorage(',')as (id:int, name:chararray, age:int, address:chararray, salary:int); 
customers2 = LOAD 'hdfs://localhost:9000/pig_data/customers.txt' USING PigStorage(',')as (id:int, name:chararray, age:int, address:chararray, salary:int);
customers3 = JOIN customers1 BY id, customers2 BY id;
outer_left = JOIN customers BY id LEFT OUTER, orders BY customer_id;
outer_right = JOIN customers BY id RIGHT, orders BY customer_id;
outer_full = JOIN customers BY id FULL OUTER, orders BY customer_id;


employee.txt
001,Rajiv,Reddy,21,programmer,003 
002,siddarth,Battacharya,22,programmer,
003 003,Rajesh,Khanna,22,programmer,003 
004,Preethi,Agarwal,21,programmer,003 
005,Trupthi,Mohanthy,23,programmer,003 
006,Archana,Mishra,23,programmer,003 
007,Komal,Nayak,24,teamlead,002 
008,Bharathi,Nambiayar,24,manager,001

employee_contact.txt
001,9848022337,Rajiv@gmail.com,Hyderabad,003 
002,9848022338,siddarth@gmail.com,Kolkata,003 
003,9848022339,Rajesh@gmail.com,Delhi,003 
004,9848022330,Preethi@gmail.com,Pune,003 
005,9848022336,Trupthi@gmail.com,Bhuwaneshwar,
003 006,9848022335,Archana@gmail.com,Chennai,003 
007,9848022334,Komal@gmail.com,trivendram,002
008,9848022333,Bharathi@gmail.com,Chennai,001



employee = LOAD '/user/training/employee.txt' USING PigStorage(',')as (id:int, firstname:chararray, lastname:chararray, age:int, designation:chararray, jobid:int); 
employee_contact = LOAD '/user/training/employee_contact.txt' USING PigStorage(',')as (id:int, phone:chararray, email:chararray, city:chararray, jobid:int);
k = CROSS employeee, employeee_contact;

1,Ramesh,32,Ahmedabad,2000.00 
2,Khilan,25,Delhi,1500.00 
3,kaushik,23,Kota,2000.00 
4,Chaitali,25,Mumbai,6500.00 
5,Hardik,27,Bhopal,8500.00 
6,Komal,22,MP,4500.00 
7,Muffy,24,Indore,10000.00

102,2009-10-08 00:00:00,3,3000 
100,2009-10-08 00:00:00,3,1500 
101,2009-11-20 00:00:00,2,1560 
103,2008-05-20 00:00:00,4,2060


customers = LOAD 'user/training/pig_Output/customers.txt' USING PigStorage(',')as (id:int, name:chararray, age:int, address:chararray, salary:int); orders = LOAD 'hdfs://localhost:9000/pig_data/orders.txt' USING PigStorage(',')as (oid:int, date:chararray, customer_id:int, amount:int);
cross_data = CROSS customers, orders;
filter_data = FILTER S BY city == 'Balaji';
order_by_data = ORDER S BY age DESC;
limit_data = LIMIT S 4;