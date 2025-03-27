-- DROP TABLE IF EXISTS Software;
-- DROP TABLE IF EXISTS Computer;
-- DROP TABLE IF EXISTS User;
-- DROP TABLE IF EXISTS UserComputer;
-- DROP TABLE IF EXISTS ComputerSoftware;
-- DROP TABLE IF EXISTS InstallationRequest;
-- DROP TABLE IF EXISTS License;




-- INSERT INTO User(UserId, Name, IsAdmin, Type)
-- VALUES
--     (1,'Jonny Comes', 0, 'Faculty'),
--     (2,'Keith Brower', 1, 'Staff'),
--     (3,'Aayush Shrestha', 0, 'Faculty');
    
    
-- INSERT INTO Computer(ComputerId, Location, OperatingSystem)
-- VALUES
--     (100,'Boone 102', 'XP'),
--     (101, 'CML 101', 'WIN10'),
--     (102, 'COV 203', 'MAC');
    
    
-- INSERT INTO UserComputer(ComputerId, UserId)
-- VALUES
--     (100, 1),
--     (102, 2),
--     (100, 2),
--     (101, 3);
    
    
-- INSERT INTO Software(SoftwareId, Name)
-- VALUES
--     (400, 'Canvas'),
--     (401, 'R-Studio'),
--     (402, 'Microsoft'),
--     (403, 'CoCalc'),
--     (404, 'Notepad++'),
--     (405, 'LurPRO'),
--     (406, 'FIFA'),
--     (407, 'Adobe');

    
-- INSERT INTO ComputerSoftware(SoftwareId, ComputerId, InstallationType, InstalledDate, UninstalledDate)
-- VALUES
--     (401, 102, 'Online', '2014-10-13', NULL),
--     (402, 102, 'Flash Drive', '2011-12-30', NULL),
--     (400, 100, 'CD', '2010-10-12', NULL),
--     (403, 101, 'Online', '2018-04-03', '2024-01-01'),
--     (404, 100, 'CD', '2016-08-14', NULL),
--     (401, 101, 'Online', '2024-04-03', '2025-04-03');
    

    
-- INSERT INTO License(LicenseId, PricingUnit, SoftwareVendor, MaxInstallationCount, IsActive, StartDate, EndDate, Price, SoftwareId)
-- VALUES
--     (800, '100 per year', 'Canvas Inc.', 100, 1, '2010-01-01','2024-12-30', 10000, 400),
--     (801, '100 per year', 'R Corp', 100, 1, '2016-01-01','2024-12-30', 1500, 401),
--     (802, '5 years', 'MSFT', 1000, 1, '2010-01-01','2025-12-30', 4000, 402),
--     (803, 'per copy', 'CoCalc Co', 1, 0, '2018-01-01','2024-12-30', 200, 403),
--     (804, 'free', 'MSFT', 10000, 1, '2010-01-01','2030-12-30', 0, 404),
--     (805, '5 years', 'LVR', 100, 1, '2018-01-01','2025-12-30', 2000, 405),
--     (806, '1 year', 'Adobe Inc.', 20, 0, '2023-01-01','2024-12-30', 1400, 407),
--     (807, '1 year', 'Adobe Inc.', 20, 1, '2024-01-01','2025-12-30', 1500, 407);


-- INSERT INTO InstallationRequest(RequestId, RequestedBy, Urgency, Status, StatusDescription, SoftwareId, RequestedDate)
-- VALUES
--     (1000, 1, 5,'Approved','Complete', 403, 2021-03-25),
--     (1001, 2, 3,'Pending','Pending', 405, 2024-05-01),
--     (1002, 2, 1,'Denied','Gaming apps are not allowed to install', 406, 2024-05-02),
--     (1003, 2, 4,'Pending','Pending', 403, 2024-05-01);



    
    
    