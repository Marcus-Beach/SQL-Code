--!!!! DO NOT USE ON WORKING DB !!!!
--This is intended only to verify the SPs will work as intended.  Only use if you don't care about lost data.
--TEST SCRIPTS
--Quick Test
--Users
--Things
--Plans
--Tags
--Friends
--Settings
--!!!! DO NOT USE ON WORKING DB !!!!
USE PicturePlanner

--Quick Test: This creates a basic setup from scratch just to make sure the SPs work
--Wipe the tables
TRUNCATE TABLE Transactions
TRUNCATE TABLE Users
TRUNCATE TABLE Friends
TRUNCATE TABLE Things
TRUNCATE TABLE Plans
TRUNCATE TABLE Tags
TRUNCATE TABLE Settings
--Make and change a user
DECLARE @TRANSID AS INT
EXECUTE CreateNewUserSP 'TestUser1', 'test1@testing.com', 'testpass1'
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateUserNameSP 1, 'Updated Test 1', NULL
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateUserEmailSP 1, 'updatedtest1@testing.com', NULL
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateUserStatusSP 1, 0, 3
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
DECLARE @CURDATE AS DATETIME
SET @CURDATE = GETDATE()
EXECUTE UpdateUserExpiryDateSP 1, @CURDATE, 3
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateUserPasswordSP 1, 'updatedtestpass1', NULL
EXECUTE GetUserSP 1
EXECUTE GetUserByEmailSP 'updatedtest1@testing.com'
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc

--Make and change a second user
EXECUTE CreateNewUserSP 'TestUser2', 'test2@testing.com', 'testpass2'
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateUserNameSP 2, 'Updated Test 2', NULL
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateUserEmailSP 2, 'updatedtest2@testing.com', NULL
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateUserStatusSP 2, 0, 7
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
DECLARE @CURDATE AS DATETIME
SET @CURDATE = GETDATE()
EXECUTE UpdateUserExpiryDateSP 2, @CURDATE, 7
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateUserPasswordSP 2, 'updatedtestpass2', NULL
EXECUTE GetUserSP 2
EXECUTE GetUserByEmailSP 'updatedtest2@testing.com'
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc

--Make the users friends
EXECUTE AddFriendSP 2, 1
SELECT * FROM FRIENDS
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE ConfirmFriendSP 2, 1
SELECT * FROM FRIENDS
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE GetFriendsSP 1

--Make a Thing and make changes
EXECUTE CreateThingSP 'Thing 1', 1
SELECT * FROM Things
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateThingNameSP 1, 1, 'Updated Thing 1', 11
SELECT * FROM Things
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateThingLocalImageSP 1, 1, '/LOCAL_IMAGE_PATH', 11
SELECT * FROM Things
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateThingDimensionsSP 1, 1, 1, 10, 12, 11
SELECT * FROM Things
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateThingSharedIDSP 1, 1, 1, NULL
SELECT * FROM Things
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateThingSharedImageSP 1, 1, '/SHARED_IMAGE_PATH', 12
SELECT * FROM Things
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateThingPublicIDSP 1, 1, 1, NULL
SELECT * FROM Things
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateThingPublicImageSP 1, 1, '/PUBLIC_IMAGE_PATH', 13
SELECT * FROM Things
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE GetLocalThingSP 1

--Make a Plan
EXECUTE CreatePlanSP 1
SELECT * FROM Plans
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateLocalPlanFloorSP 1, 1, 1, NULL
SELECT * FROM Things
SELECT * FROM Plans
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdatePlanNameSP 1, 1, 'Test Plan 1', NULL
SELECT * FROM Plans
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE AddThingToPlanSP 1, 1, 1
SELECT * FROM Things
SELECT * FROM Plans
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateThingPositionSP 1, 3, 1, 1, 90, NULL
SELECT * FROM Things
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE GetLocalPlanSP 1
EXECUTE GetPlansByOwnerSP 1
EXECUTE GetThingsByPlanSP 1

--Make a Tag
EXECUTE CreateTagSP 'Test Tag 1', 1
SELECT * FROM Tags
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateTagNameSP 1, 1, 'Updated Test Tag 1', 19
SELECT * FROM Tags
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE AddThingTagSP 1, 1, 1
SELECT * FROM Tags
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE GetTagSP 1
EXECUTE GetTagsByUserSP 1
EXECUTE GetTagsByThingSP 1
EXECUTE GetThingsByTagSP 1

--Make a setting
EXECUTE CreateSettingSP 1, 2, 1
SELECT * FROM Settings
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE UpdateSettingSP 1, 1, 1, 0, 0
SELECT * FROM Settings
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
EXECUTE GetSettingSP 1
EXECUTE GetSettingsByFriendSP 2
EXECUTE GetSettingsByFriendAndTagSP 2, 1
EXECUTE GetTagsByFriendSP 1, 2
EXECUTE GetFriendsByTagSP 1, 1

--Remove a tag from a thing
EXECUTE GetTagsByThingSP 1
EXECUTE GetThingsByTagSP 1
EXECUTE RemoveThingTagSP 1, 1, 1
EXECUTE GetTagsByThingSP 1
EXECUTE GetThingsByTagSP 1

--Delete a thing
SELECT * FROM Things
EXECUTE DeleteThingSP 3
SELECT * FROM Things

--Delete a Plan
SELECT * FROM Things
SELECT * FROM Plans
EXECUTE DeletePlanSP 1, 1, NULL
SELECT * FROM Things
SELECT * FROM Plans

--Delete a Setting
SELECT * FROM Settings
EXECUTE DeleteSettingSP 1
SELECT * FROM Settings

--Delete a friend
SELECT * FROM Friends
EXECUTE DeleteFriendSP 1, 2, NULL
SELECT * FROM Friends

--Delete a User
SELECT * FROM Users
EXECUTE DeleteUserSP 2, NULL
SELECT * FROM Users
SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc


----Users
--TRUNCATE TABLE Transactions
--TRUNCATE TABLE Users
--DECLARE @TRANSID AS INT
--EXECUTE CreateNewUserSP 'TestUser1', 'test1@testing.com', 'testpass1'
--SELECT * FROM Users
--SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
--EXECUTE UpdateUserNameSP 1, 'Updated Test 1', NULL
--SELECT * FROM Users
--SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
--EXECUTE UpdateUserEmailSP 1, 'updatedtest1@testing.com', NULL
--SELECT * FROM Users
--SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
--EXECUTE UpdateUserStatusSP 1, 0, 3
--SELECT * FROM Users
--SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
--DECLARE @CURDATE AS DATETIME
--SET @CURDATE = GETDATE()
--EXECUTE UpdateUserExpiryDateSP 1, @CURDATE, 3
--SELECT * FROM Users
--SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc
--EXECUTE UpdateUserPasswordSP 1, 'updatedtestpass1', NULL
--EXECUTE GetUserSP 1
--EXECUTE GetUserByEmailSP 'updatedtest1@testing.com'
--EXECUTE DeleteUserSP 1, NULL
--SELECT * FROM Users
--SELECT TOP 5 * FROM Transactions ORDER BY TransactionID desc

----Friends
--EXECUTE AddFriendSP
--EXECUTE ConfirmFriendSP
--EXECUTE GetFriendsSP
--EXECUTE GetFriendsByTagSP
--EXECUTE DeleteFriendSP

----Plans
--EXECUTE CreatePlanSP
--EXECUTE UpdateLocalPlanFloorSP
--EXECUTE UpdatePlanNameSP
--EXECUTE GetLocalPlanSP
--EXECUTE GetPlansByOwnerSP
--EXECUTE DeletePlanSP

----Settings
--EXECUTE CreateSettingSP
--EXECUTE UpdateSettingSP
--EXECUTE GetSettingSP
--EXECUTE GetSettingsByFriendSP
--EXECUTE GetSettingsByFriendAndTagSP
--EXECUTE DeleteSettingSP

----Tags
--EXECUTE CreateTagSP
--EXECUTE UpdateTagNameSP
--EXECUTE GetTagSP
--EXECUTE GetTagsByUserSP
--EXECUTE GetTagsByThingSP
--EXECUTE GetTagsByFriendSP
--EXECUTE DeleteTagSP

----Things
--EXECUTE CreateThingSP
--EXECUTE UpdateThingNameSP
--EXECUTE UpdateThingSharedIDSP
--EXECUTE UpdateThingPublicIDSP
--EXECUTE UpdateThingLocalImageSP
--EXECUTE UpdateThingSharedImageSP
--EXECUTE UpdateThingPublicImageSP
--EXECUTE UpdateThingDimensionsSP
--EXECUTE AddThingToPlanSP
--EXECUTE UpdateThingPositionSP
--EXECUTE CreateLocalThingCopySP
--EXECUTE AddThingTagSP
--EXECUTE RemoveThingTagSP
--EXECUTE GetLocalThingSP
--EXECUTE GetThingsByPlanSP
--EXECUTE GetThingsByTagSP
--EXECUTE DeleteThingSP
