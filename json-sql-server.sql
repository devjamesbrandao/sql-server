/*Reading JSON data in T-SQL on SQL Server*/
-- Extracting values from JSON string on SQL Server using T-SQL

-- Declare JSON and see it
DECLARE @json NVARCHAR(4000) = N'{    
   "FirstName":"John",    
   "LastName":"Smith",    
   "Age": 32,  
   "DOB": "1986-10-07",  
   "Married": false  
}'  
  
SELECT * FROM OPENJSON(@json)  


-- Format to table
SELECT * FROM OPENJSON(@json) WITH (  
    FirstName NVARCHAR(50) '$.FirstName',  
    LastName NVARCHAR(100) '$.LastName',  
    Age int '$.Age',  
    DOB date '$.DOB',  
    Married bit '$.Married'  
)  


-- Multi-dimensional structure of JSON
DECLARE @json NVARCHAR(4000) = N'{    
   "FirstName":"John",    
   "LastName":"Smith",    
   "Age": 32,  
   "DOB": "1986-10-07",  
   "Married": false,  
   "Residence": {  
        "Country":"Spain",  
        "Region":"Andalusia",  
        "City":"Seville"  
   }  
}'  


-- Acess embeded values
SELECT * FROM OPENJSON(@json) WITH (  
    FirstName NVARCHAR(50) '$.FirstName',  
    LastName NVARCHAR(100) '$.LastName',  
    Age int '$.Age',  
    DOB date '$.DOB',  
    Married bit '$.Married',  
    ResidenceCountry VARCHAR(200) '$.Residence.Country',  
    ResidenceRegion VARCHAR(200) '$.Residence.Region',  
    ResidenceCity VARCHAR(200) '$.Residence.City'  
)  
