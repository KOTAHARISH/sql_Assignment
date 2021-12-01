--> Table 1:
CREATE TABLE salespeople(Snum INT PRIMARY KEY, Sname VARCHAR(20) UNIQUE, City VARCHAR(20), Comm INT );


--> inserting data into salespeople table 1

INSERT INTO salespeople VALUES(1001,'Peel','London',12);

INSERT INTO salespeople VALUES(1002,'Serres','Sanjose',13);

INSERT INTO salespeople VALUES(1004,'Motika','London',11);

INSERT INTO salespeople VALUES(1007,' Rifkin ','Barcelona',15);

INSERT INTO salespeople VALUES(1003,'Axelrod','Newyork',10);



--> Table 2:

CREATE TABLE customers (Cnum INT PRIMARY KEY, Cname VARCHAR(20) NOT NULL, City VARCHAR(20), Snum INT , FOREIGN KEY(Snum) REFERENCES salespeople(Snum) ON DELETE SET NULL );


--> Inserting data into customers table 2

INSERT INTO customers VALUES(2001,'Hoffman','London',1001);

INSERT INTO customers VALUES(2002,'Giovanni','Rome',1003);

INSERT INTo customers VALUES(2003,'Liu','Sanjose',1002);

INSERT INTO customers VALUES(2004,'Grass','Berlin',1002);

INSERT INTO customers VALUES(2006,'Clemens','London',1001);

INSERT INTO customers VALUES(2008,'Cisneros','Sanjose',1007);

INSERT INTO customers VALUES(2007,'Pereira','Rome',1004);



--> table 3:

CREATE TABLE Orders (Onum INT PRIMARY KEY,Amt DECIMAL(15,5), Odate DATE,Cnum INT,Snum INT , FOREIGN KEY(Cnum) REFERENCES customers(Cnum) ON DELETE SET NULL,FOREIGN KEY(Snum) REFERENCES salespeople(Snum) ON DELETE SET NULL );


--> Inserting data into customers table 3



INSERT INTO Orders VALUES(3001 ,18.69,'1990-10-03',2008,1007);

INSERT INTO Orders VALUES(3003 ,767.19,'1990-10-03',2001,1001);

INSERT INTO Orders VALUES(3002 ,1900.10,'1990-10-03',2007,1004);

INSERT INTO Orders VALUES(3005 ,5160.45,'1990-10-03',2003,1002);

INSERT INTO Orders VALUES(3006 ,1098.16,'1990-10-03',2008,1007);

INSERT INTO Orders VALUES(3009 ,1713.23,'1990-10-04',2002,1003);

INSERT INTO Orders VALUES(3007 ,75.75,'1990-10-04',2004,1002);

INSERT INTO Orders VALUES(3008 ,4273.00,'1990-10-05',2006,1001);

INSERT INTO Orders VALUES(3010 ,1309.95,'1990-10-06',2004,1002);

INSERT INTO Orders VALUES(3011 ,9891.88,'1990-10-06',2006,1001);




________________________________________________________________________________________________________________________________________________


--> ASSIGNMENT QUESTIONS


 --> 1.Count the number of Salesperson whose name begin with ‘a’/’A’?

 SELECT COUNT(Sname) FROM salespeople WHERE Sname LIKE 'a%' OR 'A% ' ;
 
	+--------------+
	| COUNT(Sname) |
	+--------------+
	|            1 |		
        +--------------+

________________________________________________________________________________________________________________________________________________

-->2.Display all the Salesperson whose all orders worth is more than Rs. 2000 ?

   SELECT Sname FROM salespeople WHERE snum IN(SELECT Snum FROM Orders WHERE AMT > 2000);

     	+--------+
        | Sname  |
	+--------+
	| Peel   |
	| Serres |
	+--------+
	
_______________________________________________________________________________________________________________________________________________

--> 3.Count the number of Salesperson belonging to Newyork ?
 
   SELECT COUNT(Sname) FROM salespeople WHERE City = 'Newyork';

	+--------------+
	| COUNT(Sname) |
	+--------------+
	|__________ 1 _+

_______________________________________________________________________________________________________________________________________________


--->4.Display the number of Salespeople belonging to London and belonging to Paris.?

  
        +--------------+
	| COUNT(Sname) |
	+--------------+
	|            0 |		
        +--------------+
     
       
_______________________________________________________________________________________________________________________________________________


--->5.Display the number of orders taken by each Salesperson and their date of orders.?
     

    SELECT Snum , COUNT(Onum),Odate FROM Orders GROUP BY Snum;

      
            +------+-------------+------------+
 	    | Snum | COUNT(Onum) | Odate      |
    	    +------+-------------+------------+
            | 1001 |           3 | 1990-10-03 |
	    | 1002 |           3 | 1990-10-03 |
	    | 1003 |           1 | 1990-10-04 |
	    | 1004 |           1 | 1990-10-03 |
	    | 1007 |           2 | 1990-10-03 |
            +------+-------------+------------+

