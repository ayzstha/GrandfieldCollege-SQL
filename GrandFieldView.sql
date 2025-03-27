
DROP VIEW IF EXISTS ActiveSoftware;
DROP VIEW IF EXISTS SoftwareReqDenied;
DROP VIEW IF EXISTS SoftwareReqApproved;
DROP VIEW IF EXISTS SoftwareReqPending;

--ActiveSoftware (JOIN Example)
CREATE VIEW ActiveSoftware AS
SELECT
    s.Name AS "Name"
FROM Software AS s
JOIN License AS l ON s.SoftwareId = l.SoftwareId
ORDER BY "Name";
    
-- SoftwareReqDenied
CREATE VIEW SoftwareReqDenied AS
SELECT
    u.UserId AS "User ID",
    u.Name AS "User Name",
    ir.Status AS "Status",
    ir.StatusDescription AS "Status Description",
    s.Name AS "Software"
FROM User AS u
    JOIN InstallationRequest AS ir ON u.UserId = ir.RequestedBy
    JOIN Software AS s ON ir.SoftwareId = s.SoftwareId
    
WHERE "Status"  = "Denied"
ORDER BY u.UserId;

-- SoftwareReqApproved
CREATE VIEW SoftwareReqApproved AS
SELECT
    u.UserId AS "User ID",
    u.Name AS "User Name",
    ir.Status AS "Status",
    ir.StatusDescription AS "Status Description",
    s.Name AS "Software"
FROM User AS u
    JOIN InstallationRequest AS ir ON u.UserId = ir.RequestedBy
    JOIN Software AS s ON ir.SoftwareId = s.SoftwareId
    
WHERE "Status"  = "Complete"
ORDER BY u.UserId;


-- SoftwareReqPending
CREATE VIEW SoftwareReqPending AS
SELECT
    u.UserId AS "User ID",
    u.Name AS "User Name",
    ir.Status AS "Status",
    ir.StatusDescription AS "Status Description",
    s.Name AS "Software"
FROM User AS u
    JOIN InstallationRequest AS ir ON u.UserId = ir.RequestedBy
    JOIN Software AS s ON ir.SoftwareId = s.SoftwareId
    
WHERE "Status"  = "Pending"
ORDER BY u.UserId;

-- UserComputerAndSoftware
DROP VIEW IF EXISTS UserComputerAndSoftware;

CREATE VIEW UserComputerAndSoftware AS
select
    u.Name,
    u.Type AS "User Is",
    c.Location AS "Computer Location",
    s.Name AS "Software"
FROM User AS u
    JOIN UserComputer AS uc on u.UserId = uc.UserId
    JOIN Computer AS c on uc.ComputerId = c.ComputerId
    JOIN ComputerSoftware AS cs on cs.ComputerId = c.ComputerId
    JOIN Software AS s on s.SoftwareId = cs.SoftwareId
ORDER BY u.Name ASC, c.Location ASC, s.Name ASC;
    
 


-- ComputerSoftwareCount
DROP VIEW IF EXISTS ComputerSoftwareCount;

CREATE VIEW ComputerSoftwareCount AS
SELECT
    c.Location as "Computer Location",
    COUNT(*) AS "Software Count"
FROM Computer as c
    JOIN ComputerSoftware AS cs on cs.ComputerId = c.ComputerId
GROUP BY c.location
ORDER BY c.Location; 
    
-- SoftwareAcceptance
DROP VIEW IF EXISTS SoftwareAcceptance;
CREATE VIEW SoftwareAcceptance AS
SELECT
    u.UserId AS "User ID",
    u.Name AS "User Name",
    ir.Status AS "Status",
    ir.StatusDescription AS "Status Description",
    s.Name AS "Software"
FROM User AS u
    JOIN InstallationRequest AS ir ON u.UserId = ir.RequestedBy
    JOIN Software AS s ON ir.SoftwareId = s.SoftwareId
ORDER BY u.UserId;


--ComputerSoftwareRecord
DROP VIEW IF EXISTS ComputerSoftwareRecord;

CREATE VIEW ComputerSoftwareRecord AS
SELECT
    cs.ComputerId AS "Computer ID",
    c.location AS "Computer Location",
    s.Name AS "Software",
    l.EndDate AS "Expiry Date"        
FROM ComputerSoftware AS cs
    JOIN Computer AS c ON cs.ComputerId = c.ComputerId
    JOIN Software AS s ON cs.SoftwareId = s.SoftwareId
    JOIN License AS l ON s.SoftwareId = l.SoftwareId  
;


--LessThanTen (SUB QUERY Example)
DROP VIEW IF EXISTS MaxCountLessThanTen;
CREATE VIEW MaxCountLessThanTen AS

SELECT Name FROM Software 
WHERE SoftwareId IN
(SELECT SoftwareId FROM License WHERE MaxInstallationCount < 10); 

SELECT * FROM ActiveSoftware;
SELECT * FROM SoftwareReqDenied;
SELECT * FROM SoftwareReqPending;
SELECT * FROM SoftwareReqApproved;
SELECT * FROM UserComputerAndSoftware;
SELECT * FROM ComputerSoftwareCount;
SELECT * FROM SoftwareAcceptance;
SELECT * FROM ComputerSoftwareRecord;
SELECT * FROM LessThanTen;






